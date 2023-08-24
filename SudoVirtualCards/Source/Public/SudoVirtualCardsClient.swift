//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SudoUser
import SudoLogging

/// Generic type associated with API completion/closures. Generic type O is the expected output result in a
/// success case.
public typealias ClientCompletion<O> = (Swift.Result<O, Error>) -> Void

/// Generic type associated with Subscription Status change completion/closures.
public typealias SudoSubscriptionStatusChangeHandler = (PlatformSubscriptionStatus) -> Void

/// Client used to interface with the Sudo Payment Platform service.
///
/// It is recommended to code to this interface, rather than the implementation class (`DefaultSudoVirtualCardsClient`) as
/// the implementation class is only meant to be used for initializing an instance of the client.
public protocol SudoVirtualCardsClient: AnyObject {

    /// Removes all keys associated with this client, resets any cached data, cleans up subscriptions, and purges any pending operations.
    ///
    /// It is important to note that this will clear ALL cached data related to all
    /// sudo services.
    func reset() throws

    /// Create key pair and secret key for use by the Virtual Cards Client if they have not already been created.
    ///
    /// The key pair is used to register a public key with the service for the encryption of virtual card and transaction details.
    ///
    /// The secret key is used for client side encryption of user specific card metadata.
    func createKeysIfAbsent() async throws -> CreateKeysIfAbsentResult

    // MARK: - Mutations

    /// Setup a funding source.
    /// - Parameters:
    ///   - input: Funding Source input information.
    /// - Returns: The provisional Funding Source.
    /// - Throws:
    ///   - InsufficientEntitlements.
    ///   - VelocityExceeded.
    func setupFundingSource(withInput input: SetupFundingSourceInput) async throws -> ProvisionalFundingSource

    /// Complete a provisional funding source.
    /// - Parameters:
    ///   - input: Parameters used to complete the funding source.
    /// - Returns: The provisioned Funding Source.
    /// - Throws:
    ///   - DuplicateFundingSource.
    ///   - FundingSourceCompletionDataInvalid.
    ///   - IdentityNotVerified.
    ///   - ProvisionalFundingSourceNotFound.
    ///   - UnacceptableFundingSource.
    func completeFundingSource(withInput input: CompleteFundingSourceInput) async throws -> FundingSource

    /// Refresh a funding source.
    /// - Parameters:
    ///   - input: Parameters used to refresh the funding source.
    /// - Returns:The refreshed Funding Source.
    /// - Throws:
    ///     - FundingSourceCompletionDataInvalid.
    ///     - FundingSourceNotFound.
    ///     - UnacceptableFundingSource.
    ///     - FundingSourceRequiresUserInteraction.
    func refreshFundingSource(withInput input: RefreshFundingSourceInput) async throws -> FundingSource

    /// Provision a virtual card.
    ///
    /// - Parameters:
    ///   - input: Parameters used to provision a Virtual Card.
    ///   - observer: Observable for Provision Virtual Card API events.
    /// - Returns: The newly provisioned card information.
    /// - Throws:
    ///   - SudoPlatformError.
    ///   - SudoVirtualCardsError.
    func provisionVirtualCard(withInput input: ProvisionVirtualCardInput, observer: ProvisionVirtualCardObservable?) async throws -> ProvisionalCardState

    /// Cancel a funding source.
    ///
    /// - Parameter id: ID of the funding source to be cancelled.
    ///
    /// - Returns: Funding source that was cancelled.
    /// - Throws:
    ///  - SudoPlatformError.
    ///  - SudoVirtualCardsError.
    func cancelFundingSource(withId id: String) async throws -> FundingSource

    /// Update a virtual card.
    ///
    /// It is important to note that when updating a card, all fields are updated, therefore, any fields that should
    /// remain the same must include their original data.
    ///
    /// - Parameters:
    ///  - input: Parameters used to update a Virtual Card.
    /// - Returns:
    ///   - Success: The Virtual Card that was updated.
    ///   - Partial: Partial record of updated Virtual Card.
    /// - Throws:
    ///   - SudoPlatformError.
    func updateVirtualCard(withInput input: UpdateVirtualCardInput) async throws -> SingleAPIResult<VirtualCard, PartialVirtualCard>

    /// Cancel a virtual card.
    ///
    /// - Parameter id: ID of the card to cancel.
    ///
    /// - Returns:
    ///   - Success: Record of Virtual Card that was canceled.
    ///   - Partial: Partial record of cancelled Virtual Card
    func cancelVirtualCard(withId id: String) async throws -> SingleAPIResult<VirtualCard, PartialVirtualCard>

    // MARK: - Queries

    /// Get the funding source client configuration.
    ///
    /// - Returns: The configuration of the client funding source data.
    @available(*, deprecated, message: "Use getVirtualCardsConfig instead to retrieve the FundingSourceClientConfiguration")
    func getFundingSourceClientConfiguration() async throws -> [FundingSourceClientConfiguration]

    /// Get a provisional card using the `id` parameter. If the card cannot be found, `nil` will be returned.
    ///
    /// - Parameters
    ///     - id: ID of the card to be retrieved.
    ///     - cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                    will only return cached results of identical API calls.
    ///
    /// - Returns: Card associated with `id`, or `nil` if the card cannot be found.
    /// - Throws
    ///   - SudoPlatformError.
    func getProvisionalCard(withId id: String, cachePolicy: CachePolicy) async throws -> ProvisionalCard?

    /// Get a list of provisional cards. If no cards can be found, an empty list will be returned.
    ///
    /// - Parameter limit: Number of cards to return. If nil, the limit is 10.
    /// - Parameter nextToken: Generated token by previous calls to `listProvisionalCards`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    ///                        It is important to note that the same structured API call should be used if using a previously
    ///                        generated `nextToken`.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                    will only return cached results of identical API calls.
    ///
    /// - Returns:
    ///   - Success: Cards associated with user, or empty array if no card can be found.
    ///   - Partial: Mix of success and partial cards associated with user.
    /// - Throws:
    ///   - SudoPlatformError.
    func listProvisionalCards(
        withLimit limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy
    ) async throws -> ListAPIResult<ProvisionalCard, PartialProvisionalCard>

    /// Get a card using the `id` parameter. If the card cannot be found, `nil` will be returned.
    ///
    /// - Parameters
    ///     - id: ID of the card to be retrieved.
    ///     - cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                    will only return cached results of identical API calls.
    ///
    /// - Returns: Card associated with `id`, or `nil` if the card cannot be found.
    /// - Throws:
    ///   - SudoPlatformError.
    func getVirtualCard(
        withId id: String,
        cachePolicy: CachePolicy
    ) async throws -> VirtualCard?

    /// Get the current `VirtualCardsConfig`. If the config cannot be found, `nil` will be returned.
    ///
    /// - Parameters
    ///     - cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                    will only return cached results of identical API calls.
    ///
    /// - Returns: Virtual card config associated with account, or `nil` if the coinfig cannot be found.
    /// - Throws:
    ///   - SudoPlatformError.
    func getVirtualCardsConfig(
        cachePolicy: CachePolicy
    ) async throws -> VirtualCardsConfig?

    /// Get a list of cards. If no cards can be found, an empty list will be returned.
    ///
    /// - Parameter limit: Number of cards to return. If nil, the limit is 10.
    /// - Parameter nextToken: Generated token by previous calls to `getCards`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    ///                        It is important to note that the same structured API call should be used if using a previously
    ///                        generated `nextToken`.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                          will only return cached results of identical API calls.
    ///
    /// - Returns:
    ///    - Success: Cards associated with user, or empty array if no card can be found.
    ///    - Partial: Mix of success and partial cards associated with user.
    /// - Throws:
    ///    - SudoPlatformError.
    func listVirtualCards(
        withLimit limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy
    ) async throws -> ListAPIResult<VirtualCard, PartialVirtualCard>

    /// Get a funding source using the `id` parameter. If the funding source cannot be found, `nil` will be returned.
    ///
    /// - Parameter id: ID of the funding source to be retrieved.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                          will only return cached results of identical API calls.
    ///
    /// - Returns: `FundingSource` associated with `id`, or `nil` if the funding source cannot be found.
    /// - Throws:
    ///   - SudoPlatformError.
    func getFundingSource(
        withId id: String,
        cachePolicy: CachePolicy
    ) async throws -> FundingSource?

    /// Get a list of funding sources. If no funding sources can be found, an empty list will be returned.
    ///
    /// - Parameter limit: Number of funding sources to return. If `nil`, the limit is 10.
    /// - Parameter nextToken: Generated token by previous calls to `getFundingSources`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    ///                        It is important to note that the same structured API call should be used if using a previously
    ///                        generated `nextToken`.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                          will only return cached results of identical API calls.
    ///
    /// - Returns: `FundingSource`s associated with `id`, or empty array if no funding source can be found.
    /// - Throws:
    ///   - SudoPlatformError.
    func listFundingSources(
        withLimit limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy
    ) async throws -> ListOutput<FundingSource>

    // MARK: - Methods: Transactions

    /// Get a transaction using the `id` parameter. If the transaction cannot be found, `nil` will be returned.
    ///
    /// - Parameter id: ID of the transaction to be retrieved.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                          will only return cached results of identical API calls.
    ///
    /// - Returns: Transaction associated with `id`, or `nil` if the transaction cannot be found.
    /// - Throws:
    ///   - SudoPlatformError.
    func getTransaction(
        withId id: String,
        cachePolicy: CachePolicy
    ) async throws -> Transaction?

    /// Get a list of transactions by card id. If no transactions can be found, an empty list will be returned.
    ///
    /// - Parameter cardId: Identifier of the card for which associated transactions will be returned.
    /// - Parameter limit: Number of transactions to return. If nil, the limit is up to 1MB of data returned from the service.
    /// - Parameter nextToken: Generated token by previous calls to `listTransactions`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    /// - Parameter dateRange: Range of upper and lower date limits for records.
    /// - Parameter sortOrder: Order in which records are returned (based on date).
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                          will only return cached results of identical API calls.
    ///
    /// - Returns:
    ///   - Success: Transactions associated with the virtual card, or empty array if no transaction can be found.
    ///   - Partial: Mix of complete and partial Transactions associated with the virtual card.
    /// - Throws:
    ///   - SudoPlatformError.
    func listTransactions(
        withCardId cardId: String,
        limit: Int?,
        nextToken: String?,
        dateRange: DateRangeInput?,
        sortOrder: SortOrderInput?,
        cachePolicy: CachePolicy
    ) async throws -> ListAPIResult<Transaction, PartialTransaction>

    /// Get a list of transactions by card id and transaction type. If no transactions can be found, an empty list will be returned.
    ///
    /// - Parameter cardId: Identifier of the card for which associated transactions will be returned.
    /// - Parameter transactionType: The type of transactions to retrieve.
    /// - Parameter limit: Number of transaction to return. If nil, the limit is up to 1MB of data returned from the service.
    /// - Parameter nextToken: Generated token by previous calls to `listTransactions`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                          will only return cached results of identical API calls.
    ///
    /// - Returns:
    ///   - Success: Transactions of specific type associated with the virtual card, or empty array if no transaction can be found.
    ///   - Partial: Mix of complete and partial Transactions associated with the virtual card.
    /// - Throws:
    ///   - SudoPlatformError.
    func listTransactions(
        withCardId cardId: String,
        withTransactionType transactionType: TransactionType,
        limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy
    ) async throws -> ListAPIResult<Transaction, PartialTransaction>

    /// Get a list of transactions. If no transactions can be found, an empty list will be returned.
    ///
    /// - Parameter limit: Number of transaction to return. If nil, the limit is 10.
    /// - Parameter nextToken: Generated token by previous calls to `listTransactions`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    /// - Parameter dateRange: Range of upper and lower date limits for records.
    /// - Parameter sortOrder: Order in which records are returned (based on date).
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                          will only return cached results of identical API calls.
    ///
    /// - Returns:
    ///   - Success: Transactions associated with user, or empty array if no transaction can be found.
    ///   - Partial: Mix of complete and partial Transactions associated with user.
    /// - Throws:
    ///   - SudoPlatformError.
    func listTransactions(
        withLimit limit: Int?,
        nextToken: String?,
        dateRange: DateRangeInput?,
        sortOrder: SortOrderInput?,
        cachePolicy: CachePolicy
    ) async throws -> ListAPIResult<Transaction, PartialTransaction>

    // MARK: - Subscriptions

    /// Subscribe to transaction update events. This includes creation of new transactions.
    ///
    /// - Parameter statusChangeHandler: Connection status change.
    /// - Parameter resultHandler: Updated transaction event.
    ///
    /// - Returns: `SubscriptionToken` object to cancel the subscription.
    @discardableResult func subscribeToTransactionUpdated(
        statusChangeHandler: SudoSubscriptionStatusChangeHandler?,
        resultHandler: @escaping ClientCompletion<Transaction>
    ) async throws -> SubscriptionToken?

    /// Subscribe to transaction delete events.
    ///
    /// - Parameter statusChangeHandler: Connection status change.
    /// - Parameter resultHandler: Deleted transaction event.
    ///
    /// - Returns: `SubscriptionToken` object to cancel the subscription.
    @discardableResult func subscribeToTransactionDeleted(
        statusChangeHandler: SudoSubscriptionStatusChangeHandler?,
        resultHandler: @escaping ClientCompletion<Transaction>
    ) async throws -> SubscriptionToken?

    // MARK: - Sandbox APIs

    /// Sandbox API to obtain data normally returned by full Plaid Link flow. Useful for testing
    /// ahead of full Plaid Link integration during application development.
    ///
    /// - Parameter institutionId: ID of Plaid sandbox institution to use
    /// - Parameter plaidUsername: Username of Plaid sandbox user to obtain data for
    ///
    /// - Returns:`SandboxPlaidData` object containing sandbox Plaid data for populating completion
    ///  data before calling `completeFundingSource`
    func sandboxGetPlaidData(
        institutionId: String,
        plaidUsername: String
    ) async throws -> SandboxPlaidData

    /// Sandbox API to set a funding source to refresh state to facilitate testing
    ///
    /// - Parameter id: ID of funding source to set to refresh state. Must identify a bank account funding source.
    ///
    /// - Returns: `FundingSource` that has been set to refresh state
    func sandboxSetFundingSourceToRequireRefresh(
        fundingSourceId: String
    ) async throws -> FundingSource
}

extension SudoVirtualCardsClient {
    /// Get a list of transactions. If no transactions can be found, an empty list will be returned.
    ///
    /// - Parameter limit: Number of transaction to return. If nil, the limit is 10.
    /// - Parameter nextToken: Generated token by previous calls to `getTransactions`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                          will only return cached results of identical API calls.
    ///
    /// - Returns:
    ///   - Success: Transactions associated with user, or empty array if no transaction can be found.
    ///   - Partial: Mix of partial and complete Transactions associated with user.
    /// - Throws:
    ///   - SudoPlatformError.
    @available(*, deprecated, message: "Added new dateRange and sortOrder parameters")
    func listTransactions(
        withLimit limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy
    ) async throws -> ListAPIResult<Transaction, PartialTransaction> {
        return try await listTransactions(
            withLimit: limit,
            nextToken: nextToken,
            dateRange: nil,
            sortOrder: nil,
            cachePolicy: cachePolicy)
    }
}
