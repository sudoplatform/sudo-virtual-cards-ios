//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SudoUser
import AWSAppSync
import SudoLogging
import SudoProfiles
import SudoOperations

/// Generic type associated with API completion/closures. Generic type O is the expected output result in a
/// success case.
public typealias ClientCompletion<O> = (Swift.Result<O, Error>) -> Void

/// Generic type associated with Subscription Status change completion/closures.
public typealias SudoSubscriptionStatusChangeHandler = (PlatformSubscriptionStatus) -> Void

/// Client used to interface with the Sudo Payment Platform service.
///
/// It is recommended to code to this interface, rather than the implementation class (`DefaultSudoVirtualCardsClient`) as
/// the implementation class is only meant to be used for initializing an instance of the client.
public protocol SudoVirtualCardsClient: class {

    /// Removes all keys associated with this client, resets any cached data, cleans up subscriptions, and purges any pending operations.
    ///
    /// It is important to note that this will clear ALL cached data related to all
    /// sudo services.
    func reset() throws

    // MARK: - Mutations

    /// Provision a card.
    ///
    /// - Returns:
    ///   - Success: A newly provisioned card information is returned.
    ///   - Failure:
    ///     - SudoPlatformError.
    ///     - CardProvisionError.
    func provisionCardWithInput(
        _ input: ProvisionCardInput,
        completion: @escaping ClientCompletion<ProvisionalCard.State>,
        observer: ProvisionCardObservable?
    )

    /// Creates a Funding Source using a Credit Card input.
    ///
    /// - Parameters:
    ///   - input: Credit card information.
    ///   - authorizationDelegate: `FundingSourceAuthorizationDelegate` delegate to forward any UI hooks to stripe 3Ds with.
    /// - Returns:
    ///   - Success: Newly created Funding Source with a credit card.
    ///   - Failure:
    ///     - SudoPlatformError.
    ///     - SudoVirtualCardsError.
    ///     - FundingSourceError.
    func createFundingSource(
        withCreditCardInput input: CreditCardFundingSourceInput,
        authorizationDelegate: FundingSourceAuthorizationDelegate?,
        completion: @escaping ClientCompletion<FundingSource>
    )

    /// Cancel a funding source.
    ///
    /// - Parameter id: ID of the funding source to be deleted.
    ///
    /// - Returns:
    ///   - Success: Funding source that was cancelled.
    ///   - Failure:
    ///     - SudoPlatformError.
    ///     - FundingSourceError.
    func cancelFundingSourceWithId(
        _ id: String,
        completion: @escaping ClientCompletion<FundingSource>
    )

    /// Update a card.
    ///
    /// It is important to note that when updating a card, all fields that should remain the same should include their
    /// original data.
    ///
    /// - Parameter input: Input fields for the card update.
    /// - Returns:
    ///   - Success: Updated card.
    ///   - Failure:
    ///     - SudoPlatformError.
    func updateCardWithInput(
        _ input: UpdateCardInput,
        completion: @escaping ClientCompletion<Card>
    )

    func cancelCardWithId(
        _ id: String,
        completion: @escaping ClientCompletion<Card>
    )

    // MARK: - Queries

    /// Get a provisional card using the `id` parameter. If the card cannot be found, `nil` will be returned.
    ///
    /// - Parameters
    ///     - id: ID of the card to be retrieved.
    ///     - cachePolicy: Determines how the data is fetched. When using `useCache`, please be aware that this
    ///                    will only return cached results of similar exact API calls.
    ///
    /// - Returns:
    ///    - Success: Card associated with `id`, or `nil` if the card cannot be found.
    ///    - Failure:
    ///      - SudoPlatformError.
    func getProvisionalCardWithId(
        _ id: String,
        cachePolicy: CachePolicy,
        completion: @escaping ClientCompletion<ProvisionalCard?>
    )

    /// Get a list of provisional cards. If no cards can be found, an empty list will be returned.
    ///
    /// - Parameter filter: Filter to be applied to results of query.
    /// - Parameter limit: Number of cards to return. If nil, the limit is 10.
    /// - Parameter nextToken: Generated token by previous calls to `getCards`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    ///                        It is important to note that the same structured API call should be used if using a previously
    ///                        generated `nextToken`.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `useCache`, please be aware that this
    ///                    will only return cached results of similar exact API calls.
    ///
    /// - Returns:
    ///    - Success: Cards associated with user, or empty array if no card can be found.
    ///    - Failure:
    ///      - SudoPlatformError.
    func getProvisionalCardsWithFilter(
        _ filter: GetProvisionalCardsFilterInput?,
        limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy,
        completion: @escaping ClientCompletion<ListOutput<ProvisionalCard>>
    )

    /// Get a card using the `id` parameter. If the card cannot be found, `nil` will be returned.
    ///
    /// - Parameters
    ///     - filter: Filter to be applied to results of query.
    ///     - id: ID of the card to be retrieved.
    ///     - cachePolicy: Determines how the data is fetched. When using `useCache`, please be aware that this
    ///                    will only return cached results of similar exact API calls.
    ///
    /// - Returns:
    ///    - Success: Card associated with `id`, or `nil` if the card cannot be found.
    ///    - Failure:
    ///      - SudoPlatformError.
    func getCardWithId(
        _ id: String,
        cachePolicy: CachePolicy,
        completion: @escaping ClientCompletion<Card?>
    )

    /// Get a list of cards. If no cards can be found, an empty list will be returned.
    ///
    /// - Parameter filter: Filter to be applied to results of query.
    /// - Parameter limit: Number of cards to return. If nil, the limit is 10.
    /// - Parameter nextToken: Generated token by previous calls to `getCards`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    ///                        It is important to note that the same structured API call should be used if using a previously
    ///                        generated `nextToken`.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `useCache`, please be aware that this
    ///                          will only return cached results of similar exact API calls.
    ///
    /// - Returns:
    ///    - Success: Cards associated with user, or empty array if no card can be found.
    ///    - Failure:
    ///      - SudoPlatformError.
    func getCardsWithFilter(
        _ filter: GetCardsFilterInput?,
        limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy,
        completion: @escaping ClientCompletion<ListOutput<Card>>
    )

    /// Get a funding source using the `id` parameter. If the funding source cannot be found, `nil` will be returned.
    ///
    /// - Parameter id: ID of the funding source to be retrieved.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `useCache`, please be aware that this
    ///                          will only return cached results of similar exact API calls.
    ///
    /// - Returns:
    ///     - Success: `FundingSource` associated with `id`, or `nil` if the funding source cannot be found.
    ///    - Failure:
    ///      - SudoPlatformError.
    func getFundingSourceWithId(
        _ id: String,
        cachePolicy: CachePolicy,
        completion: @escaping ClientCompletion<FundingSource?>
    )

    /// Get a list of funding sources. If no funding sources can be found, an empty list will be returned.
    ///
    /// - Parameter limit: Number of funding sources to return. If `nil`, the limit is 10.
    /// - Parameter nextToken: Generated token by previous calls to `getFundingSources`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    ///                        It is important to note that the same structured API call should be used if using a previously
    ///                        generated `nextToken`.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `useCache`, please be aware that this
    ///                          will only return cached results of similar exact API calls.
    ///
    /// - Returns:
    ///     - Success: `FundingSource` associated with `id`, or empty array if no card can be found.
    ///    - Failure:
    ///      - SudoPlatformError.
    func getFundingSourcesWithLimit(
        _ limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy,
        completion: @escaping ClientCompletion<ListOutput<FundingSource>>
    )

    // MARK: - Methods: Transactions

    /// Get a transaction using the `id` parameter. If the transaction cannot be found, `nil` will be returned.
    ///
    /// - Parameter id: ID of the transaction to be retrieved.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `useCache`, please be aware that this
    ///                          will only return cached results of similar exact API calls.
    ///
    /// - Returns:
    ///    - Success: Transaction associated with `id`, or `nil` if the card cannot be found.
    ///    - Failure:
    ///      - SudoPlatformError.
    func getTransactionWithId(
        _ id: String,
        cachePolicy: CachePolicy,
        completion: @escaping ClientCompletion<Transaction?>
    )

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
    func getTransactionsWithFilter(
        _ filter: GetTransactionsFilterInput?,
        limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy,
        completion: @escaping ClientCompletion<ListOutput<Transaction>>
    )

    // MARK: - Subscriptions

    /// Subscribe to transaction update events. This includes creation of new transactions.
    ///
    /// - Parameter statusChangeHandler: Connection status change.
    /// - Parameter resultHandler: Updated transaction event.
    ///
    /// - Returns: `Cancellable` object to cancel the subscription.
    @discardableResult func subscribeToTransactionUpdates(
        statusChangeHandler: SudoSubscriptionStatusChangeHandler?,
        resultHandler: @escaping ClientCompletion<Transaction>
    ) throws -> Cancellable?
}
