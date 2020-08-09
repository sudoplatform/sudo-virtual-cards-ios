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

    // MARK: - Properties: - Services

    var fundingSourceService: FundingSourceService

    /// Abstraction of the SDKs capabilities surrounding `Card` access/manipulation with virtual cards service.
    var cardService: CardService

    /// Abstraction of the SDKs capabilities surrounding `Transaction` access/manipulation with virtual cards service.
    var transactionService: TransactionService

    /// Abstraction of the SDKs capabilities surrounding `PublicKey` access/manipulation with virtual cards service.
    var publicKeyService: PublicKeyService

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
        self.fundingSourceService = FundingSourceService(appSyncClient: appSyncClient, operationFactory: operationFactory, logger: logger)
        self.cardService = CardService(appSyncClient: appSyncClient, operationFactory: operationFactory, unsealer: unsealer, logger: logger)
        self.transactionService = TransactionService(
            userClient: userClient,
            appSyncClient: appSyncClient,
            unsealer: unsealer,
            operationFactory: operationFactory,
            logger: logger
        )
        self.publicKeyService = PublicKeyService(
            appSyncClient: appSyncClient,
            operationFactory: operationFactory,
            platformKeyManager: platformKeyManager,
            logger: logger
        )
    }

    public func reset() throws {
        logger.info("Resetting client state.")

        try self.appSyncClient.clearCaches(options: .init(clearQueries: true, clearMutations: true, clearSubscriptions: true))
        cardService.cancelAllOperations()
        cardService.clearSubscriptions()
        transactionService.clearSubscriptions()
        transactionService.cancelAllOperations()
        publicKeyService.cancelAllOperations()
        queue.cancelAllOperations()
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
        // Get keyPair or fail.
        let keyPair: KeyPair
        do {
            let keyPairResult = publicKeyService.getCurrentKeyPair(generateKeyIfNotFound: true)
            keyPair = try keyPairResult.get()
        } catch {
            let error = convertToSudoVirtualCardsError(error)
            completion(.failure(error))
            return
        }
        // Get the owner identifier, or fail.
         guard let owner = try? userClient.getSubject() else {
            completion(.failure(SudoVirtualCardsError.notSignedIn))
            return
        }

        // Add observer, if it has been passed in.
        if let observer = observer {
            cardService.addProvisionObserver(observer, clientRefId: clientRefId)
        }

        // Construct operations.
        let registerPublicKeyOperation = operationFactory.generateRegisterPublicKeyOperation(
            keyPair: keyPair,
            publicKeyService: publicKeyService,
            logger: logger
        )
        let getOwnershipProofOperation = operationFactory.generateGetOwnershipProofOperation(
            sudoId: input.sudoId,
            profilesClient: profilesClient,
            logger: logger
        )
        let provisionCardOperation = operationFactory.generateProvisionCardOperation(
            input: input,
            owner: owner,
            clientRefId: clientRefId,
            cardService: cardService,
            logger: logger
        )

        // Add dependencies.
        provisionCardOperation.addDependency(registerPublicKeyOperation)
        provisionCardOperation.addDependency(getOwnershipProofOperation)

        let provisionCardCompletion = generateProvisionCardCompletionObserver(
            input: input,
            owner: owner,
            clientRefId: clientRefId,
            registerPublicKeyOperation: registerPublicKeyOperation,
            getOwnershipProofOperation: getOwnershipProofOperation,
            completion: completion
        )
        provisionCardOperation.addObserver(provisionCardCompletion)

        queue.addOperations([registerPublicKeyOperation, getOwnershipProofOperation, provisionCardOperation], waitUntilFinished: false)
    }

    public func createFundingSource(
        withCreditCardInput input: CreditCardFundingSourceInput,
        authorizationDelegate: FundingSourceAuthorizationDelegate?,
        completion: @escaping ClientCompletion<FundingSource>
    ) {
        /// Create operations.
        let getConfigOperation = GetFundingSourceClientConfigurationOperation(fundingSourceService: fundingSourceService, logger: logger)
        let setupInput = SetupFundingSourceInput(type: .creditCard, currency: "USD")
        let setupOperation = SetupFundingSourceOperation(input: setupInput, fundingSourceService: fundingSourceService, logger: logger)
        let stripeIntentOperation = GetStripeIntentOperation(inputDetails: input, authorizationDelegate: authorizationDelegate, logger: logger)
        let completeOperation = CompleteFundingSourceOperation(fundingSourceService: fundingSourceService, logger: logger)

        /// Add signed in conditions to operations that have call out to virtual cards service.
        let signedInCondition = SignedInCondition(userClient: userClient)
        getConfigOperation.addCondition(signedInCondition)
        setupOperation.addCondition(signedInCondition)
        completeOperation.addCondition(signedInCondition)

        /// Add inter-operation dependencies.
        stripeIntentOperation.addDependency(getConfigOperation)
        stripeIntentOperation.addDependency(setupOperation)
        completeOperation.addDependency(setupOperation)
        completeOperation.addDependency(stripeIntentOperation)

        /// Build and attach completion observer to `completeOperation`.
        let completionObserver = PlatformBlockObserver(finishHandler: { [weak self, weak completeOperation] _, errors in
            guard let weakSelf = self, let operation = completeOperation else {
                return
            }
            if let error = errors.first {
                let error = weakSelf.convertToSudoVirtualCardsError(error)
                completion(.failure(error))
                return
            }
            guard let result = operation.resultObject else {
                return
            }
            completion(.success(result))
        })
        completeOperation.addObserver(completionObserver)

        queue.addOperations([
            getConfigOperation,
            setupOperation,
            stripeIntentOperation,
            completeOperation
        ], waitUntilFinished: false)
    }

    public func cancelFundingSourceWithId(_ id: String, completion: @escaping ClientCompletion<FundingSource>) {
        let mutationInput = IdInput(id: id)
        let mutation = CancelFundingSourceMutation(input: mutationInput)
        let operation = operationFactory.generateMutationOperation(
            mutation: mutation,
            appSyncClient: appSyncClient,
            serviceErrorTransformations: [SudoVirtualCardsError.init(graphQLError:)],
            logger: logger)
        let observer = PlatformBlockObserver(finishHandler: { [weak logger = self.logger] _, errors in
            if let error = errors.first {
                if let conditionError = error as? PlatformOperationErrors,
                    case .conditionFailed = conditionError {
                    completion(.failure(SudoVirtualCardsError.notSignedIn))
                } else {
                    let error = self.convertToSudoVirtualCardsError(error)
                    completion(.failure(error))
                }
                return
            }
            guard let result = operation.result else {
                logger?.error("CancelFundingSource failed - no result returned")
                completion(.failure(SudoVirtualCardsError.cancelFailed))
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
        let keyPairResult = publicKeyService.getCurrentKeyPair(generateKeyIfNotFound: true)
        let keyPair: KeyPair
        switch keyPairResult {
        case let .success(kp):
            keyPair = kp
        case let .failure(error):
            let error = convertToSudoVirtualCardsError(error)
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
                    let error = self.convertToSudoVirtualCardsError(error)
                    completion(.failure(error))
                }
                return
            }
            guard let result = operation.result else {
                logger?.error("UpdateCard failed - no result returned")
                completion(.failure(SudoVirtualCardsError.updateFailed))
                return
            }
            do {
                let card = try self.unsealer.unseal(result.updateCard)
                completion(.success(card))
                return
            } catch {
                self.logger.error("Failed to decrypt card: \(error)")
                let error = self.convertToSudoVirtualCardsError(error)
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
            let keyPairResult = publicKeyService.getCurrentKeyPair(generateKeyIfNotFound: true)
            keyPair = try keyPairResult.get()
        } catch {
            let error = convertToSudoVirtualCardsError(error)
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
                    let error = self.convertToSudoVirtualCardsError(error)
                    completion(.failure(error))
                }
                return
            }
            guard let result = operation.result else {
                logger?.error("cancelCard failed - no result returned")
                completion(.failure(SudoVirtualCardsError.cancelFailed))
                return
            }
            do {
                let card = try self.unsealer.unseal(result.cancelCard)
                completion(.success(card))
                return
            } catch {
                self.logger.error("Failed to decrypt card: \(error)")
                let error = self.convertToSudoVirtualCardsError(error)
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
                    let error = self.convertToSudoVirtualCardsError(error)
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
                    let error = self.convertToSudoVirtualCardsError(error)
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

    public func listProvisionalCardsWithFilter(
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
                    let error = self.convertToSudoVirtualCardsError(error)
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
                let error = self.convertToSudoVirtualCardsError(error)
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
            let keyPairResult = publicKeyService.getCurrentKeyPair(generateKeyIfNotFound: true)
            keyPair = try keyPairResult.get()
        } catch {
            let error = convertToSudoVirtualCardsError(error)
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
                    let error = self.convertToSudoVirtualCardsError(error)
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
                let error = self.convertToSudoVirtualCardsError(error)
                completion(.failure(error))
                return
            }
        })
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    public func listCardsWithFilter(
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
                    let error = self.convertToSudoVirtualCardsError(error)
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
                let error = self.convertToSudoVirtualCardsError(error)
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
                    let error = self.convertToSudoVirtualCardsError(error)
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

    public func listFundingSourcesWithLimit(
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
                    let error = self.convertToSudoVirtualCardsError(error)
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

    // MARK: - Transactions

    public func getTransactionWithId(_ id: String, cachePolicy: CachePolicy, completion: @escaping ClientCompletion<Transaction?>) {
        let keyPair: KeyPair
        do {
            let keyPairResult = publicKeyService.getCurrentKeyPair()
            keyPair = try keyPairResult.get()
        } catch {
            let error = convertToSudoVirtualCardsError(error)
            completion(.failure(error))
            return
        }
        transactionService.get(withId: id, cachePolicy: cachePolicy, keyPair: keyPair) { [weak self] result in
            guard let weakSelf = self else { return }
            if var error = result.error {
                error = weakSelf.convertToSudoVirtualCardsError(error)
                completion(.failure(error))
                return
            }
            completion(result)
        }
    }

    public func listTransactionsWithFilter(
        _ filter: GetTransactionsFilterInput?,
        limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy,
        completion: @escaping ClientCompletion<ListOutput<Transaction>>
    ) {
        transactionService.list(withFilter: filter, limit: limit, nextToken: nextToken, cachePolicy: cachePolicy) { [weak self] result in
            guard let weakSelf = self else { return }
            if var error = result.error {
                error = weakSelf.convertToSudoVirtualCardsError(error)
                completion(.failure(error))
                return
            }
            completion(result)
        }
    }

    @discardableResult
    public func subscribeToTransactionUpdates(
        statusChangeHandler: SudoSubscriptionStatusChangeHandler?,
        resultHandler: @escaping ClientCompletion<Transaction>
    ) throws -> Cancellable? {
        return try transactionService.subscribe(
            withStatusChangeHandler: statusChangeHandler,
            resultHandler: { [weak self] result in
                guard let weakSelf = self else { return }
                if var error = result.error {
                    error = weakSelf.convertToSudoVirtualCardsError(error)
                    resultHandler(.failure(error))
                    return
                }
                resultHandler(result)
            }
        )
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
                    let error = self.convertToSudoVirtualCardsError(error)
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
                    let error = self.convertToSudoVirtualCardsError(error)
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
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
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
                    let error = self.convertToSudoVirtualCardsError(error)
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
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
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
                    let error = self.convertToSudoVirtualCardsError(error)
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
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
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
                    let error = self.convertToSudoVirtualCardsError(error)
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
                let error = self.convertToSudoVirtualCardsError(cause)
                completion(.failure(error))
            }
        })
    }

    /// Convert a error to a `SudoVirtualCardsError` if possible.
    func convertToSudoVirtualCardsError(_ error: Error) -> Error {
        guard let platformError = error as? SudoPlatformError else {
            return error
        }
        return SudoVirtualCardsError(platformError: platformError)
    }

    func generateProvisionCardCompletionObserver(
        input: ProvisionCardInput,
        owner: String,
        clientRefId: String,
        registerPublicKeyOperation: RegisterPublicKeyOperation,
        getOwnershipProofOperation: GetOwnershipProofOperation,
        completion: @escaping ClientCompletion<ProvisionalCard.State>
    ) -> PlatformBlockObserver {
        /// Ocassionally, provision will fail the first time due to an identity not verified error, so we need to be able to refresh the token. This bool allows
        /// for that.
        var allowIdentityRetry = true
        var observer: PlatformBlockObserver!
        observer = PlatformBlockObserver(finishHandler: { [weak self] operation, errors in
            guard let weakSelf = self, let operation = operation as? ProvisionCardOperation else {
                return
            }
            if let error = errors.first {
                if allowIdentityRetry, let validationError = error as? SudoPlatformError, validationError == .identityNotVerified {
                    weakSelf.logger.warning("Failed to provision card, not verified - retrying.")
                    allowIdentityRetry = false
                    let refreshTokenOperation = weakSelf.operationFactory.generateRefreshTokenOperation(
                        userClient: weakSelf.userClient,
                        logger: weakSelf.logger
                    )
                    let provisionCardOperation = weakSelf.operationFactory.generateProvisionCardOperation(
                        input: input,
                        owner: owner,
                        clientRefId: clientRefId,
                        cardService: weakSelf.cardService,
                        logger: weakSelf.logger
                    )

                    provisionCardOperation.addDependency(registerPublicKeyOperation)
                    provisionCardOperation.addDependency(getOwnershipProofOperation)
                    provisionCardOperation.addDependency(refreshTokenOperation)
                    provisionCardOperation.addObserver(observer)
                    weakSelf.queue.addOperations([refreshTokenOperation, provisionCardOperation], waitUntilFinished: false)
                    return
                }
                weakSelf.logger.error("Failed to provision card: \(error)")
                weakSelf.cardService.removeProvisionObserver(withClientRefId: clientRefId)
                let error = weakSelf.convertToSudoVirtualCardsError(error)
                completion(.failure(error))
                return
            }
            guard let state = operation.result else {
                weakSelf.logger.error("Unexpected error - no result or error received from ProvisionCardOperation")
                weakSelf.cardService.removeProvisionObserver(withClientRefId: clientRefId)
                completion(.failure(SudoVirtualCardsError.provisionFailed))
                return
            }
            completion(.success(state))
        })
        return observer
    }
}
