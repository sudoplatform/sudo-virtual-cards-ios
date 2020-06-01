//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSAppSync
import SudoUser
import SudoOperations
import SudoLogging

/// Abstraction of the SDKs capabilities surrounding `Card` access/manipulation with virtual cards service.
class CardService {

    // MARK: - Supplementary

    /// Typealias for the result returned from a list operation for cards.
    typealias CardList = ListOutput<Card>

    /// Default values used in `CardService`.
    enum Defaults {
        /// Limit used when listing cards. 100 was set as it is unlikely a user will go over this number.
        static let provisionalCardListLimit = 100
        /// Timeout for a provision card observer before it is removed.
        static let provisionTimeout = 60.0
    }

    // MARK: - Properties

    /// App Sync Client used to interact with the GraphQL endpoint of the virtual cards service.
    unowned var appSyncClient: AWSAppSyncClient

    /// Operation factory used to generate operations.
    unowned var operationFactory: OperationFactory

    /// Unsealer used to unseal card data that has been encrypted.
    unowned var unsealer: Unsealer

    /// Logs errors and diagnostic information.
    var logger: Logger

    /// Operation queue used by the `CardService`.
    var queue: PlatformOperationQueue = PlatformOperationQueue()

    /// Dictionary of Timers used to cancel a provision card subscription if it times out.
    var provisionTimers: [String: Timer] = [:]

    /// Dictionary of subscriber objects to cancel the subscription events created internally
    /// while provisioning a card. The id is the generated `clientRefId`.
    var provisionSubscriptions: [String: Cancellable] = [:]

    // MARK: - Lifecycle

    /// Initialize an instance of `CardService`.
    init(appSyncClient: AWSAppSyncClient, operationFactory: OperationFactory, unsealer: Unsealer, logger: Logger = .virtualCardsSDKLogger) {
        self.appSyncClient = appSyncClient
        self.operationFactory = operationFactory
        self.unsealer = unsealer
        self.logger = logger
    }

    /// Cancel all operations on the `CardService` operation queue.
    func cancelAllOperations() {
        queue.cancelAllOperations()
    }

    /// Cancel all subscriptions in `CardService`.
    func clearSubscriptions() {
        provisionSubscriptions.keys.forEach {
            self.removeProvisionObserver(withClientRefId: $0)
        }
    }

    // MARK: - CardService

    /// Create a card.
    ///
    /// Calls the mutation to create a card against the GraphQL endpoint of the virtual cards service.
    ///
    /// - Parameters:
    ///   - input: Input supplied by the user.
    ///   - publicKey: Registered public key used to encrypt the card information.
    ///   - owner: Owner identifier of user. This is the user's account identifier.
    ///   - ownershipProof: Ownership proof of the user.
    ///   - clientRefId: Client reference identifier generated by the `DefaultSudoVirtualCardsClient`.
    /// - Returns:
    ///     - Success: The cards provisioning state (this will be `.provisioning`).
    ///     - Failure: Any `Error` that may have occurred during the provisioning of the card, either internally or from the service.
    func create(
        withInput input: ProvisionCardInput,
        publicKey: PublicKey,
        owner: String,
        ownershipProof: OwnershipProofJWT,
        clientRefId: String,
        completion: @escaping ClientCompletion<ProvisionalCard.State>
    ) {
        let request = mutationRequestFromInput(input, clientRefId: clientRefId, ownershipProof: ownershipProof, keyRingId: publicKey.keyRingId)
        let mutation = CardProvisionMutation(input: request)
        let (optimisticUpdate, optimisticCleanup) = generateOptimisticBlocks(owner: owner, clientRefId: clientRefId)
        let operation = operationFactory.generateMutationOperation(
            mutation: mutation,
            optimisticUpdate: optimisticUpdate,
            optimisticCleanup: optimisticCleanup,
            appSyncClient: appSyncClient,
            serviceErrorTransformations: [SudoVirtualCardsError.init(graphQLError:)],
            logger: logger
        )
        let completionObserver = PlatformBlockObserver(finishHandler: { [weak operation] _, errors in
            if let error = errors.first {
                completion(.failure(error))
                return
            }
            guard let result = operation?.result else {
                return
            }
            let state = ProvisionalCard.State(result.cardProvision.provisioningState)
            completion(.success(state))
        })
        operation.addObserver(completionObserver)
        queue.addOperation(operation)
    }

    /// Add a provision observer to watch for a card provisioning event with the `clientRefId`.
    /// - Parameters:
    ///   - observer: Observer to add to service.
    ///   - clientRefId: Client reference identifier to watch events for.
    func addProvisionObserver(_ observer: ProvisionCardObservable, clientRefId: String) {
        var previousState: ProvisionalCard.State = .unknown("uninitialized")
        let filter = ProvisionalCardFilterInput(clientRefId: .init(eq: clientRefId))
        let query = ListProvisionalCardsQuery(filter: filter, limit: Defaults.provisionalCardListLimit)
        var discard: Cancellable?
        discard = appSyncClient.sync(
            baseQuery: query,
            baseQueryResultHandler: { [ clientRefId, weak self, weak observer] result, error in
                guard
                    let weakSelf = self,
                    let observer = observer
                else {
                    return
                }
                if let error = error {
                    weakSelf.removeProvisionObserver(withClientRefId: clientRefId)
                    observer.errorOccurred(error)
                    return
                }
                guard let result = result?.data?.listProvisionalCards?.items.first(where: { $0.clientRefId == clientRefId}) else {
                    return
                }
                let newProvisionState = ProvisionalCard.State(result.provisioningState)
                guard newProvisionState != previousState else {
                    return
                }
                previousState = newProvisionState
                if newProvisionState == .completed || newProvisionState == .failed {
                    weakSelf.removeProvisionObserver(withClientRefId: clientRefId)
                }
                var card: Card?
                if let resultCard = result.card {
                    do {
                        card = try weakSelf.unsealer.unseal(resultCard)
                    } catch {
                        weakSelf.logger.error("Failed to unseal card: \(error)")
                        weakSelf.removeProvisionObserver(withClientRefId: clientRefId)
                        observer.errorOccurred(error)
                        return
                    }
                }
                observer.provisioningStateDidChange(newProvisionState, card: card)
            },
            syncConfiguration: .init(baseRefreshIntervalInSeconds: 1)
        )
        guard let cancellable = discard else {
            return
        }
        provisionSubscriptions[clientRefId] = cancellable
        let timeout = Timer.scheduledTimer(withTimeInterval: Defaults.provisionTimeout, repeats: false) { [weak self] _ in
            self?.logger.error("Provision card (\(clientRefId)) timed out.")
            self?.removeProvisionObserver(withClientRefId: clientRefId)
        }
        provisionTimers[clientRefId] = timeout
    }

    /// Remove a provision observer from the service with the `clientRefId`.
    func removeProvisionObserver(withClientRefId clientRefId: String) {
        provisionTimers.removeValue(forKey: clientRefId)?.invalidate()
        provisionSubscriptions.removeValue(forKey: clientRefId)?.cancel()
    }

    // MARK: - Helpers: Create

    /// Utility method to transform the `create` methods inputs to the necessary format for the graphql mutation `CardProvisionMutation`.
    func mutationRequestFromInput(
        _ input: ProvisionCardInput,
        clientRefId: String,
        ownershipProof: OwnershipProofJWT,
        keyRingId: String
    ) -> CardProvisionRequest {
        // Create GraphQL Mutation Input
        // Deals with the weird null vs undefined of js.
        let billingAddressInput: AddressInput??
        if let address = input.billingAddress {
            billingAddressInput = AddressInput(
                addressLine1: address.addressLine1,
                addressLine2: address.addressLine2,
                city: address.city,
                state: address.state,
                postalCode: address.postalCode,
                country: address.country)
        } else {
            billingAddressInput = Optional(nil)
        }
        let request = CardProvisionRequest(
            clientRefId: clientRefId,
            ownerProofs: [ownershipProof],
            keyRingId: keyRingId,
            fundingSourceId: input.fundingSourceId,
            cardHolder: input.cardHolder,
            alias: input.alias,
            billingAddress: billingAddressInput,
            currency: input.currency
        )
        return request
    }

    /// Generates a `OptimisticResponseBlock` and `OptimisticCleanupBlock`.
    ///
    /// These blocks are used by the `PlatformMutationOperation` to perform a write to the store before the network call (for offline redundancy) and remove the
    /// write after a successful server mutation result.
    /// - Parameter owner: Owner ID associated with the user - retrieved from Sudo User service.
    func generateOptimisticBlocks(owner: String, clientRefId: String) -> (update: OptimisticResponseBlock, cleanup: OptimisticCleanupBlock) {
        let optimisticId = UUID().uuidString
        let update: OptimisticResponseBlock = { transaction in
            let query = ListProvisionalCardsQuery()
            do {
                try transaction?.update(
                    query: query, { (data: inout ListProvisionalCardsQuery.Data) in
                        let nowSinceEpochMs = Date().millisecondsSince1970
                        let newItem = ListProvisionalCardsQuery.Data.ListProvisionalCard.Item(
                            id: optimisticId,
                            owner: owner,
                            version: 1,
                            createdAtEpochMs: nowSinceEpochMs,
                            updatedAtEpochMs: nowSinceEpochMs,
                            clientRefId: clientRefId,
                            provisioningState: .provisioning)
                        data.listProvisionalCards?.items.append(newItem)
                    }
                )
            } catch {
                self.logger.error("failed to optimistically write record to cache: \(error)")
            }
        }
        let cleanup: OptimisticCleanupBlock = { transaction in
            let query = ListProvisionalCardsQuery()
            try transaction.update(query: query) { (data: inout ListProvisionalCardsQuery.Data) in
                guard let items = data.listProvisionalCards?.items else {
                    return
                }
                if let optimisticIndex = items.firstIndex(where: { $0.id == optimisticId }) {
                    data.listProvisionalCards?.items.remove(at: optimisticIndex)
                }
            }
        }
        return (update, cleanup)
    }

}
