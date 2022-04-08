//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
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

    // MARK: - Mutations

    /// Setup a funding source.
    /// - Parameters:
    ///   - input: Funding Source input information.
    /// - Returns:
    ///   - Success: The provisional Funding Source.
    ///   - Failure:
    ///     - InsufficientEntitlements.
    ///     - VelocityExceeded.
    func setupFundingSource(withInput input: SetupFundingSourceInput) async throws -> ProvisionalFundingSource

    /// Complete a provisional funding source.
    /// - Parameters:
    ///   - input: Parameters used to complete the funding source.
    /// - Returns:
    ///   - Success: The provisioned Funding Source.
    ///   - Failure:
    ///     - DuplicateFundingSource.
    ///     - FundingSourceCompletionDataInvalid.
    ///     - IdentityNotVerified.
    ///     - ProvisionalFundingSourceNotFound.
    ///     - UnacceptableFundingSource.
    func completeFundingSource(withInput input: CompleteFundingSourceInput) async throws -> FundingSource

    /// Provision a virtual card.
    ///
    /// - Returns:
    ///   - Success: A newly provisioned card information is returned.
    ///   - Failure:
    ///     - SudoPlatformError.
    ///     - SudoVirtualCardsError.
    func provisionVirtualCard(withInput input: ProvisionVirtualCardInput, observer: ProvisionVirtualCardObservable?) async throws -> ProvisionalCard.State

    /// Cancel a funding source.
    ///
    /// - Parameter id: ID of the funding source to be deleted.
    ///
    /// - Returns:
    ///   - Success: Funding source that was cancelled.
    ///   - Failure:
    ///     - SudoPlatformError.
    ///     - SudoVirtualCardsError.
    func cancelFundingSource(withId id: String) async throws -> FundingSource

    /// Update a virtual card.
    ///
    /// It is important to note that when updating a card, all fields that should remain the same should include their
    /// original data.
    ///
    /// - Parameter input: Input fields for the card update.
    /// - Returns:
    ///   - Success: Updated card.
    ///   - Failure:
    ///     - SudoPlatformError.
    func updateVirtualCard(withInput input: UpdateVirtualCardInput) async throws -> VirtualCard

    /// Cancel a virtual card.
    ///
    /// - Parameter id: ID of the card to cancel.
    ///
    /// - Returns: Record of Virtual Card that was canceled.
    func cancelVirtualCard(withId id: String) async throws -> VirtualCard

    // MARK: - Queries

    /// Get the funding source client configuration.
    /// Returns: The configuration of the client funding source data.
    func getFundingSourceClientConfiguration() async throws -> [FundingSourceClientConfiguration]

    /// Get a provisional card using the `id` parameter. If the card cannot be found, `nil` will be returned.
    ///
    /// - Parameters
    ///     - id: ID of the card to be retrieved.
    ///     - cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                    will only return cached results of similar exact API calls.
    ///
    /// - Returns:
    ///    - Success: Card associated with `id`, or `nil` if the card cannot be found.
    ///    - Failure:
    ///      - SudoPlatformError.
    func getProvisionalCard(withId id: String, cachePolicy: CachePolicy) async throws -> ProvisionalCard?

    /// Get a list of provisional cards. If no cards can be found, an empty list will be returned.
    ///
    /// - Parameter filter: Filter to be applied to results of query.
    /// - Parameter limit: Number of cards to return. If nil, the limit is 10.
    /// - Parameter nextToken: Generated token by previous calls to `listProvisionalCards`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    ///                        It is important to note that the same structured API call should be used if using a previously
    ///                        generated `nextToken`.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                    will only return cached results of similar exact API calls.
    ///
    /// - Returns:
    ///    - Success: Cards associated with user, or empty array if no card can be found.
    ///    - Failure:
    ///      - SudoPlatformError.
    func listProvisionalCards(
        withFilter filter: ListProvisionalCardsFilterInput?,
        limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy
    ) async throws -> ListOutput<ProvisionalCard>

    /// Get a card using the `id` parameter. If the card cannot be found, `nil` will be returned.
    ///
    /// - Parameters
    ///     - filter: Filter to be applied to results of query.
    ///     - id: ID of the card to be retrieved.
    ///     - cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                    will only return cached results of similar exact API calls.
    ///
    /// - Returns:
    ///    - Success: Card associated with `id`, or `nil` if the card cannot be found.
    ///    - Failure:
    ///      - SudoPlatformError.
    func getVirtualCard(
        withId id: String,
        cachePolicy: CachePolicy
    ) async throws -> VirtualCard?

    /// Get a list of cards. If no cards can be found, an empty list will be returned.
    ///
    /// - Parameter filter: Filter to be applied to results of query.
    /// - Parameter limit: Number of cards to return. If nil, the limit is 10.
    /// - Parameter nextToken: Generated token by previous calls to `getCards`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    ///                        It is important to note that the same structured API call should be used if using a previously
    ///                        generated `nextToken`.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                          will only return cached results of similar exact API calls.
    ///
    /// - Returns:
    ///    - Success: Cards associated with user, or empty array if no card can be found.
    ///    - Failure:
    ///      - SudoPlatformError.
    func listVirtualCards(
        withFilter filter: ListVirtualCardsFilterInput?,
        limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy
    ) async throws -> ListOutput<VirtualCard>

    /// Get a funding source using the `id` parameter. If the funding source cannot be found, `nil` will be returned.
    ///
    /// - Parameter id: ID of the funding source to be retrieved.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                          will only return cached results of similar exact API calls.
    ///
    /// - Returns:
    ///     - Success: `FundingSource` associated with `id`, or `nil` if the funding source cannot be found.
    ///    - Failure:
    ///      - SudoPlatformError.
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
    ///                          will only return cached results of similar exact API calls.
    ///
    /// - Returns:
    ///     - Success: `FundingSource` associated with `id`, or empty array if no card can be found.
    ///    - Failure:
    ///      - SudoPlatformError.
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
    ///                          will only return cached results of similar exact API calls.
    ///
    /// - Returns:
    ///    - Success: Transaction associated with `id`, or `nil` if the card cannot be found.
    ///    - Failure:
    ///      - SudoPlatformError.
    func getTransaction(
        withId id: String,
        cachePolicy: CachePolicy
    ) async throws -> Transaction?

    /// Get a list of transactions. If no transactions can be found, an empty list will be returned.
    ///
    /// - Parameter filter: Filter to be applied to results of query.
    /// - Parameter limit: Number of transaction to return. If nil, the limit is 10.
    /// - Parameter nextToken: Generated token by previous calls to `getTransactions`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    /// - Parameter cachePolicy: Determines how the data is fetched.
    ///
    /// - Returns:
    ///    - Success: Transactions associated with user, or empty array if no transaction can be found.
    ///    - Failure:
    ///      - SudoPlatformError.
    func listTransactions(
        withFilter filter: ListTransactionsFilterInput?,
        limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy
    ) async throws -> ListOutput<Transaction>

    // MARK: - Subscriptions

    /// Subscribe to transaction update events. This includes creation of new transactions.
    ///
    /// - Parameter statusChangeHandler: Connection status change.
    /// - Parameter resultHandler: Updated transaction event.
    ///
    /// - Returns: `SubscriptionToken` object to cancel the subscription.
    @discardableResult func subscribeToTransactionUpdates(
        statusChangeHandler: SudoSubscriptionStatusChangeHandler?,
        resultHandler: @escaping ClientCompletion<Transaction>
    ) async throws -> SubscriptionToken?
}
