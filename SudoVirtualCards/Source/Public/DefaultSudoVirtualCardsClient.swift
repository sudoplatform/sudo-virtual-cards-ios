//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSAppSync
import Stripe
import SudoUser
import SudoLogging
import SudoApiClient

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

    /// Used to make GraphQL requests to AWS. Injected into operations to delegate the calls.
    let graphQLClient: SudoApiClient

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
    
    /// Stripe client.
    let stripeClient: STPAPIClient

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
                cacheConfiguration: cacheConfiguration)
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
        stripeClient: STPAPIClient = STPAPIClient(publishableKey: ""),
        logger: Logger = Logger.virtualCardsSDKLogger
    ) {
        self.userClient = userClient
        self.graphQLClient = graphQLClient
        self.platformKeyManager = platformKeyManager
        self.unsealer = unsealer
        self.subscriptionManager = subscriptionManager
        self.stripeClient = stripeClient
        self.logger = logger
        self.fundingSourceService = FundingSourceService(graphQLClient: graphQLClient, logger: logger)
        self.cardService = CardService(graphQLClient: graphQLClient, unsealer: unsealer, logger: logger)
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
        cardService.clearSubscriptions()
        transactionService.clearSubscriptions()
        try platformKeyManager.removeAllKeys()
        subscriptionManager.removeAllSubscriptions()
    }

    // MARK: - Methods

    public func provisionCardWithInput(
        _ input: ProvisionCardInput,
        observer: ProvisionCardObservable?
    ) async throws -> ProvisionalCard.State {
        let clientRefId = UUID().uuidString
        return try await provisionCardWithClientRefId(
            clientRefId,
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
    func provisionCardWithClientRefId(
        _ clientRefId: String,
        input: ProvisionCardInput,
        observer: ProvisionCardObservable?
    ) async throws -> ProvisionalCard.State {
        // Get keyPair or fail.
        let keyPair: KeyPair
        do {
            let keyPairResult = publicKeyService.getCurrentKeyPair(generateKeyIfNotFound: true)
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
            cardService.addProvisionObserver(observer, clientRefId: clientRefId)
        }

        // Check if Key exists on service, else create.
        let registeredKeys = try await publicKeyService.getKeyRing(
            forKeyRingId: keyPair.keyRingId,
            cachePolicy: .remoteOnly
        ).getKeyRingForVirtualCards.items
        let matchedKey = registeredKeys.first { key in
            let keyIdMatches = (key.keyId == keyPair.keyId)
            let keyRingIdMatches = (key.keyRingId == keyPair.keyRingId)
            return keyIdMatches && keyRingIdMatches
        }
        let publicKey: PublicKey
        if let matchedKey = matchedKey {
            publicKey = PublicKey(getKeyRingForVirtualCards: matchedKey)
        } else {
            publicKey = try await publicKeyService.create(withKeyPair: keyPair)
        }

        // Provision Virtual Card

        // Ocassionally, provision will fail the first time due to an identity not verified error, so we need to be able to refresh the token. This bool allows
        // for that.
        var allowIdentityRetry = true
        do {
            return try await cardService.create(
                withInput: input,
                publicKey: publicKey,
                owner: owner,
                clientRefId: clientRefId
            )
        } catch let error as SudoVirtualCardsError {
            if allowIdentityRetry, error == .identityNotVerified {
                allowIdentityRetry = false

                // refresh token - try again
                _ = try await userClient.refreshTokens()

                return try await cardService.create(
                    withInput: input,
                    publicKey: publicKey,
                    owner: owner,
                    clientRefId: clientRefId
                )
            } else {
                throw error
            }
        }
    }

    public func createFundingSource(
        withCreditCardInput input: CreditCardFundingSourceInput,
        authorizationDelegate: FundingSourceAuthorizationDelegate?
    ) async throws -> FundingSource {
        /// Add signed in conditions to operations that have call out to virtual cards service.
        try checkUserSignedIn()

        let configs = try await fundingSourceService.getConfig(cachePolicy: .remoteOnly)
        guard let apiKey = configs.fundingSourceTypes.first?.apiKey else {
            throw SudoVirtualCardsError.internalError("Failed to retrieve funding source config")
        }
        
        self.stripeClient.publishableKey = apiKey
        
        let setupInput = SetupFundingSourceInput(type: .creditCard, currency: "USD")
        let setupResult = try await fundingSourceService.setup(input: setupInput)
        let stripeWorker = StripeIntentWorker(
            fromInputDetails: input,
            clientSecret: setupResult.clientSecret,
            stripeClient: self.stripeClient,
            authorizationDelegate: authorizationDelegate
        )
        let paymentMethodId = try await stripeWorker.confirmSetupIntent()
        return try await fundingSourceService.complete(clientId: setupResult.id, paymentMethodId: paymentMethodId)
    }

    public func cancelFundingSourceWithId(_ id: String) async throws -> FundingSource {
        try checkUserSignedIn()
        return try await fundingSourceService.cancel(id: id)
    }

    public func updateCardWithInput(_ input: UpdateCardInput)async throws -> Card {
        try checkUserSignedIn()
        let keyPairResult = publicKeyService.getCurrentKeyPair(generateKeyIfNotFound: true)
        let keyPair: KeyPair
        switch keyPairResult {
        case let .success(kp):
            keyPair = kp
        case let .failure(error):
            let error = convertToSudoVirtualCardsError(error)
            throw error
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
        let data = try await GraphQLHelper.performMutation(
            graphQLClient: graphQLClient,
            serviceErrorTransformations: [SudoVirtualCardsError.init(graphQLError:)],
            mutation: mutation,
            logger: logger
        )
        return try unsealer.unseal(data.updateCard)
    }

    public func cancelCardWithId(_ id: String) async throws -> Card {
        try checkUserSignedIn()
        let keyPair: KeyPair
        do {
            let keyPairResult = publicKeyService.getCurrentKeyPair(generateKeyIfNotFound: true)
            keyPair = try keyPairResult.get()
        } catch {
            let error = convertToSudoVirtualCardsError(error)
            throw error
        }
        let input = CardCancelRequest(id: id, keyId: keyPair.keyId)
        let mutation = CancelCardMutation(input: input)
        let data = try await GraphQLHelper.performMutation(
            graphQLClient: graphQLClient,
            serviceErrorTransformations: [SudoVirtualCardsError.init(graphQLError:)],
            mutation: mutation,
            logger: logger
        )
        return try unsealer.unseal(data.cancelCard)
    }

    public func getProvisionalCardWithId(_ id: String, cachePolicy: CachePolicy) async throws -> ProvisionalCard? {
        try checkUserSignedIn()
        let query = GetProvisionalCardQuery(id: id)
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let result = data?.getProvisionalCard else {
            return nil
        }
        var card: Card?
        if let resultCard = result.card {
            card = try self.unsealer.unseal(resultCard)
        }
        let provisionalCard = ProvisionalCard(
            id: result.id,
            createdAtEpochMs: result.createdAtEpochMs,
            updatedAtEpochMs: result.updatedAtEpochMs,
            clientRefId: result.clientRefId,
            provisioningState: result.provisioningState,
            card: card)
        return provisionalCard
    }

    public func listProvisionalCardsWithFilter(
        _ filter: GetProvisionalCardsFilterInput?,
        limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy
    ) async throws -> ListOutput<ProvisionalCard> {
        try checkUserSignedIn()
        let filter = filter?.toGraphQLFilter()
        let query = ListProvisionalCardsQuery(filter: filter, limit: limit, nextToken: nextToken)
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let listCards = data?.listProvisionalCards else {
            return ListOutput.empty
        }
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
        return ListOutput(items: provisionalCards, nextToken: nextToken)
    }

    public func getCardWithId(_ id: String, cachePolicy: CachePolicy) async throws -> Card? {
        try checkUserSignedIn()
        let keyPair: KeyPair
        do {
            let keyPairResult = publicKeyService.getCurrentKeyPair(generateKeyIfNotFound: true)
            keyPair = try keyPairResult.get()
        } catch {
            let error = convertToSudoVirtualCardsError(error)
            throw error
        }
        let query = GetCardQuery(id: id, keyId: keyPair.keyId)
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let sealedCard = data?.getCard else {
            return nil
        }
        return try unsealer.unseal(sealedCard)
    }

    public func listCardsWithFilter(
        _ filter: GetCardsFilterInput?,
        limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy
    ) async throws -> ListOutput<Card> {
        try checkUserSignedIn()
        let filter = filter?.toGraphQLFilter()
        let query = ListCardsQuery(filter: filter, limit: limit, nextToken: nextToken)
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let listCards = data?.listCards else {
            return ListOutput.empty
        }
        let cards = try listCards.items.map(unsealer.unseal(_:))
        let nextToken = listCards.nextToken
        return ListOutput(items: cards, nextToken: nextToken)
    }

    public func getFundingSourceWithId(_ id: String, cachePolicy: CachePolicy) async throws -> FundingSource? {
        try checkUserSignedIn()
        let query = GetFundingSourceQuery(id: id)
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let getFundingSource = data?.getFundingSource else {
            return nil
        }
        return FundingSource(getFundingSource: getFundingSource)
    }

    public func listFundingSourcesWithLimit(
        _ limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy
    ) async throws -> ListOutput<FundingSource> {
        try checkUserSignedIn()
        let query = ListFundingSourcesQuery(limit: limit, nextToken: nextToken)
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let listFundingSources = data?.listFundingSources else {
            return ListOutput.empty
        }
        let fundingSources = listFundingSources.items.map(FundingSource.init)
        let nextToken = listFundingSources.nextToken
        return ListOutput(items: fundingSources, nextToken: nextToken)
    }

    // MARK: - Transactions

    public func getTransactionWithId(_ id: String, cachePolicy: CachePolicy) async throws -> Transaction? {
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

    public func listTransactionsWithFilter(
        _ filter: GetTransactionsFilterInput?,
        limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy
    ) async throws -> ListOutput<Transaction> {
        return try await transactionService.list(withFilter: filter, limit: limit, nextToken: nextToken, cachePolicy: cachePolicy)
    }

    @discardableResult
    public func subscribeToTransactionUpdates(
        statusChangeHandler: SudoSubscriptionStatusChangeHandler?,
        resultHandler: @escaping ClientCompletion<Transaction>
    ) async throws -> SubscriptionToken? {
        let subscriptionId = UUID().uuidString
        let c = try await transactionService.subscribe(
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
        let mutationInput = CreatePublicKeyInput(
            keyId: input.keyId,
            keyRingId: input.keyRingId,
            algorithm: input.algorithm,
            publicKey: input.publicKey)
        let mutation = CreatePublicKeyForVirtualCardsMutation(input: mutationInput)
        let data = try await GraphQLHelper.performMutation(
            graphQLClient: graphQLClient,
            serviceErrorTransformations: [SudoVirtualCardsError.init(graphQLError:)],
            mutation: mutation,
            logger: logger
        )
        return PublicKey(createPublicKeyForVirtualCards: data.createPublicKeyForVirtualCards)
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
    func deletePublicKeyWithId(_ id: String) async throws -> PublicKey {
        try checkUserSignedIn()
        let mutationInput = DeletePublicKeyInput(keyId: id)
        let mutation = DeletePublicKeyForVirtualCardsMutation(input: mutationInput)
        let data = try await GraphQLHelper.performMutation(
            graphQLClient: graphQLClient,
            serviceErrorTransformations: [SudoVirtualCardsError.init(graphQLError:)],
            mutation: mutation,
            logger: logger
        )
        guard let key = data.deletePublicKeyForVirtualCards else {
            throw PublicKeyError.publicKeyNotFound
        }
        return PublicKey(deletePublicKeyForVirtualCards: key)
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
    func getPublicKeyWithId(_ id: String, cachePolicy: CachePolicy) async throws ->PublicKey? {
        try checkUserSignedIn()
        let query = GetPublicKeyForVirtualCardsQuery(keyId: id)
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let key = data?.getPublicKeyForVirtualCards else {
            return nil
        }
        return PublicKey(getPublicKeyForVirtualCards: key)
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
        let query = GetPublicKeysForVirtualCardsQuery(limit: limit, nextToken: nextToken)
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
        let query = GetKeyRingForVirtualCardsQuery(keyRingId: keyRingId, limit: limit, nextToken: nextToken)
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
        return
    }

    /// Call to UserClient to refresh tokens.
    ///
    /// Gets the refresh token from the user client and attempts to refresh.
    /// Will throw a `notSignedIn` Error if the the refresh token cannot be found.
    ///
    /// - Returns:
    ///   - Success: Tokens that have been refreshed.
    ///   - Failure: Failed to refresh tokens and returns cause.
    func refreshIdentityToken() async throws -> AuthenticationTokens {
        guard let refreshToken = try userClient.getRefreshToken() else {
            throw SudoVirtualCardsError.notSignedIn
        }
        do {
            let tokens = try await userClient.refreshTokens(refreshToken: refreshToken)
            return tokens
        } catch {
            throw self.convertToSudoVirtualCardsError(error)
        }
    }

    /// Convert a error to a `SudoVirtualCardsError` if possible.
    func convertToSudoVirtualCardsError(_ error: Error) -> Error {
        if let apiOperationError = error as? ApiOperationError {
            return SudoVirtualCardsError.fromApiOperationError(error: apiOperationError)
        }
        return error
    }

}
