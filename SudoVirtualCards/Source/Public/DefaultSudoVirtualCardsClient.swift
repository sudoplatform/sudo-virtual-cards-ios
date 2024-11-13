//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSAppSync
import SudoUser
import SudoLogging
import SudoApiClient

/// Default Client API Endpoint for interacting with the Virtual Cards Service.
public class DefaultSudoVirtualCardsClient: SudoVirtualCardsClient {

    // MARK: - Properties: - Services

    var fundingSourceService: FundingSourceService

    var provisionalFundingSourceService: ProvisionalFundingSourceService

    /// Abstraction of the SDKs capabilities surrounding `VirtualCard` access/manipulation with virtual cards service.
    var virtualCardService: VirtualCardService

    /// Abstraction of the SDKs capabilities surrounding `Transaction` access/manipulation with virtual cards service.
    var transactionService: TransactionService

    /// Abstraction of the SDKs capabilities surrounding `PublicKey` access/manipulation with virtual cards service.
    var publicKeyService: PublicKeyService

    // MARK: - Properties

    /// Used to make GraphQL requests to AWS. Injected into operations to delegate the calls.
    let graphQLClient: SudoApiClient

    /// Serial operation queue to allow for running key operations one at a time.
    private static let keyOperationQueue: SudoVirtualCardsOperationQueue = {
        let queue = SudoVirtualCardsOperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }()

    private static let dispatchQueue = DispatchQueue(label: "com.sudoplatform.sudo-virtual-cards-graphQL-result-handler")

    /// Used to determine if the user is signed in and access the user owner ID.
    /// Unowned used since this should always outlive the lifetime of this class.
    private unowned var userClient: SudoUserClient

    let platformKeyManager: PlatformKeyManager

    private let unsealer: Unsealer

    /// Logging utility for debugging and diagnostics.
    private let logger: Logger

    /// Utility class to manage subscriptions.
    let subscriptionManager: SubscriptionManager

    // MARK: - Lifecycle

    /// Initialize a `DefaultSudoVirtualCardsClient` instance. It uses configuration parameters defined in
    /// `sudoplatformconfig.json` file located in the app bundle.
    ///
    /// - Parameters:
    ///   - keyNamespace: Namespace to use for the keys and passwords. This should be left as the default property
    ///   - config: Optional configuration to override AWS endpoint. It is recommended that this be left `nil`.
    ///   - userClient: SudoUserClient instance used for authentication.
    /// Throws:
    ///     - `SudoVirtualCardsError` if invalid config.
    public convenience init(
        keyNamespace: String = "com.sudoplatform.virtualcards",
        config: SudoVirtualCardsConfig? = nil,
        userClient: SudoUserClient
    ) throws {
        let graphQLClient: SudoApiClient
        if let config = config {
            let authProvider = GraphQLAuthProvider(client: userClient)
            let cacheConfiguration = try AWSAppSyncCacheConfiguration()
            let appSyncConfig = try AWSAppSyncClientConfiguration(
                appSyncServiceConfig: config,
                userPoolsAuthProvider: authProvider,
                cacheConfiguration: cacheConfiguration
            )
            let appSyncClient = try AWSAppSyncClient(appSyncConfig: appSyncConfig)
            try graphQLClient = SudoApiClient(
                configProvider: config,
                sudoUserClient: userClient,
                logger: Logger.sudoApiClientLogger,
                appSyncClient: appSyncClient
            )
        } else {
            guard let asClient = try SudoApiClientManager.instance?.getClient(sudoUserClient: userClient) else {
                throw SudoVirtualCardsError.invalidConfig
            }
            graphQLClient = asClient
        }
        let platformKeyManager = DefaultPlatformKeyManager(
            keyNamespace: keyNamespace,
            keyRingServiceName: "sudo-virtual-cards",
            userClient: userClient,
            logger: Logger.platformUtilitySDK
        )
        let unsealer = DefaultUnsealer(platformKeyManager: platformKeyManager)
        self.init(
            userClient: userClient,
            graphQLClient: graphQLClient,
            platformKeyManager: platformKeyManager,
            unsealer: unsealer
        )
    }

    /// Initialize a `DefaultSudoVirtualCardsClient` instance.
    ///
    /// This is used both internally as the 'true' init, as well as for injecting mock objects.
    ///
    /// - Parameters:
    ///   - graphQLClient: Client used to interface with the virtualCards app sync service.
    ///   - logger: Logging object.
    internal init(
        userClient: SudoUserClient,
        graphQLClient: SudoApiClient,
        platformKeyManager: PlatformKeyManager,
        unsealer: Unsealer,
        subscriptionManager: SubscriptionManager = DefaultSubscriptionManager(),
        logger: Logger = Logger.virtualCardsSDKLogger
    ) {
        self.userClient = userClient
        self.graphQLClient = graphQLClient
        self.platformKeyManager = platformKeyManager
        self.unsealer = unsealer
        self.subscriptionManager = subscriptionManager
        self.logger = logger
        self.fundingSourceService = FundingSourceService(
            graphQLClient: graphQLClient,
            unsealer: unsealer,
            platformKeyManager: platformKeyManager,
            logger: logger
        )
        self.provisionalFundingSourceService = ProvisionalFundingSourceService(
            graphQLClient: graphQLClient,
            logger: logger
        )
        self.virtualCardService = VirtualCardService(graphQLClient: graphQLClient, unsealer: unsealer, platformKeyManager: platformKeyManager, logger: logger)
        self.transactionService = TransactionService(
            userClient: userClient,
            graphQLClient: graphQLClient,
            unsealer: unsealer,
            logger: logger
        )
        self.publicKeyService = PublicKeyService(
            graphQLClient: graphQLClient,
            platformKeyManager: platformKeyManager,
            logger: logger
        )
    }

    public func reset() throws {
        logger.info("Resetting client state.")

        try self.graphQLClient.clearCaches(options: .init(clearQueries: true, clearMutations: true, clearSubscriptions: true))
        virtualCardService.clearSubscriptions()
        transactionService.clearSubscriptions()
        try platformKeyManager.removeAllKeys()
        subscriptionManager.removeAllSubscriptions()
    }

    public func createKeysIfAbsent() async throws -> CreateKeysIfAbsentResult {
        let useCase = CreateKeysIfAbsentUseCase(platformKeyManager: platformKeyManager, publicKeyService: publicKeyService, logger: logger)
        return try await withCheckedThrowingContinuation { continuation in
            useCase.completionBlock = { [weak useCase] in
                guard let useCase = useCase else { return }
                if let error = useCase.errors.first {
                    return continuation.resume(throwing: error)
                }
                guard let result = useCase.result else {
                    let error = SudoVirtualCardsError.fatalError(
                        description: "Neither error nor result returned from \(type(of: CreateKeysIfAbsentUseCase.self))"
                    )
                    return continuation.resume(throwing: error)
                }
                return continuation.resume(returning: result)
            }
            type(of: self).keyOperationQueue.addOperation(useCase)
        }
    }

    // MARK: - Methods

    public func setupFundingSource(withInput input: SetupFundingSourceInput) async throws -> ProvisionalFundingSource {
        try checkUserSignedIn()
        return try await fundingSourceService.setup(input: input)
    }

    public func completeFundingSource(withInput input: CompleteFundingSourceInput) async throws -> FundingSource {
        try checkUserSignedIn()
        let completionData: FundingSourceCompletionData
        switch input.completionData {
        case .stripeCard(let data):
            completionData = FundingSourceCompletionData.stripeCard(StripeCardCompletionData(paymentMethod: data.paymentMethodId))
        case .checkoutCard(let data):
            completionData = FundingSourceCompletionData.checkoutCard(CheckoutCardCompletionData(paymentToken: data.paymentToken))
        case .checkoutBankAccount(let data):
            completionData = FundingSourceCompletionData.checkoutBankAccount(
                CheckoutBankAccountCompletionData(
                    publicToken: data.publicToken,
                    accountId: data.accountId,
                    institutionId: data.institutionId,
                    authorizationText: data.authorizationText
                )
            )
        }

        return try await fundingSourceService.complete(
            clientId: input.id,
            completionData: completionData
        )
    }

    public func refreshFundingSource(withInput input: RefreshFundingSourceInput) async throws -> FundingSource {
        try checkUserSignedIn()

        return try await fundingSourceService.refresh(
            clientId: input.id,
            refreshData: input.refreshData,
            applicationData: input.applicationData,
            language: input.language
        )
    }

    public func provisionVirtualCard(
        withInput input: ProvisionVirtualCardInput,
        observer: ProvisionVirtualCardObservable?
    ) async throws -> ProvisionalCardState {
        let clientRefId = UUID().uuidString
        return try await provisionVirtualCard(
            withClientRefId: clientRefId,
            input: input,
            observer: observer
        )
    }

    /// This API call is made up of 2 distinct different operation:
    /// - `GetOwnershipProofOperation`,
    /// - `ProvisionCardOperation`.
    ///
    /// `GetOwnershipProofOperation` is responsible for generating an ownership proof on the sudo's profile to associate with the sudo.
    /// `ProvisionCardOperation` is responsible for calling the create card mutation and watching for the result.
    func provisionVirtualCard(
        withClientRefId clientRefId: String,
        input: ProvisionVirtualCardInput,
        observer: ProvisionVirtualCardObservable?
    ) async throws -> ProvisionalCardState {
        // Get keyPair or fail.
        let keyPair: KeyPair
        do {
            let keyPairResult = publicKeyService.getCurrentKeyPair()
            keyPair = try keyPairResult.get()
        } catch {
            let error = convertToSudoVirtualCardsError(error)
            throw error
        }
        // Get the owner identifier, or fail.
        guard let owner = try? userClient.getSubject() else {
            throw SudoVirtualCardsError.notSignedIn
        }

        // Add observer, if it has been passed in.
        if let observer = observer {
            virtualCardService.addProvisionObserver(observer, clientRefId: clientRefId)
        }

        // Check if Key exists on service, else create.
        let publicKey: PublicKey
        if let fetchedPublicKey = try await self.getPublicKeyWithId(keyPair.keyId, cachePolicy: .remoteOnly) {
            publicKey = fetchedPublicKey
        } else {
            publicKey = try await publicKeyService.create(withKeyPair: keyPair)
        }

        // Provision Virtual Card
        return try await virtualCardService.create(
            withInput: input,
            publicKey: publicKey,
            owner: owner,
            clientRefId: clientRefId
        )
    }

    public func cancelFundingSource(withId id: String) async throws -> FundingSource {
        try checkUserSignedIn()
        return try await fundingSourceService.cancel(id: id)
    }

    public func reviewUnfundedFundingSource(withId id: String) async throws -> FundingSource {
        try checkUserSignedIn()
        return try await fundingSourceService.reviewUnfunded(id: id)
    }

    public func cancelProvisionalFundingSource(withId id: String) async throws -> ProvisionalFundingSource {
        try checkUserSignedIn()
        return try await provisionalFundingSourceService.cancelProvisionalFundingSource(withId: id)
    }

    public func updateVirtualCard(withInput input: UpdateVirtualCardInput) async throws -> SingleAPIResult<VirtualCard, PartialVirtualCard> {
        try checkUserSignedIn()
        let keyPairResult = publicKeyService.getCurrentKeyPair()
        let keyPair: KeyPair
        switch keyPairResult {
        case let .success(kp):
            keyPair = kp
        case let .failure(error):
            let error = convertToSudoVirtualCardsError(error)
            throw error
        }
        return try await virtualCardService.update(withInput: input, keyId: keyPair.keyId)
    }

    public func cancelVirtualCard(withId id: String) async throws -> SingleAPIResult<VirtualCard, PartialVirtualCard> {
        try checkUserSignedIn()
        let keyPair: KeyPair
        do {
            let keyPairResult = publicKeyService.getCurrentKeyPair()
            keyPair = try keyPairResult.get()
        } catch {
            let error = convertToSudoVirtualCardsError(error)
            throw error
        }
        let input = GraphQL.CardCancelRequest(id: id, keyId: keyPair.keyId)
        let mutation = GraphQL.CancelVirtualCardMutation(input: input)
        let data = try await GraphQLHelper.performMutation(
            graphQLClient: graphQLClient,
            serviceErrorTransformations: [SudoVirtualCardsError.init(graphQLError:)],
            mutation: mutation,
            logger: logger
        )
        do {
            let result = try unsealer.unseal(data.cancelCard.fragments.sealedCardWithLastTransaction)
            return .success(result)
        } catch {
            let card = data.cancelCard.fragments.sealedCardWithLastTransaction
            return .partial(PartialResult(card: card, error: error))
        }
    }

    @available(*, deprecated, message: "Use getVirtualCardsConfig instead to retrieve the FundingSourceClientConfiguration")
    public func getFundingSourceClientConfiguration() async throws -> [FundingSourceClientConfiguration] {
        let configs = try await fundingSourceService.getConfig(cachePolicy: .remoteOnly)
        if configs.fundingSourceTypes.isEmpty {
            throw SudoVirtualCardsError.internalError("No configuration found")
        }

        return configs.fundingSourceTypes.map {
            switch $0 {
            case let .stripeCard(config):
                return .stripeCard(StripeCardClientConfiguration(apiKey: config.apiKey))
            case let .checkoutCard(config):
                return .checkoutCard(CheckoutCardClientConfiguration(apiKey: config.apiKey))
            case let .checkoutBankAccount(config):
                return .checkoutBankAccount(CheckoutBankAccountClientConfiguration(apiKey: config.apiKey))
            case let .unknown(config):
                return .unknown(config)
            }
        }
    }

    public func getProvisionalCard(withId id: String, cachePolicy: CachePolicy) async throws -> ProvisionalCard? {
        try checkUserSignedIn()
        let query = GraphQL.GetProvisionalCardQuery(id: id)
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let result = data?.getProvisionalCard else {
            return nil
        }
        var card: VirtualCard?
        if let resultCard = result.card {
            let sealedCards = resultCard.map { $0.fragments.sealedCard }
            guard let cardToUnseal = try sealedCards.first(where: {
                try platformKeyManager.getKeyPairWithId($0.keyId) != nil
            }) else {
                throw UnsealingError.keyNotFound
            }
            card = try self.unsealer.unseal(cardToUnseal)
        }
        let provisionalCard = ProvisionalCard(
            id: result.id,
            createdAtEpochMs: result.createdAtEpochMs,
            updatedAtEpochMs: result.updatedAtEpochMs,
            clientRefId: result.clientRefId,
            provisioningState: result.provisioningState,
            card: card
        )
        return provisionalCard
    }

    public func listProvisionalCards(
        withLimit limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy
    ) async throws -> ListAPIResult<ProvisionalCard, PartialProvisionalCard> {
        try checkUserSignedIn()
        let query = GraphQL.ListProvisionalCardsQuery(limit: limit, nextToken: nextToken)
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let listCards = data?.listProvisionalCards else {
            return ListAPIResult.empty
        }
        let nextToken = listCards.nextToken

        typealias UnsealedCardPairs = (provisionalCard: GraphQL.ListProvisionalCardsQuery.Data.ListProvisionalCard.Item, unsealedCard: VirtualCard?)
        var success: [ProvisionalCard] = []
        var partials: [PartialResult<PartialProvisionalCard>] = []
        for sealedProvisionalCard in listCards.items {
            var provisionalCard = ProvisionalCard(
                id: sealedProvisionalCard.id,
                createdAtEpochMs: sealedProvisionalCard.createdAtEpochMs,
                updatedAtEpochMs: sealedProvisionalCard.updatedAtEpochMs,
                clientRefId: sealedProvisionalCard.clientRefId,
                provisioningState: sealedProvisionalCard.provisioningState
            )
            if let sealedCard = sealedProvisionalCard.card {
                do {
                    let sealedCards = sealedCard.map { $0.fragments.sealedCard }
                    guard let cardToUnseal = try sealedCards.first(where: {
                        try platformKeyManager.getKeyPairWithId($0.keyId) != nil
                    }) else {
                        throw UnsealingError.keyNotFound
                    }
                    let unsealedCard = try unsealer.unseal(cardToUnseal)
                    provisionalCard.card = unsealedCard
                } catch {
                    partials.append(PartialResult(provisionalCard: sealedProvisionalCard.fragments.provisionalCard, error: error))
                    continue
                }
            }
            success.append(provisionalCard)
        }
        if !partials.isEmpty {
            return .partial(.init(items: success, failed: partials, nextToken: nextToken))
        }
        return .success(.init(items: success, nextToken: nextToken))
    }

    public func getVirtualCard(withId id: String, cachePolicy: CachePolicy) async throws -> VirtualCard? {
        try checkUserSignedIn()
        let keyPair: KeyPair
        do {
            let keyPairResult = publicKeyService.getCurrentKeyPair()
            keyPair = try keyPairResult.get()
        } catch {
            let error = convertToSudoVirtualCardsError(error)
            throw error
        }
        let query = GraphQL.GetCardQuery(id: id, keyId: keyPair.keyId)
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let sealedCard = data?.getCard else {
            return nil
        }
        return try self.unsealer.unseal(sealedCard.fragments.sealedCardWithLastTransaction)
    }

    public func getVirtualCardsConfig(cachePolicy: CachePolicy) async throws -> VirtualCardsConfig? {
        let query = GraphQL.GetVirtualCardsConfigQuery()
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let virtualCardsConfig = data?.getVirtualCardsConfig else {
            return nil
        }
        return VirtualCardsConfig(fragment: virtualCardsConfig)
    }

    public func listVirtualCards(
        withFilter filter: VirtualCardFilterInput? = nil,
        sortOrder: SortOrderInput? = nil,
        withLimit limit: Int? = nil,
        nextToken: String? = nil,
        cachePolicy: CachePolicy
    ) async throws -> ListAPIResult<VirtualCard, PartialVirtualCard> {
        try checkUserSignedIn()
        let query = GraphQL.ListCardsQuery(
            filter: filter?.toGraphQL(),
            sortOrder: sortOrder?.toGraphQL(),
            limit: limit,
            nextToken: nextToken
        )
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let listCards = data?.listCards else {
            return ListAPIResult.empty
        }
        let nextToken = listCards.nextToken
        var success: [VirtualCard] = []
        var partials: [PartialResult<PartialVirtualCard>] = []
        for listCard in listCards.items {
            do {
                let unsealedCard = try unsealer.unseal(listCard.fragments.sealedCardWithLastTransaction)
                success.append(unsealedCard)
            } catch {
                let card = listCard.fragments.sealedCardWithLastTransaction
                partials.append(PartialResult(card: card, error: error))
            }
        }
        return deduplicateVirtualCardListResult(success: success, partials: partials, nextToken: nextToken)
    }

    public func getFundingSource(withId id: String, cachePolicy: CachePolicy) async throws -> FundingSource? {
        try checkUserSignedIn()
        let query = GraphQL.GetFundingSourceQuery(id: id)
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let getFundingSource = data?.getFundingSource else {
            return nil
        }
        if getFundingSource.__typename == CreditCardFundingSource.Constants.TypeName {
            guard let fundingSource = getFundingSource.asCreditCardFundingSource else {
                logger.error("No data received for getFundingSource credit card response")
                throw SudoVirtualCardsError.internalError("No data received for getFundingSource credit card response")
            }
            let creditCardFundingSource = CreditCardFundingSource(fragment: fundingSource.fragments.creditCardFundingSource)
            return FundingSource.creditCardFundingSource(creditCardFundingSource)
        }
        if getFundingSource.__typename == BankAccountFundingSource.Constants.TypeName {
            guard let fundingSource = getFundingSource.asBankAccountFundingSource else {
                logger.error("No data received for getFundingSource bank account response")
                throw SudoVirtualCardsError.internalError("No data received for getFundingSource bank account response")
            }
            let bankAccountFundingSource = try self.unsealer.unseal(fundingSource.fragments.bankAccountFundingSource)
            return FundingSource.bankAccountFundingSource(bankAccountFundingSource)
        }
        return nil
    }

    public func listFundingSources(
        withFilter filter: FundingSourceFilterInput? = nil,
        sortOrder: SortOrderInput? = nil,
        withLimit limit: Int? = nil,
        nextToken: String? = nil,
        cachePolicy: CachePolicy
    ) async throws -> ListOutput<FundingSource> {
        try checkUserSignedIn()
        let query = GraphQL.ListFundingSourcesQuery(
            filter: filter?.toGraphQL(),
            sortOrder: sortOrder?.toGraphQL(),
            limit: limit,
            nextToken: nextToken
            )
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let listFundingSources = data?.listFundingSources else {
            return ListOutput.empty
        }
        let fundingSources: [FundingSource] = try listFundingSources.items
            .map {
                if $0.__typename == CreditCardFundingSource.Constants.TypeName {
                    guard let fundingSource = $0.asCreditCardFundingSource else {
                        logger.error("No data received for getFundingSource credit card response")
                        throw SudoVirtualCardsError.internalError("No data received for getFundingSource credit card response")
                    }
                    let creditCardFundingSource = CreditCardFundingSource(fragment: fundingSource.fragments.creditCardFundingSource)
                    return FundingSource.creditCardFundingSource(creditCardFundingSource)
                }
                if $0.__typename == BankAccountFundingSource.Constants.TypeName {
                    guard let fundingSource = $0.asBankAccountFundingSource else {
                        logger.error("No data received for getFundingSource bank account response")
                        throw SudoVirtualCardsError.internalError("No data received for getFundingSource bank account response")
                    }
                    let bankAccountFundingSource = try self.unsealer.unseal(fundingSource.fragments.bankAccountFundingSource)
                    return FundingSource.bankAccountFundingSource(bankAccountFundingSource)
                }
                throw SudoVirtualCardsError.unrecognizedFundingSourceType($0.__typename)
            }

        let nextToken = listFundingSources.nextToken
        return ListOutput(items: fundingSources, nextToken: nextToken)
    }

    public func listProvisionalFundingSources(
        withFilter filter: ProvisionalFundingSourceFilterInput? = nil,
        sortOrder: SortOrderInput? = nil,
        limit: Int? = nil,
        nextToken: String? = nil,
        cachePolicy: CachePolicy
    ) async throws -> ListOutput<ProvisionalFundingSource> {
        try checkUserSignedIn()
        return try await self.provisionalFundingSourceService.listProvisionalFundingSources(
            withFilter: filter,
            sortOrder: sortOrder,
            limit: limit,
            nextToken: nextToken,
            cachePolicy: cachePolicy
        )
    }

    public func importKeys(archiveData: Data) throws {
        if archiveData.isEmpty {
            throw SudoVirtualCardsError.invalidArgument("")
        }
        try platformKeyManager.importKeys(archiveData: archiveData)
    }

    public func exportKeys() throws -> Data {
        try platformKeyManager.exportKeys()
    }

    // MARK: - Transactions

    public func getTransaction(withId id: String, cachePolicy: CachePolicy) async throws -> Transaction? {
        try checkUserSignedIn()
        let keyPair: KeyPair
        do {
            let keyPairResult = publicKeyService.getCurrentKeyPair()
            keyPair = try keyPairResult.get()
        } catch {
            let error = convertToSudoVirtualCardsError(error)
            throw error
        }
        return try await transactionService.get(withId: id, cachePolicy: cachePolicy, keyPair: keyPair)
    }

    public func listTransactions(
        withCardId cardId: String,
        limit: Int?,
        nextToken: String?,
        dateRange: DateRangeInput?,
        sortOrder: SortOrderInput?,
        cachePolicy: CachePolicy
    ) async throws -> ListAPIResult<Transaction, PartialTransaction> {
        return try await transactionService.list(
            withCardId: cardId,
            limit: limit,
            nextToken: nextToken,
            dateRange: dateRange,
            sortOrder: sortOrder,
            cachePolicy: cachePolicy
        )
    }

    public func listTransactions(
        withCardId cardId: String,
        withTransactionType transactionType: TransactionType,
        limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy
    ) async throws -> ListAPIResult<Transaction, PartialTransaction> {
        return try await transactionService.list(
            withCardId: cardId,
            withTransactionType: transactionType,
            limit: limit,
            nextToken: nextToken,
            cachePolicy: cachePolicy
        )
    }

    public func listTransactions(
        withLimit limit: Int?,
        nextToken: String?,
        dateRange: DateRangeInput?,
        sortOrder: SortOrderInput?,
        cachePolicy: CachePolicy
    ) async throws -> ListAPIResult<Transaction, PartialTransaction> {
        return try await transactionService.list(
            withLimit: limit,
            nextToken: nextToken,
            dateRange: dateRange,
            sortOrder: sortOrder,
            cachePolicy: cachePolicy
        )
    }

    @discardableResult
    public func subscribeToTransactionUpdated(
        statusChangeHandler: SudoSubscriptionStatusChangeHandler?,
        resultHandler: @escaping ClientCompletion<Transaction>
    ) async throws -> SubscriptionToken? {
        let subscriptionId = UUID().uuidString
        let c = try await transactionService.subscribeToUpdated(
            withStatusChangeHandler: { [weak self] status in
                switch status {
                case .disconnected:
                    self?.subscriptionManager.removeSubscription(withId: subscriptionId)
                    fallthrough
                default:
                    statusChangeHandler?(status)
                }
            },
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
        guard let cancellable = c else {
            return nil
        }
        return VirtualCardsSubscriptionToken(id: subscriptionId, cancellable: cancellable, manager: subscriptionManager)
    }

    @discardableResult
    public func subscribeToTransactionDeleted(
        statusChangeHandler: SudoSubscriptionStatusChangeHandler?,
        resultHandler: @escaping ClientCompletion<Transaction>
    ) async throws -> SubscriptionToken? {
        let subscriptionId = UUID().uuidString
        let c = try await transactionService.subscribeToDeleted(
            withStatusChangeHandler: { [weak self] status in
                switch status {
                case .disconnected:
                    self?.subscriptionManager.removeSubscription(withId: subscriptionId)
                    fallthrough
                default:
                    statusChangeHandler?(status)
                }
            },
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
        guard let cancellable = c else {
            return nil
        }
        return VirtualCardsSubscriptionToken(id: subscriptionId, cancellable: cancellable, manager: subscriptionManager)
    }

    // MARK: - Sandbox APIs

    public func sandboxGetPlaidData(institutionId: String, plaidUsername: String) async throws -> SandboxPlaidData {
        try checkUserSignedIn()

        let query = GraphQL.SandboxGetPlaidDataQuery(input: .init(institutionId: institutionId, username: plaidUsername))

        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: .remoteOnly, logger: logger)
        guard let sandboxPlaidData = data?.sandboxGetPlaidData else {
            throw SudoVirtualCardsError.internalError("No sandbox Plaid data returned")
        }

        return .init(
            accountMetadata: sandboxPlaidData.accountMetadata.map {
                .init(
                    accountId: $0.accountId,
                    subtype: .init(plaidSubType: $0.subtype ?? "unknown")
                )
            },
            publicToken: sandboxPlaidData.publicToken
        )
    }

    public func sandboxSetFundingSourceToRequireRefresh(
        fundingSourceId: String
    ) async throws -> FundingSource {
        try checkUserSignedIn()

        let mutation = GraphQL.SandboxSetFundingSourceToRequireRefreshMutation(input: .init(fundingSourceId: fundingSourceId))

        let data = try await GraphQLHelper.performMutation(
            graphQLClient: graphQLClient,
            serviceErrorTransformations: [SudoVirtualCardsError.init(graphQLError:)],
            mutation: mutation,
            logger: logger
        )

        let fundingSource = data.sandboxSetFundingSourceToRequireRefresh
        if fundingSource.__typename == CreditCardFundingSource.Constants.TypeName {
            guard let fundingSource = fundingSource.asCreditCardFundingSource else {
                logger.error("No data received for credit card response")
                throw SudoVirtualCardsError.internalError("No data received for credit card response")
            }
            let creditCardFundingSource = CreditCardFundingSource(fragment: fundingSource.fragments.creditCardFundingSource)
            return FundingSource.creditCardFundingSource(creditCardFundingSource)
        }
        if fundingSource.__typename == BankAccountFundingSource.Constants.TypeName {
            guard let fundingSource = fundingSource.asBankAccountFundingSource else {
                logger.error("No data received for bank account response")
                throw SudoVirtualCardsError.internalError("No data received for bank account response")
            }
            let bankAccountFundingSource = try self.unsealer.unseal(fundingSource.fragments.bankAccountFundingSource)
            return FundingSource.bankAccountFundingSource(bankAccountFundingSource)
        }

        throw SudoVirtualCardsError.internalError("Unexpected funding source type \(fundingSource.__typename)")
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
    func registerPublicKeyWithInput(_ input: RegisterPublicKeyInput) async throws -> PublicKey {
        try checkUserSignedIn()
        let mutationInput = GraphQL.CreatePublicKeyInput(
            algorithm: input.algorithm.toString(),
            keyId: input.keyId,
            keyRingId: input.keyRingId,
            publicKey: input.publicKey
        )
        let mutation = GraphQL.CreatePublicKeyMutation(input: mutationInput)
        let data = try await GraphQLHelper.performMutation(
            graphQLClient: graphQLClient,
            serviceErrorTransformations: [SudoVirtualCardsError.init(graphQLError:)],
            mutation: mutation,
            logger: logger
        )
        return PublicKey(createPublicKeyForVirtualCards: data.createPublicKeyForVirtualCards)
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
    func getPublicKeyWithId(_ id: String, cachePolicy: CachePolicy) async throws -> PublicKey? {
        try checkUserSignedIn()
        return try await publicKeyService.getPublicKeyWithId(id, cachePolicy: cachePolicy)
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
        cachePolicy: CachePolicy
    ) async throws -> ListOutput<PublicKey> {
        try checkUserSignedIn()
        let query = GraphQL.GetPublicKeysQuery(limit: limit, nextToken: nextToken)
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let getPublicKeys = data?.getPublicKeysForVirtualCards else {
            return ListOutput.empty
        }
        let publicKeys = getPublicKeys.items.map(PublicKey.init)
        let nextToken = getPublicKeys.nextToken
        return ListOutput(items: publicKeys, nextToken: nextToken)
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
        cachePolicy: CachePolicy
    ) async throws -> ListOutput<PublicKey> {
        try checkUserSignedIn()
        let query = GraphQL.GetKeyRingQuery(keyRingId: keyRingId, limit: limit, nextToken: nextToken, keyFormats: nil)
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let getPublicKeys = data?.getKeyRingForVirtualCards else {
            return ListOutput.empty
        }
        let publicKeys = getPublicKeys.items.map(PublicKey.init)
        let nextToken = getPublicKeys.nextToken
        return ListOutput(items: publicKeys, nextToken: nextToken)
    }

    // MARK: Internal - Utility

    func checkUserSignedIn() throws {
        guard (try? userClient.getSubject()) != nil else {
            throw SudoVirtualCardsError.notSignedIn
        }
    }

    /// Convert a error to a `SudoVirtualCardsError` if possible.
    func convertToSudoVirtualCardsError(_ error: Error) -> Error {
        if let apiOperationError = error as? ApiOperationError {
            return SudoVirtualCardsError.fromApiOperationError(error: apiOperationError)
        }
        return error
    }

    /// Removes duplicate unsealed virtual cards from success and partial results based on identifier, favouring unsealed virtual cards in
    /// the success list.
    ///
    /// - Parameter success: A list of successfully unsealed virtual cards.
    /// - Parameter partials: A list of partial unsealed virtual cards.
    /// - Parameter nextToken: A token generated from previous calls to allow for pagination.
    ///
    /// - Returns: A Success or Partial result.
    private func deduplicateVirtualCardListResult(
        success: [VirtualCard],
        partials: [PartialResult<PartialVirtualCard>],
        nextToken: String?
    ) -> ListAPIResult<VirtualCard, PartialVirtualCard> {
        // Remove duplicate success and partial virtual cards based on id
        let distinctSuccess = (NSOrderedSet(array: success.map { $0.id }))
            // swiftlint:disable force_cast
            .map { id in return success.first { $0.id == id as! String }!
        }

        var distinctPartials = (NSOrderedSet(array: partials.map { $0.partial.id }))
            // swiftlint:disable force_cast
            .map { id in return partials.first { $0.partial.id == id as! String }!
        }

        // Remove virtual cards from partial list that have been successfully unsealed
        distinctPartials.removeAll { partial in
            distinctSuccess.contains { distinctS in
                distinctS.id == partial.partial.id
            }
        }

        // Build up and return the ListAPIResult
        if !distinctPartials.isEmpty {
            return .partial(.init(items: distinctSuccess, failed: distinctPartials, nextToken: nextToken))
        }
        return .success(.init(items: distinctSuccess, nextToken: nextToken))
    }
}
