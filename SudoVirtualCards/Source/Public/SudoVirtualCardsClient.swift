//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoUser
import SudoLogging

/// Generic type associated with API completion/closures. Generic type O is the expected output result in a
/// success case.
public typealias ClientCompletion<O> = (Swift.Result<O, Error>) -> Void

/// Client used to interface with the Sudo Payment Platform service.
///
/// It is recommended to code to this interface, rather than the implementation class (`DefaultSudoVirtualCardsClient`) as
/// the implementation class is only meant to be used for initializing an instance of the client.
public protocol SudoVirtualCardsClient: AnyObject {

    /// Removes all keys associated with this client, resets any cached data, cleans up subscriptions, and purges any pending operations.
    ///
    /// It is important to note that this will clear ALL cached data related to all
    /// sudo services.
    func reset() async throws

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


    /// Provision a virtual card.
    ///
    /// - Parameter input: Parameters used to provision a Virtual Card.
    /// - Returns: The newly provisioned Virtual Card.
    /// - Throws:
    ///   - SudoPlatformError.
    ///   - SudoVirtualCardsError.
    func provisionVirtualCard(withInput input: ProvisionVirtualCardInput) async throws -> VirtualCard

    /// Cancel a funding source.
    ///
    /// - Parameter id: ID of the funding source to be cancelled.
    ///
    /// - Returns: Funding source that was cancelled.
    /// - Throws:
    ///  - SudoPlatformError.
    ///  - SudoVirtualCardsError.
    func cancelFundingSource(withId id: String) async throws -> FundingSource


    /// Cancel a provisional funding source.
    ///
    /// - Parameter id: ID of the provisional funding source to be cancelled.
    ///
    /// - Returns: Provisional funding source that was cancelled and is in a failed state.
    /// - Throws:
    ///  - SudoPlatformError.
    ///  - SudoVirtualCardsError.
    func cancelProvisionalFundingSource(withId id: String) async throws -> ProvisionalFundingSource

    ///
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

    /// Imports cryptographic keys from a key archive.
    ///
    /// - Parameter archiveData: Key archive data to import the keys from.
    func importKeys(archiveData: Data) throws

    // MARK: - Queries

    /// Get a provisional card using the `id` parameter. If the card cannot be found, `nil` will be returned.
    ///
    /// - Parameter id: ID of the card to be retrieved.
    /// - Returns: Card associated with `id`, or `nil` if the card cannot be found.
    /// - Throws
    ///   - SudoPlatformError.
    func getProvisionalCard(withId id: String) async throws -> ProvisionalCard?

    /// Get a list of provisional cards. If no cards can be found, an empty list will be returned.
    ///
    /// - Parameter limit: Number of cards to return. If nil, the limit is 10.
    /// - Parameter nextToken: Generated token by previous calls to `listProvisionalCards`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    ///                        It is important to note that the same structured API call should be used if using a previously
    ///                        generated `nextToken`.
    /// - Returns:
    ///   - Success: Cards associated with user, or empty array if no card can be found.
    ///   - Partial: Mix of success and partial cards associated with user.
    /// - Throws:
    ///   - SudoPlatformError.
    func listProvisionalCards(
        withLimit limit: Int?,
        nextToken: String?
    ) async throws -> ListAPIResult<ProvisionalCard, PartialProvisionalCard>

    /// Get a card using the `id` parameter. If the card cannot be found, `nil` will be returned.
    /// - Parameter id: ID of the card to be retrieved.
    /// - Returns: Card associated with `id`, or `nil` if the card cannot be found.
    /// - Throws:
    ///   - SudoPlatformError.
    func getVirtualCard(withId id: String) async throws -> VirtualCard?

    /// Get the current `VirtualCardsConfig`.
    /// - Returns: Virtual card config associated with account.
    /// - Throws:
    ///   - SudoPlatformError.
    func getVirtualCardsConfig() async throws -> VirtualCardsConfig

    /// Get a list of cards. If no cards can be found, an empty list will be returned.
    ///
    /// - Parameter filter: The filter to be applied to the list of virtual cards to return.
    /// - Parameter limit: Number of cards to return. If nil, the limit is 10.
    /// - Parameter sortOrder: Order in which records are returned (based on date/time at which the funding source was updated).
    ///                        The default order is descending, ie, most recently updated first.
    /// - Parameter nextToken: Generated token by previous calls to `getCards`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    ///                        It is important to note that the same structured API call should be used if using a previously
    ///                        generated `nextToken`.
    /// - Returns:
    ///    - Success: Cards associated with user, or empty array if no card can be found.
    ///    - Partial: Mix of success and partial cards associated with user.
    /// - Throws:
    ///    - SudoPlatformError.
    func listVirtualCards(
        withFilter filter: VirtualCardFilterInput?,
        sortOrder: SortOrderInput?,
        withLimit limit: Int?,
        nextToken: String?
    ) async throws -> ListAPIResult<VirtualCard, PartialVirtualCard>

    /// Get a funding source using the `id` parameter. If the funding source cannot be found, `nil` will be returned.
    /// - Parameter id: ID of the funding source to be retrieved.
    /// - Returns: `FundingSource` associated with `id`, or `nil` if the funding source cannot be found.
    /// - Throws:
    ///   - SudoPlatformError.
    func getFundingSource(withId id: String) async throws -> FundingSource?

    /// Get a list of funding sources. If no funding sources can be found, an empty list will be returned.
    ///
    /// - Parameter filter: The filter to be applied to the list of funding sources to return.
    /// - Parameter sortOrder: Order in which records are returned (based on date/time at which the funding source was updated).
    ///                        The default order is descending, ie, most recently updated first.
    /// - Parameter limit: Number of funding sources to return. If `nil`, the limit is 10.
    /// - Parameter nextToken: Generated token by previous calls to `getFundingSources`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    ///                        It is important to note that the same structured API call should be used if using a previously
    ///                        generated `nextToken`.
    /// - Returns: `FundingSource`s or empty array if no funding source can be found.
    /// - Throws:
    ///   - SudoPlatformError.
    func listFundingSources(
        withFilter filter: FundingSourceFilterInput?,
        sortOrder: SortOrderInput?,
        withLimit limit: Int?,
        nextToken: String?
    ) async throws -> ListOutput<FundingSource>

    /// Get a list of provisional funding sources. If no provisional funding sources can be found, an empty list will be returned.
    ///
    /// - Parameter filter: The filter to be applied to the list of provisional funding sources to return.
    /// - Parameter sortOrder: Order in which records are returned (based on date/time at which the funding source was updated).
    ///                        The default order is descending, ie, most recently updated first.
    /// - Parameter limit: Number of funding sources to return. If `nil`, the limit is 10.
    /// - Parameter nextToken: Generated token by previous calls to `getProvisionalFundingSources`. This is used for pagination.
    ///                        This value should be pre-generated from a previous pagination call, otherwise it will throw an error.
    ///                        It is important to note that the same structured API call should be used if using a previously
    ///                        generated `nextToken`.
    /// - Returns: `FundingSource`s matching `filter`, or empty array if no funding source can be found.
    /// - Throws:
    ///   - SudoPlatformError.
    func listProvisionalFundingSources(
        withFilter filter: ProvisionalFundingSourceFilterInput?,
        sortOrder: SortOrderInput?,
        limit: Int?,
        nextToken: String?
    ) async throws -> ListOutput<ProvisionalFundingSource>

    /// Export the cryptographic keys to a key archive.
    ///
    /// - Returns: Key archive data.
    func exportKeys() throws -> Data

    // MARK: - Methods: Transactions

    /// Get a transaction using the `id` parameter. If the transaction cannot be found, `nil` will be returned.
    /// - Parameter id: ID of the transaction to be retrieved.
    /// - Returns: Transaction associated with `id`, or `nil` if the transaction cannot be found.
    /// - Throws:
    ///   - SudoPlatformError.
    func getTransaction(withId id: String) async throws -> Transaction?

    /// Get a list of transactions by card id. If no transactions can be found, an empty list will be returned.
    ///
    /// - Parameter cardId: Identifier of the card for which associated transactions will be returned.
    /// - Parameter limit: Number of transactions to return. If nil, the limit is up to 1MB of data returned from the service.
    /// - Parameter nextToken: Generated token by previous calls to `listTransactions`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    /// - Parameter dateRange: Range of upper and lower date limits for records.
    /// - Parameter sortOrder: Order in which records are returned (based on date).
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
        sortOrder: SortOrderInput?
    ) async throws -> ListAPIResult<Transaction, PartialTransaction>

    /// Get a list of transactions by card id and transaction type. If no transactions can be found, an empty list will be returned.
    ///
    /// - Parameter cardId: Identifier of the card for which associated transactions will be returned.
    /// - Parameter transactionType: The type of transactions to retrieve.
    /// - Parameter limit: Number of transaction to return. If nil, the limit is up to 1MB of data returned from the service.
    /// - Parameter nextToken: Generated token by previous calls to `listTransactions`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    /// - Returns:
    ///   - Success: Transactions of specific type associated with the virtual card, or empty array if no transaction can be found.
    ///   - Partial: Mix of complete and partial Transactions associated with the virtual card.
    /// - Throws:
    ///   - SudoPlatformError.
    func listTransactions(
        withCardId cardId: String,
        withTransactionType transactionType: TransactionType,
        limit: Int?,
        nextToken: String?
    ) async throws -> ListAPIResult<Transaction, PartialTransaction>

    /// Get a list of transactions. If no transactions can be found, an empty list will be returned.
    ///
    /// - Parameter limit: Number of transaction to return. If nil, the limit is 10.
    /// - Parameter nextToken: Generated token by previous calls to `listTransactions`. This is used for pagination. This value should be
    ///                        pre-generated from a previous pagination call, otherwise it will throw an error.
    /// - Parameter dateRange: Range of upper and lower date limits for records.
    /// - Parameter sortOrder: Order in which records are returned (based on date).
    /// - Returns:
    ///   - Success: Transactions associated with user, or empty array if no transaction can be found.
    ///   - Partial: Mix of complete and partial Transactions associated with user.
    /// - Throws:
    ///   - SudoPlatformError.
    func listTransactions(
        withLimit limit: Int?,
        nextToken: String?,
        dateRange: DateRangeInput?,
        sortOrder: SortOrderInput?
    ) async throws -> ListAPIResult<Transaction, PartialTransaction>
    
    // MARK: - Sign-In Delegate

    /// Sets an optional delegate to handle sign-in when operations are attempted while not signed in.
    ///
    /// When set, all operations (except subscriptions and initialization) will check sign-in status
    /// and invoke the delegate's `signIn()` method if the user is not signed in. The delegate should
    /// handle the sign-in process and throw an error if sign-in fails or is cancelled. If the delegate
    /// throws an error, that error will be propagated to the caller and the original operation will not be executed.
    ///
    /// - Parameter delegate: A delegate conforming to `SudoPlatformSignInDelegate`. Pass nil to disable sign-in checking.
    ///
    func setSignInDelegate(_ delegate: SudoPlatformSignInDelegate?) async

    // MARK: - Subscriptions

    /// Subscribes to be notified of changes to distributed vaults and members.
    ///
    /// - Parameter id: Unique ID to be associated with the subscriber.
    /// - Parameter notificationType: Notification type to subscribe to.
    /// - Parameter subscriber: Subscriber to notify.
    func subscribe(id: String, notificationType: SubscriptionNotificationType, subscriber: Subscriber) async throws

    /// Unsubscribes the specified subscriber so that it no longer receives change notifications.
    ///
    /// - Parameter id: Unique ID associated with the subscriber to unsubscribe.
    func unsubscribe(id: String) async

    /// Unsubscribe all subscribers from receiving notifications about changes to distributed vaults and members.
    func unsubscribeAll() async

}
