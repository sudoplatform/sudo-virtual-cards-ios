//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSAppSync
import SudoUser
import SudoProfiles
import SudoLogging
import SudoApiClient
import SudoOperations

/// Default Client API Endpoint for interacting with the Virtual Cards Service.
public class DefaultSudoVirtualCardsClient: SudoVirtualCardsClient {

    // MARK: - Properties

    /// Operation Queue that all associated API operations are executed on.
    var queue = PlatformOperationQueue()

    /// Used to make GraphQL requests to AWS. Injected into operations to delegate the calls.
    let appSyncClient: AWSAppSyncClient

    private static let dispatchQueue = DispatchQueue(label: "com.sudoplatform.sudo-virtual-cards-graphQL-result-handler")

    /// Used to create and delete Sudo Resource References.
    /// Unowned used since this should always outlive the lifetime of this class.
    private unowned let profilesClient: SudoProfilesClient

    /// Used to determine if the user is signed in and access the user owner ID.
    /// Unowned used since this should always outlive the lifetime of this class.
    private unowned var userClient: SudoUserClient

    let platformKeyManager: PlatformKeyManager

    private let unsealer: Unsealer

    private let operationFactory: OperationFactory

    struct WeakCancellable {
        weak var value: Cancellable?
    }

    private var subscriptions: [WeakCancellable] = []

    /// Dictionary of subscriber objects to cancel the subscription events created internally
    /// while provisioning a card. The id is the generated `clientRefId`.
    private var provisionSubscriptions: [String: Cancellable] = [:]

    /// Timeout time for a provision card.
    private let provisionTimeout: TimeInterval = 60.0

    /// Dictionary of Timers used to cancel a provision card subscription if it times out.
    private var provisionTimers: [String: Timer] = [:]

    /// Logging utility for debugging and diagnostics.
    private let logger: Logger

    // MARK: - Lifecycle

    /// Initialize a `DefaultSudoVirtualCardsClient` instance. It uses configuration parameters defined in
    /// `sudoplatformconfig.json` file located in the app bundle.
    ///
    /// - Parameters:
    ///   - keyNamespace: Namespace to use for the keys and passwords. Typically this should be the application name.
    ///   - config: Optional configuration to override AWS endpoint. It is recommended that this be left `nil`.
    ///   - userClient: SudoUserClient instance used for authentication.
    ///   - profilesClient: SudoProfilesClient instance used for creating and deleting sudo resource references.
    /// Throws:
    ///     - `SudoVirtualCardsError` if invalid config.
    public convenience init(
        keyNamespace: String,
        config: SudoVirtualCardsConfig? = nil,
        userClient: SudoUserClient,
        profilesClient: SudoProfilesClient
    ) throws {
        let appSyncClient: AWSAppSyncClient
        if let config = config {
            let authProvider = GraphQLAuthProvider(client: userClient)
            let cacheConfiguration = try AWSAppSyncCacheConfiguration()
            let appSyncConfig = try AWSAppSyncClientConfiguration(
                appSyncServiceConfig: config,
                userPoolsAuthProvider: authProvider,
                cacheConfiguration: cacheConfiguration)
            appSyncClient = try AWSAppSyncClient(appSyncConfig: appSyncConfig)
        } else {
            guard let asClient = try ApiClientManager.instance?.getClient(sudoUserClient: userClient) else {
                throw SudoVirtualCardsError.invalidConfig
            }
            appSyncClient = asClient
        }
        let platformKeyManager = DefaultPlatformKeyManager(keyNamespace: keyNamespace,
                                                            keyRingServiceName: "sudo-virtual-cards",
                                                            userClient: userClient,
                                                            logger: Logger.platformUtilitySDK)
        let unsealer = DefaultUnsealer(platformKeyManager: platformKeyManager)
        self.init(
            profilesClient: profilesClient,
            userClient: userClient,
            appSyncClient: appSyncClient,
            platformKeyManager: platformKeyManager,
            unsealer: unsealer)
    }

    /// Initialize a `DefaultSudoVirtualCardsClient` instance.
    ///
    /// This is used both internally as the 'true' init, as well as for injecting mock objects.
    ///
    /// - Parameters:
    ///   - appSyncClient: Client used to interface with the virtualCards app sync service.
    ///   - logger: Logging object.
    internal init(
        profilesClient: SudoProfilesClient,
        userClient: SudoUserClient,
        appSyncClient: AWSAppSyncClient,
        platformKeyManager: PlatformKeyManager,
        unsealer: Unsealer,
        operationFactory: OperationFactory = OperationFactory(),
        logger: Logger = Logger.virtualCardsSDKLogger
    ) {
        self.profilesClient = profilesClient
        self.userClient = userClient
        self.appSyncClient = appSyncClient
        self.platformKeyManager = platformKeyManager
        self.unsealer = unsealer
        self.operationFactory = operationFactory
        self.logger = logger
    }

    public func reset() throws {
        logger.info("Resetting client state.")

        try self.appSyncClient.clearCaches(options: .init(clearQueries: true, clearMutations: true, clearSubscriptions: true))
        queue.cancelAllOperations()
        subscriptions.forEach { $0.value?.cancel() }
        subscriptions.removeAll()
        provisionSubscriptions.forEach { $1.cancel() }
        provisionSubscriptions.removeAll()

        try platformKeyManager.removeAllKeys()
    }

    // MARK: - Methods

    public func provisionCardWithInput(
        _ input: ProvisionCardInput,
        completion: @escaping ClientCompletion<ProvisionalCard.State>,
        observer: ProvisionCardObservable?
    ) {
        let clientRefId = UUID().uuidString
        provisionCardWithClientRefId(
            clientRefId,
            input: input,
            completion: completion,
            observer: observer)
    }

    /// This API call is made up of 2 distinct different operation:
    /// - `GetOwnershipProofOperation`,
    /// - `ProvisionCardOperation`.
    ///
    /// `GetOwnershipProofOperation` is responsible for generating an ownership proof on the sudo's profile to associate with the sudo.
    /// `ProvisionCardOperation` is responsible for calling the create card mutation and watching for the result.
    func provisionCardWithClientRefId(
        _ clientRefId: String,
        input: ProvisionCardInput,
        completion: @escaping ClientCompletion<ProvisionalCard.State>,
        observer: ProvisionCardObservable?
    ) {
        let keyPair: KeyPair
        do {
            if let currentKeyPair = try platformKeyManager.getCurrentKeyPair() {
                keyPair = currentKeyPair
            } else {
                keyPair = try platformKeyManager.generateNewCurrentKeyPair()
            }
        } catch let error as DefaultPlatformKeyManager.PlatformKeyManagerError {
            logger.error("Failed to get current key pair: \(error)")
            switch error {
            case .noUserId:
                completion(.failure(SudoVirtualCardsError.notSignedIn))
            default:
                completion(.failure(error))
            }
            return
        } catch {
            logger.error("Failed to get local current key pair: \(error)")
            completion(.failure(CardProvisionError.localKeyPairFailure))
            return
        }

        var operations: [PlatformOperation] = []
        let registerPublicKeyOperation: RegisterPublicKeyOperation
        let getOwnershipProofOperation: GetOwnershipProofOperation
        let sudoAdapterOperation: PlatformBlockOperation
        let provisionCardOperation: ProvisionCardOperation

        registerPublicKeyOperation = operationFactory.generateRegisterPublicKeyOperation(
            keyPair: keyPair,
            appSyncClient: appSyncClient,
            logger: logger)

        getOwnershipProofOperation = operationFactory.generateGetOwnershipProofOperation(
            sudoId: input.sudoId,
            profilesClient: profilesClient,
            logger: logger)
        provisionCardOperation = operationFactory.generateProvisionCardOperation(
            input: input,
            clientRefId: clientRefId,
            appSyncClient: appSyncClient,
            userClient: userClient,
            logger: logger)
        sudoAdapterOperation = PlatformBlockOperation(logger: logger) {
            provisionCardOperation.publicKey = registerPublicKeyOperation.result
            provisionCardOperation.ownershipProof = getOwnershipProofOperation.result
        }
        sudoAdapterOperation.addDependency(registerPublicKeyOperation)
        sudoAdapterOperation.addDependency(getOwnershipProofOperation)
        provisionCardOperation.addDependency(sudoAdapterOperation)
        operations.append(contentsOf: [
            registerPublicKeyOperation,
            getOwnershipProofOperation,
            provisionCardOperation,
            sudoAdapterOperation
        ])

        var allowIdentityRetry = true
        var completionObserver: PlatformBlockObserver!
        completionObserver = PlatformBlockObserver(finishHandler: { [weak self, clientRefId] operation, errors in
            guard let self = self, !operation.isCancelled else {
                return
            }
            if let error = errors.first {
                if
                    allowIdentityRetry,
                    let validationError = error as? SudoPlatformError,
                    validationError == .identityNotVerified
                {
                    self.logger.warning("Failed to provision card, not verified - retrying.")
                    allowIdentityRetry = false
                    let refreshTokenOperation = self.operationFactory.generateRefreshTokenOperation(
                        userClient: self.userClient,
                        logger: self.logger)
                    let provisionCardOperation = self.operationFactory.generateProvisionCardOperation(
                        input: input,
                        publicKey: registerPublicKeyOperation.result,
                        ownershipProof: getOwnershipProofOperation.result,
                        clientRefId: clientRefId,
                        appSyncClient: self.appSyncClient,
                        userClient: self.userClient,
                        logger: self.logger)
                    provisionCardOperation.addDependency(refreshTokenOperation)
                    refreshTokenOperation.addObserver(completionObserver)
                    provisionCardOperation.addObserver(completionObserver)

                    self.queue.addOperations([refreshTokenOperation, provisionCardOperation], waitUntilFinished: false)
                    return
                }
                self.logger.error("Failed to provision card: \(error)")
                self.provisionTimers.removeValue(forKey: clientRefId)?.invalidate()
                self.provisionSubscriptions.removeValue(forKey: clientRefId)?.cancel()
                operations.forEach { $0.cancel() }
                completion(.failure(error))
                return
            }
            // All generic work done, check if provision card op or return
            guard let operation = operation as? ProvisionCardOperation else {
                return
            }
            guard let state = operation.result else {
                self.logger.error("Unexpected error - no result or error received from ProvisionCardOperation")
                self.provisionTimers.removeValue(forKey: clientRefId)?.invalidate()
                self.provisionSubscriptions.removeValue(forKey: clientRefId)?.cancel()
                completion(.failure(CardProvisionError.provisionFailed))
                return
                }
            completion(.success(state))
        })

        operations.forEach {
            $0.addObserver(completionObserver)
        }

        if let observer = observer {
            var previousState: ProvisionalCard.State = .unknown("unintialized")
            let query = ListProvisionalCardsQuery(filter: .init(clientRefId: .init(eq: clientRefId)), limit: 100)
            var discard: Cancellable?
            discard = appSyncClient.sync(
                baseQuery: query,
                baseQueryResultHandler: { [clientRefId, weak self] (result, error) in
                    guard let self = self else {
                        return
                    }
                    if let error = error {
                        self.provisionTimers.removeValue(forKey: clientRefId)?.invalidate()
                        self.provisionSubscriptions.removeValue(forKey: clientRefId)?.cancel()
                        observer.errorOccurred(error)
                        return
                    }
                    guard let result = result?.data?.listProvisionalCards?.items.first(where: {
                        $0.clientRefId == clientRefId
                    }) else {
                        return
                    }
                    let newProvisionState = ProvisionalCard.State(result.provisioningState)
                    if newProvisionState != previousState {
                        previousState = newProvisionState
                        if newProvisionState == .completed || newProvisionState == .failed {
                            self.provisionTimers.removeValue(forKey: clientRefId)?.invalidate()
                            self.provisionSubscriptions.removeValue(forKey: clientRefId)?.cancel()
                        }

                        var card: Card?
                        if let resultCard = result.card {
                            do {
                                card = try self.unsealer.unseal(resultCard)
                            } catch {
                                self.logger.error("Failed to unseal card: \(error)")
                                self.provisionTimers.removeValue(forKey: clientRefId)?.invalidate()
                                self.provisionSubscriptions.removeValue(forKey: clientRefId)?.cancel()
                                observer.errorOccurred(error)
                                return
                            }
                        }
                        observer.provisioningStateDidChange(newProvisionState, card: card)
                }
            }, callbackQueue: DefaultSudoVirtualCardsClient.dispatchQueue,
               syncConfiguration: .init(baseRefreshIntervalInSeconds: 1))
            guard let cancellable = discard else {
                return
            }
            provisionSubscriptions[clientRefId] = cancellable
            let timeout = Timer.scheduledTimer(withTimeInterval: provisionTimeout, repeats: false) { [weak self] _ in
                self?.logger.error("Provision card (\(clientRefId)) timed out.")
                self?.provisionSubscriptions.removeValue(forKey: clientRefId)?.cancel()
            }
            provisionTimers[clientRefId] = timeout
        }
        queue.addOperations(operations, waitUntilFinished: false)
    }

    public func createFundingSource(
        withCreditCardInput input: CreditCardFundingSourceInput,
        authorizationDelegate: FundingSourceAuthorizationDelegate?,
        completion: @escaping ClientCompletion<FundingSource>
    ) {
        let operation = CreateCreditCardFundingSourceOperation(
            input: input,
            authorizationDelegate: authorizationDelegate,
            appSyncClient: appSyncClient,
            operationFactory: operationFactory,
            logger: logger)
        let completionObserver = PlatformBlockObserver(finishHandler: { _, errors in
            if let error = errors.first {
                completion(.failure(error))
                return
            }
            guard let result = operation.resultObject else {
                completion(.failure(SudoVirtualCardsError.fundingSourceCreationFailed))
                return
            }
            completion(.success(result))
        })
        operation.addObserver(completionObserver)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    public func cancelFundingSourceWithId(_ id: String, completion: @escaping ClientCompletion<FundingSource>) {
        let mutationInput = IdInput(id: id)
        let mutation = CancelFundingSourceMutation(input: mutationInput)
        let operation = operationFactory.generateMutationOperation(
            mutation: mutation,
            appSyncClient: appSyncClient,
            serviceErrorTransformations: [FundingSourceError.init(_:)],
            logger: logger)
        let observer = PlatformBlockObserver(finishHandler: { [weak logger = self.logger] _, errors in
            if let error = errors.first {
                if let conditionError = error as? PlatformOperationErrors,
                    case .conditionFailed = conditionError {
                    completion(.failure(SudoVirtualCardsError.notSignedIn))
                } else {
                    completion(.failure(error))
                }
                return
            }
            guard let result = operation.result else {
                logger?.error("CancelFundingSource failed - no result returned")
                completion(.failure(FundingSourceError.cancelFailed))
                return
            }
            let fundingSource = FundingSource(cancelFundingSource: result.cancelFundingSource)
            completion(.success(fundingSource))
        })
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    public func updateCardWithInput(_ input: UpdateCardInput, completion: @escaping ClientCompletion<Card>) {
        let keyPair: KeyPair
        do {
            guard let kp = try platformKeyManager.getCurrentKeyPair() else {
                throw PublicKeyError.publicKeyNotFound
            }
            keyPair = kp
        } catch let error as DefaultPlatformKeyManager.PlatformKeyManagerError {
            logger.error("Failed to get current key pair: \(error)")
            switch error {
            case .noUserId:
                completion(.failure(SudoVirtualCardsError.notSignedIn))
            default:
                completion(.failure(error))
            }
            return
        } catch {
            logger.error("Failed to get current key pair: \(error)")
            completion(.failure(error))
            return
        }
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
        let mutationInput = CardUpdateRequest(
            id: input.id,
            keyId: keyPair.keyId,
            cardHolder: input.cardHolder,
            billingAddress: billingAddressInput,
            alias: input.alias)
        let mutation = UpdateCardMutation(input: mutationInput)

        let operation = operationFactory.generateMutationOperation(
            mutation: mutation,
            appSyncClient: appSyncClient,
            logger: logger)
        let observer = PlatformBlockObserver(finishHandler: { [weak logger = self.logger] _, errors in
            if let error = errors.first {
                if let conditionError = error as? PlatformOperationErrors,
                    case .conditionFailed = conditionError {
                    completion(.failure(SudoVirtualCardsError.notSignedIn))
                } else {
                    completion(.failure(error))
                }
                return
            }
            guard let result = operation.result else {
                logger?.error("UpdateCard failed - no result returned")
                completion(.failure(UpdateCardError.updateFailed))
                return
            }
            do {
                let card = try self.unsealer.unseal(result.updateCard)
                completion(.success(card))
                return
            } catch {
                self.logger.error("Failed to decrypt card: \(error)")
                completion(.failure(error))
                return
            }
        })
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    public func cancelCardWithId(_ id: String, completion: @escaping ClientCompletion<Card>) {
        let keyPair: KeyPair
        do {
            guard let kp = try platformKeyManager.getCurrentKeyPair() else {
                throw PublicKeyError.publicKeyNotFound
            }
            keyPair = kp
        } catch let error as DefaultPlatformKeyManager.PlatformKeyManagerError {
            logger.error("Failed to get current key pair: \(error)")
            switch error {
            case .noUserId:
                completion(.failure(SudoVirtualCardsError.notSignedIn))
            default:
                completion(.failure(error))
            }
            return
        } catch {
            logger.error("Failed to get current key pair: \(error)")
            completion(.failure(error))
            return
        }
        let input = CardCancelRequest(id: id, keyId: keyPair.keyId)
        let mutation = CancelCardMutation(input: input)
        let operation = operationFactory.generateMutationOperation(
            mutation: mutation,
            appSyncClient: appSyncClient,
            logger: logger)
        let observer = PlatformBlockObserver(finishHandler: { [weak logger = self.logger] _, errors in
            if let error = errors.first {
                if let conditionError = error as? PlatformOperationErrors,
                    case .conditionFailed = conditionError {
                    completion(.failure(SudoVirtualCardsError.notSignedIn))
                } else {
                    completion(.failure(error))
                }
                return
            }
            guard let result = operation.result else {
                logger?.error("cancelCard failed - no result returned")
                completion(.failure(CancelCardError.cancelFailed))
                return
            }
            do {
                let card = try self.unsealer.unseal(result.cancelCard)
                completion(.success(card))
                return
            } catch {
                self.logger.error("Failed to decrypt card: \(error)")
                completion(.failure(error))
                return
            }
        })
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    public func getProvisionalCardWithId(_ id: String, cachePolicy: CachePolicy, completion: @escaping ClientCompletion<ProvisionalCard?>) {
        let query = GetProvisionalCardQuery(id: id)
        let operation = operationFactory.generateQueryOperation(query: query, appSyncClient: appSyncClient, cachePolicy: cachePolicy, logger: logger)
        let observer = PlatformBlockObserver(finishHandler: { _, errors in
            if let error = errors.first {
                if let conditionError = error as? PlatformOperationErrors,
                    case .conditionFailed = conditionError {
                    completion(.failure(SudoVirtualCardsError.notSignedIn))
                } else {
                    completion(.failure(error))
                }
                return
            }
            guard let graphQLCard = operation.result?.getProvisionalCard else {
                completion(.success(nil))
                return
            }

            var card: Card?
            if let resultCard = graphQLCard.card {
                do {
                    card = try self.unsealer.unseal(resultCard)
                } catch {
                    self.logger.error("Failed to unseal card: \(error)")
                    completion(.failure(error))
                    return
                }
            }
            let provisionalCard = ProvisionalCard(
                id: graphQLCard.id,
                createdAtEpochMs: graphQLCard.createdAtEpochMs,
                updatedAtEpochMs: graphQLCard.updatedAtEpochMs,
                clientRefId: graphQLCard.clientRefId,
                provisioningState: graphQLCard.provisioningState,
                card: card)
            completion(.success(provisionalCard))
        })
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    public func getProvisionalCardsWithFilter(
        _ filter: GetProvisionalCardsFilterInput?,
        limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy,
        completion: @escaping ClientCompletion<ListOutput<ProvisionalCard>>
    ) {
        let filter = filter?.toGraphQLFilter()
        let query = ListProvisionalCardsQuery(filter: filter, limit: limit, nextToken: nextToken)
        let operation = operationFactory.generateQueryOperation(query: query, appSyncClient: appSyncClient, cachePolicy: cachePolicy, logger: logger)
        let observer = PlatformBlockObserver(finishHandler: { _, errors in
            if let error = errors.first {
                if let conditionError = error as? PlatformOperationErrors,
                    case .conditionFailed = conditionError {
                    completion(.failure(SudoVirtualCardsError.notSignedIn))
                } else {
                    completion(.failure(error))
                }
                return
            }
            guard let listCards = operation.result?.listProvisionalCards else {
                completion(.success(ListOutput.empty))
                return
            }
            do {
                typealias UnsealedCardPairs = (provisionalCard: ListProvisionalCardsQuery.Data.ListProvisionalCard.Item, unsealedCard: Card?)
                let unsealedCardPairs: [UnsealedCardPairs] = try listCards.items.map({
                    var unsealedCard: Card?
                    if let sealedCard = $0.card {
                        unsealedCard = try self.unsealer.unseal(sealedCard)
                    }
                    return (provisionalCard: $0, unsealedCard: unsealedCard)
                })
                let provisionalCards = unsealedCardPairs.map { (provisionalCard, unsealedCard) in
                    return ProvisionalCard(
                        id: provisionalCard.id,
                        createdAtEpochMs: provisionalCard.createdAtEpochMs,
                        updatedAtEpochMs: provisionalCard.updatedAtEpochMs,
                        clientRefId: provisionalCard.clientRefId,
                        provisioningState: provisionalCard.provisioningState,
                        card: unsealedCard)
                }
                let nextToken = listCards.nextToken
                completion(.success(ListOutput(items: provisionalCards, nextToken: nextToken)))
            } catch {
                self.logger.error("Failed to Decrypt cards: \(error)")
                completion(.failure(error))
                return
            }
        })
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    public func getCardWithId(_ id: String, cachePolicy: CachePolicy, completion: @escaping ClientCompletion<Card?>) {
        let keyPair: KeyPair
        do {
            guard let kp = try platformKeyManager.getCurrentKeyPair() else {
                throw PublicKeyError.publicKeyNotFound
            }
            keyPair = kp
        } catch let error as DefaultPlatformKeyManager.PlatformKeyManagerError {
            logger.error("Failed to get current key pair: \(error)")
            switch error {
            case .noUserId:
                completion(.failure(SudoVirtualCardsError.notSignedIn))
            default:
                completion(.failure(error))
            }
            return
        } catch {
            logger.error("Failed to get current key pair: \(error)")
            completion(.failure(error))
            return
        }
        let query = GetCardQuery(id: id, keyId: keyPair.keyId)
        let operation = operationFactory.generateQueryOperation(query: query, appSyncClient: appSyncClient, cachePolicy: cachePolicy, logger: logger)
        let observer = PlatformBlockObserver(finishHandler: { _, errors in
            if let error = errors.first {
                if let conditionError = error as? PlatformOperationErrors,
                    case .conditionFailed = conditionError {
                    completion(.failure(SudoVirtualCardsError.notSignedIn))
                } else {
                    completion(.failure(error))
                }
                return
            }
            guard let graphQLCard = operation.result?.getCard else {
                completion(.success(nil))
                return
            }
            do {
                let card = try self.unsealer.unseal(graphQLCard)
                completion(.success(card))
                return
            } catch {
                self.logger.error("Failed to decrypt card: \(error)")
                completion(.failure(error))
                return
            }
        })
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    public func getCardsWithFilter(
        _ filter: GetCardsFilterInput?,
        limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy,
        completion: @escaping ClientCompletion<ListOutput<Card>>
    ) {
        let filter = filter?.toGraphQLFilter()
        let query = ListCardsQuery(filter: filter, limit: limit, nextToken: nextToken)
        let operation = operationFactory.generateQueryOperation(query: query, appSyncClient: appSyncClient, cachePolicy: cachePolicy, logger: logger)
        let observer = PlatformBlockObserver(finishHandler: { _, errors in
            if let error = errors.first {
                if let conditionError = error as? PlatformOperationErrors,
                    case .conditionFailed = conditionError {
                    completion(.failure(SudoVirtualCardsError.notSignedIn))
                } else {
                    completion(.failure(error))
                }
                return
            }
            guard let listCards = operation.result?.listCards else {
                completion(.success(ListOutput.empty))
                return
            }
            do {
                let cards = try listCards.items.map(self.unsealer.unseal)
                let nextToken = listCards.nextToken
                completion(.success(ListOutput(items: cards, nextToken: nextToken)))
                return
            } catch {
                self.logger.error("Failed to decrypt cards: \(error)")
                completion(.failure(error))
                return
            }
        })
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    public func getFundingSourceWithId(_ id: String, cachePolicy: CachePolicy, completion: @escaping ClientCompletion<FundingSource?>) {
        let query = GetFundingSourceQuery(id: id)
        let operation = operationFactory.generateQueryOperation(
            query: query,
            appSyncClient: appSyncClient,
            cachePolicy: cachePolicy,
            logger: logger)
        let observer = PlatformBlockObserver(finishHandler: { _, errors in
            if let error = errors.first {
                if let conditionError = error as? PlatformOperationErrors,
                    case .conditionFailed = conditionError {
                    completion(.failure(SudoVirtualCardsError.notSignedIn))
                } else {
                    completion(.failure(error))
                }
                return
            }
            guard let getFundingSource = operation.result?.getFundingSource else {
                completion(.success(nil))
                return
            }
            let fundingSource = FundingSource(getFundingSource: getFundingSource)
            completion(.success(fundingSource))
        })
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    public func getFundingSourcesWithLimit(
        _ limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy,
        completion: @escaping ClientCompletion<ListOutput<FundingSource>>
    ) {
        let query = ListFundingSourcesQuery(limit: limit, nextToken: nextToken)
        let operation = operationFactory.generateQueryOperation(
            query: query,
            appSyncClient: appSyncClient,
            cachePolicy: cachePolicy,
            logger: logger)
        let observer = PlatformBlockObserver(finishHandler: { _, errors in
            if let error = errors.first {
                if let conditionError = error as? PlatformOperationErrors,
                    case .conditionFailed = conditionError {
                    completion(.failure(SudoVirtualCardsError.notSignedIn))
                } else {
                    completion(.failure(error))
                }
                return
            }
            guard let listFundingSources = operation.result?.listFundingSources else {
                completion(.success(ListOutput.empty))
                return
            }
            let fundingSources = listFundingSources.items.map(FundingSource.init)
            let nextToken = listFundingSources.nextToken
            completion(.success(ListOutput(items: fundingSources, nextToken: nextToken)))
        })
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    public func getTransactionWithId(_ id: String, cachePolicy: CachePolicy, completion: @escaping ClientCompletion<Transaction?>) {
        let keyPair: KeyPair
        do {
            guard let kp = try platformKeyManager.getCurrentKeyPair() else {
                throw PublicKeyError.publicKeyNotFound
            }
            keyPair = kp
        } catch let error as DefaultPlatformKeyManager.PlatformKeyManagerError {
            logger.error("Failed to get current key pair: \(error)")
            switch error {
            case .noUserId:
                completion(.failure(SudoVirtualCardsError.notSignedIn))
            default:
                completion(.failure(error))
            }
            return
        } catch {
            logger.error("Failed to get current key pair: \(error)")
            completion(.failure(error))
            return
        }
        let query = GetTransactionQuery(id: id, keyId: keyPair.keyId)
        let operation = operationFactory.generateQueryOperation(query: query, appSyncClient: appSyncClient, cachePolicy: cachePolicy, logger: logger)
        let observer = PlatformBlockObserver(finishHandler: { _, errors in
            if let error = errors.first {
                if let conditionError = error as? PlatformOperationErrors,
                    case .conditionFailed = conditionError {
                    completion(.failure(SudoVirtualCardsError.notSignedIn))
                } else {
                    completion(.failure(error))
                }
                return
            }
            guard let getTransaction = operation.result?.getTransaction else {
                completion(.success(nil))
                return
            }

            do {
                let transaction = try self.unsealer.unseal(getTransaction)
                completion(.success(transaction))
                return
            } catch {
                self.logger.error("failed to decode transaction: \(error)")
                completion(.failure(error))
                return
            }
        })
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    public func getTransactionsWithFilter(
        _ filter: GetTransactionsFilterInput?,
        limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy,
        completion: @escaping ClientCompletion<ListOutput<Transaction>>
    ) {
        // sequenceId has no affect on this, but we still want to honor other filters.
        let graphQLFilter = filter?.toGraphQLFilter()
        let query = ListTransactionsQuery(filter: graphQLFilter, limit: limit, nextToken: nextToken)
        let operation = operationFactory.generateQueryOperation(query: query, appSyncClient: appSyncClient, cachePolicy: cachePolicy, logger: logger)
        let observer = PlatformBlockObserver(finishHandler: { _, errors in
            if let error = errors.first {
                if let conditionError = error as? PlatformOperationErrors,
                    case .conditionFailed = conditionError {
                    completion(.failure(SudoVirtualCardsError.notSignedIn))
                } else {
                    completion(.failure(error))
                }
                return
            }
            guard let listTransactions = operation.result?.listTransactions else {
                completion(.success(ListOutput.empty))
                return
            }
            var transactions: [Transaction]
            do {
                transactions = try listTransactions.items.map(self.unsealer.unseal(_:))
            } catch {
                self.logger.error("failed to decode transactions: \(error)")
                completion(.failure(error))
                return
            }
            if let sequenceIdFilter = filter?.sequenceId {
                let localFilter = LocalTransactionFilter(filter: sequenceIdFilter, attribute: .sequenceId)
                transactions = localFilter.execute(transactions)
            }

            let nextToken = listTransactions.nextToken
            completion(.success(ListOutput(items: transactions, nextToken: nextToken)))
        })
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    @discardableResult
    public func subscribeToTransactionUpdates(
        statusChangeHandler: SudoSubscriptionStatusChangeHandler?,
        resultHandler: @escaping ClientCompletion<Transaction>
    ) throws -> Cancellable? {
        guard let owner = try? userClient.getSubject() else {
            throw SudoVirtualCardsError.notSignedIn
        }
        let subscription = OnTransactionUpdateSubscription(owner: owner)

        let discard = try? appSyncClient.subscribe(
            subscription: subscription,
            statusChangeHandler: { status in
                let platformStatus = PlatformSubscriptionStatus(status: status)
                statusChangeHandler?(platformStatus)
            },
            resultHandler: { (result, _, error) in
                if let error = error {
                    resultHandler(.failure(error))
                    return
                }
                guard let result = result else {
                    resultHandler(.failure(SudoPlatformError.internalError(cause: "Error and result cannot both be nil.")))
                    return
                }
                if let errors = result.errors, let error = errors.first {
                    resultHandler(.failure(SudoPlatformError(error)))
                    return
                }
                guard let data = result.data else {
                    resultHandler(.failure(SudoPlatformError.internalError(cause: "GraphQL error and data cannot be nil")))
                    return
                }
                guard let onTransactionUpdate = data.onTransactionUpdate else {
                    resultHandler(.failure(SudoPlatformError.internalError(cause: "Failed to get transaction.")))
                    return
                }
                do {
                    let transaction = try self.unsealer.unseal(onTransactionUpdate)
                    resultHandler(.success(transaction))
                } catch {
                    self.logger.error("Failed to decode transaction: \(error)")
                    resultHandler(.failure(error))
                    return
                }
        })
        guard let cancellable = discard else {
            return nil
        }
        subscriptions.append(.init(value: cancellable))
        return cancellable
    }

    // MARK: Internal - Public Key Lifecycle

    /// Register a client generated public key data to the virtual cards service.
    ///
    /// Upon success, this will return a receipt of the resource created on virtual cards service to be used when performing operations that require a
    /// public key `keyRingId`.
    ///
    /// - Parameter input: Input fields for uploading the public key.
    /// - Returns:
    ///     - Success: Public key resource that is now registered on the virtual cards service.
    ///     - Failure:
    ///         - SudoPlatformError.
    ///         - PublicKeyError.
    func registerPublicKeyWithInput(
        _ input: RegisterPublicKeyInput,
        completion: @escaping ClientCompletion<PublicKey>
    ) {
        let mutationInput = CreatePublicKeyInput(
            keyId: input.keyId,
            keyRingId: input.keyRingId,
            algorithm: input.algorithm,
            publicKey: input.publicKey)
        let mutation = CreatePublicKeyForVirtualCardsMutation(input: mutationInput)
        let operation = operationFactory.generateMutationOperation(mutation: mutation, appSyncClient: appSyncClient, logger: logger)
        let observer = PlatformBlockObserver(finishHandler: { [weak logger = self.logger] _, errors in
            if let error = errors.first {
                if let conditionError = error as? PlatformOperationErrors,
                    case .conditionFailed = conditionError {
                    completion(.failure(SudoVirtualCardsError.notSignedIn))
                } else {
                    completion(.failure(error))
                }
                return
            }
            guard let result = operation.result else {
                logger?.error("createPublicKey failed - no result returned")
                completion(.failure(PublicKeyError.registerFailed))
                return
            }
            let publicKey = PublicKey(createPublicKeyForVirtualCards: result.createPublicKeyForVirtualCards)
            completion(.success(publicKey))
        })
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    /// Delete a key that has been previously registered using `registerPublicKeyWithId(_:completion:)`.
    ///
    /// If an `id` is supplied that is not associated with any public key resource on the virtual cards service, a `PublicKeyError.publicKeyNotFound` will be
    /// returned.
    ///
    /// - Parameter id: Id associated with the successfully registered returned public key from `registerPublicKeyWithId(_:completion:)`.
    /// - Returns:
    ///     - Success: Public key resource that was deleted on the virtual card service.
    ///     - Failure:
    ///         - SudoPlatformError.
    ///         - PublicKeyError.
    func deletePublicKeyWithId(_ id: String, completion: @escaping ClientCompletion<PublicKey>) {
        let mutationInput = DeletePublicKeyInput(keyId: id)
        let mutation = DeletePublicKeyForVirtualCardsMutation(input: mutationInput)
        let operation = operationFactory.generateMutationOperation(mutation: mutation, appSyncClient: appSyncClient, logger: logger)
        let observer = PlatformBlockObserver(finishHandler: {[weak logger = self.logger] _, errors in
            if let error = errors.first {
                if let conditionError = error as? PlatformOperationErrors,
                    case .conditionFailed = conditionError {
                    completion(.failure(SudoVirtualCardsError.notSignedIn))
                } else {
                    completion(.failure(error))
                }
                return
            }
            guard let result = operation.result else {
                logger?.error("deletePublicKey failed - no result received")
                completion(.failure(PublicKeyError.deleteFailed))
                return
            }
            guard let graphQLPublicKey = result.deletePublicKeyForVirtualCards else {
                logger?.error("deletePublicKey failed - Public key not found")
                completion(.failure(PublicKeyError.publicKeyNotFound))
                return
            }
            let publicKey = PublicKey(deletePublicKeyForVirtualCards: graphQLPublicKey)
            completion(.success(publicKey))
        })
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    /// Get the public key associated with the registered public key on the virtual cards service.
    ///
    /// - Parameter id: Id associated with the public key.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `useCache`, please be aware that this
    ///                          will only return cached results of similar exact API calls.
    /// - Returns:
    ///     - Success: `PublicKey` associated with `id`, or `nil` if the public key cannot be found.
    ///     - Failure:
    ///         - SudoPlatformError.
    func getPublicKeyWithId(_ id: String, cachePolicy: CachePolicy, completion: @escaping ClientCompletion<PublicKey?>) {
        let query = GetPublicKeyForVirtualCardsQuery(keyId: id)
        let operation = operationFactory.generateQueryOperation(query: query, appSyncClient: appSyncClient, cachePolicy: cachePolicy, logger: logger)
        let observer = PlatformBlockObserver(finishHandler: { _, errors in
            if let error = errors.first {
                if let conditionError = error as? PlatformOperationErrors,
                    case .conditionFailed = conditionError {
                    completion(.failure(SudoVirtualCardsError.notSignedIn))
                } else {
                    completion(.failure(error))
                }
                return
            }
            guard let graphQLPublicKey = operation.result?.getPublicKeyForVirtualCards else {
                completion(.success(nil))
                return
            }
            let publicKey = PublicKey(getPublicKeyForVirtualCards: graphQLPublicKey)
            completion(.success(publicKey))
        })
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    /// Get a list of public keys. If no public keys can be found, an empty list will be returned.
    ///
    /// - Parameter limit: Number of public keys to return. If `nil`, the limit is 10.
    /// - Parameter nextToken: Generated token by previous calls to `getPublicKeys(withLimit:nextToken:cachePolicy:completion)`.
    ///                        This is used for pagination. This value should be pre-generated from a previous pagination call,
    ///                        otherwise it will throw an error.
    ///                        It is important to note that the same structured API call should be used if using a previously
    ///                        generated `nextToken`.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `useCache`, please be aware that this
    ///                          will only return cached results of similar exact API calls.
    /// - Returns:
    ///     - Success: `PublicKey`s associated with the user, or empty array if no public keys can be found.
    ///     - Failure:
    ///         - SudoPlatformError.
    func getPublicKeys(
        withLimit limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy,
        completion: @escaping ClientCompletion<ListOutput<PublicKey>>
    ) {
        let query = GetPublicKeysForVirtualCardsQuery(limit: limit, nextToken: nextToken)
        let operation = operationFactory.generateQueryOperation(query: query, appSyncClient: appSyncClient, cachePolicy: cachePolicy, logger: logger)
        let observer = PlatformBlockObserver(finishHandler: { _, errors in
            if let error = errors.first {
                if let conditionError = error as? PlatformOperationErrors,
                    case .conditionFailed = conditionError {
                    completion(.failure(SudoVirtualCardsError.notSignedIn))
                } else {
                    completion(.failure(error))
                }
                return
            }
            guard let getPublicKeys = operation.result?.getPublicKeysForVirtualCards else {
                completion(.success(ListOutput.empty))
                return
            }
            let publicKeys = getPublicKeys.items.map(PublicKey.init)
            let nextToken = getPublicKeys.nextToken
            completion(.success(ListOutput(items: publicKeys, nextToken: nextToken)))
        })
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    /// Get a list of public keys associated with the key ring id generated by `registerPublicKeyWithId(_:completion:)`.
    /// If no public keys can be found, an empty list will be returned.
    ///
    /// - Parameter withKeyRingId: The generated key ring Id generated by `registerPublicKeyWithId(_:completion:)`.
    /// - Parameter limit: Number of public keys to return. If `nil`, the limit is 10.
    /// - Parameter nextToken: Generated token by previous calls to `getPublicKeys(withKeyRingId:limit:nextToken:cachePolicy:completion)`.
    ///                        This is used for pagination. This value should be pre-generated from a previous pagination call,
    ///                        otherwise it will throw an error.
    ///                        It is important to note that the same structured API call should be used if using a previously
    ///                        generated `nextToken`.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `useCache`, please be aware that this
    ///                          will only return cached results of similar exact API calls.
    /// - Returns:
    ///     - Success: `PublicKey`s associated with the `keyRingId`, or empty array if no public keys can be found.
    ///     - Failure:
    ///         - SudoPlatformError.
    func getPublicKeys(
        withKeyRingId keyRingId: String,
        limit: Int? = nil,
        nextToken: String? = nil,
        cachePolicy: CachePolicy,
        completion: @escaping ClientCompletion<ListOutput<PublicKey>>
    ) {
        let query = GetKeyRingForVirtualCardsQuery(keyRingId: keyRingId, limit: limit, nextToken: nextToken)
        let operation = operationFactory.generateQueryOperation(query: query, appSyncClient: appSyncClient, cachePolicy: cachePolicy, logger: logger)
        let observer = PlatformBlockObserver(finishHandler: { _, errors in
            if let error = errors.first {
                if let conditionError = error as? PlatformOperationErrors,
                    case .conditionFailed = conditionError {
                    completion(.failure(SudoVirtualCardsError.notSignedIn))
                } else {
                    completion(.failure(error))
                }
                return
            }
            guard let getPublicKeys = operation.result?.getKeyRingForVirtualCards else {
                completion(.success(ListOutput.empty))
                return
            }
            let publicKeys = getPublicKeys.items.map(PublicKey.init)
            let nextToken = getPublicKeys.nextToken
            completion(.success(ListOutput(items: publicKeys, nextToken: nextToken)))
        })
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    // MARK: Internal - Utility

    /// Call to UserClient to refresh tokens.
    ///
    /// Gets the refresh token from the user client and attempts to refresh.
    /// Will throw a `notSignedIn` Error if the the refresh token cannot be found.
    ///
    /// - Returns:
    ///   - Success: Tokens that have been refreshed.
    ///   - Failure: Failed to refresh tokens and returns cause.
    func refreshIdentityToken(_ completion: @escaping ClientCompletion<AuthenticationTokens>) throws {
        guard let refreshToken = try userClient.getRefreshToken() else {
            throw SudoVirtualCardsError.notSignedIn
        }
        try userClient.refreshTokens(refreshToken: refreshToken, completion: { result in
            switch result {
            case let .success(tokens):
                completion(.success(tokens))
            case let .failure(cause):
                completion(.failure(cause))
            }
        })
    }
}
