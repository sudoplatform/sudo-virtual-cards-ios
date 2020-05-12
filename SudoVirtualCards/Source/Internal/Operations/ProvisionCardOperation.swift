//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSAppSync
import SudoLogging
import SudoProfiles
import SudoUser
import SudoOperations

class ProvisionCardOperation: PlatformGroupOperation {

    // MARK: - Properties: Input

    var ownershipProof: OwnershipProofJWT?

    var publicKey: PublicKey?

    private let input: ProvisionCardInput

    // MARK: - Properties: Output

    var result: ProvisionalCard.State?

    // MARK: - Properties: Private

    private let clientRefId: String

    private unowned let appSyncClient: AWSAppSyncClient

    private unowned let userClient: SudoUserClient

    private let operationFactory: OperationFactory

    // MARK: - Lifecycle

    init(
        input: ProvisionCardInput,
        publicKey: PublicKey? = nil,
        ownershipProof: OwnershipProofJWT? = nil,
        clientRefId: String,
        appSyncClient: AWSAppSyncClient,
        userClient: SudoUserClient,
        logger: Logger,
        operationFactory: OperationFactory = OperationFactory()
    ) {
        self.input = input
        self.publicKey = publicKey
        self.ownershipProof = ownershipProof
        self.clientRefId = clientRefId
        self.appSyncClient = appSyncClient
        self.userClient = userClient
        self.operationFactory = operationFactory
        super.init(logger: logger, operations: [])
    }

    override func execute() {
        logger.debug("Provisioning card (clientRefId: \(clientRefId))")
        guard let ownershipProof = ownershipProof else {
            finishWithError(SudoVirtualCardsError.noOwnershipProofAvailable)
            return
        }
        guard let keyRingId = publicKey?.keyRingId else {
            finishWithError(SudoVirtualCardsError.localKeyPairFailure)
            return
        }

        guard let owner = try? userClient.getSubject() else {
            finishWithError(SudoVirtualCardsError.notSignedIn)
            return
        }

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
        let mutationInput = CardProvisionRequest(
            clientRefId: clientRefId,
            ownerProofs: [ownershipProof],
            keyRingId: keyRingId,
            fundingSourceId: input.fundingSourceId,
            cardHolder: input.cardHolder,
            alias: input.alias,
            billingAddress: billingAddressInput,
            currency: input.currency)
        let provisionCardMutation = CardProvisionMutation(input: mutationInput)
        let (optimisticUpdate, optimisticCleanup) = generateOptimisticBlocks(owner: owner)

        let mutationOperation = operationFactory.generateMutationOperation(
            mutation: provisionCardMutation,
            optimisticUpdate: optimisticUpdate,
            optimisticCleanup: optimisticCleanup,
            appSyncClient: appSyncClient,
            serviceErrorTransformations: [SudoVirtualCardsError.init(graphQLError:)],
            logger: logger)

        let completion = PlatformBlockOperation(logger: logger) { [weak self] in
            guard let self = self else {
                return
            }
            guard let result = mutationOperation.result else {
                return
            }
            let graphQlState = result.cardProvision.provisioningState
            self.result = ProvisionalCard.State(graphQlState)
        }

        completion.addDependency(mutationOperation)
        addOperations([mutationOperation, completion])
        super.execute()
    }

    /// Generates a `OptimisticResponseBlock` and `OptimisticCleanupBlock`.
    ///
    /// These blocks are used by the `PlatformMutationOperation` to perform a write to the store before the network call (for offline redundancy) and remove the
    /// write after a successful server mutation result.
    /// - Parameter owner: Owner ID associated with the user - retrieved from Sudo User service.
    func generateOptimisticBlocks(owner: String) -> (update: OptimisticResponseBlock, cleanup: OptimisticCleanupBlock) {
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
                            clientRefId: self.clientRefId,
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
