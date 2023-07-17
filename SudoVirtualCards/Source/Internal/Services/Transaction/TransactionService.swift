//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSAppSync
import SudoUser
import SudoLogging
import SudoApiClient

/// Abstraction of the SDKs capabilities surrounding `Transaction` access/manipulation with virtual cards service.
class TransactionService {

    // MARK: - Properties

    /// Used to determine if the user is signed in and access the user owner ID.
    /// Unowned used since this should always outlive the lifetime of this class.
    private unowned let userClient: SudoUserClient

    /// Used to make GraphQL requests to AWS. Injected into operations to delegate the calls.
    private unowned let graphQLClient: SudoApiClient

    /// Used to unseal incoming transactions.
    private unowned let unsealer: Unsealer

    /// Logs errors and diagnostic information.
    private let logger: Logger

    /// Weak reference to existing subscriptions.
    var subscriptions: [WeakCancellable] = []

    // MARK: - Lifecycle

    /// Initialize an instance of `TransactionService`.
    init(
        userClient: SudoUserClient,
        graphQLClient: SudoApiClient,
        unsealer: Unsealer,
        logger: Logger = Logger.virtualCardsSDKLogger
    ) {
        self.userClient = userClient
        self.graphQLClient = graphQLClient
        self.unsealer = unsealer
        self.logger = logger
    }

    /// Clear all existing subscriptions created by `subscribe(withStatusChangeHandler:resultHandler:)`.
    func clearSubscriptions() {
        subscriptions.forEach { $0.value?.cancel() }
        subscriptions.removeAll()
    }

    // MARK: - TransactionService

    /// Get a singular transaction.
    ///
    /// - Parameters:
    ///   - id: ID of the transaction to be retrieved.
    ///   - cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this will only return cached results of similar exact
    ///         API calls.
    ///   - keyPair: Key used to decrypt the payload.
    /// - Returns:
    ///    - Success: Transaction associated with `id`, or `nil` if the card cannot be found.
    ///    - Failure: `Error` that occurred.
    func get(withId id: String, cachePolicy: CachePolicy, keyPair: KeyPair) async throws -> Transaction? {
        let query = GraphQL.GetTransactionQuery(id: id, keyId: keyPair.keyId)
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let result = data?.getTransaction else {
            return nil
        }
        do {
            return try unsealer.unseal(result.fragments.sealedTransaction)
        } catch {
            logger.error("failed to decode transaction: \(error)")
            throw error
        }
    }

    /// Get a list of transactions by cardId. If no transactions can be found, an empty list will be returned.
    /// - Parameters:
    ///   - cardId: Identifier of the card for associated transactions.
    ///   - limit: Number of transaction to return. If nil, the limit is 10.
    ///   - nextToken: Generated token by previous calls to `list`. This is used for pagination. This value should be pre-generated from a previous
    ///         pagination call, otherwise it will throw an error.
    ///   - dateRange: Range of upper and lower date limits for records.
    ///   - sortOrder: Order in which records are returned (based on date).
    ///   - cachePolicy: Determines how the data is fetched.
    /// - Returns:
    ///    - Success: Transactions associated with user, or empty array if no transaction can be found.
    ///    - Failure: `Error` that occurred.
    func list(
        withCardId cardId: String,
        limit: Int?,
        nextToken: String?,
        dateRange: DateRangeInput?,
        sortOrder: SortOrderInput?,
        cachePolicy: CachePolicy
    ) async throws -> ListAPIResult<Transaction, PartialTransaction> {
        let query = GraphQL.ListTransactionsByCardIdQuery(
            cardId: cardId,
            limit: limit,
            nextToken: nextToken,
            dateRange: dateRange?.toGraphQL(),
            sortOrder: sortOrder?.toGraphQL()
        )
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let listTransactions = data?.listTransactionsByCardId2 else {
            return .empty
        }
        let nextToken = listTransactions.nextToken
        var success: [Transaction] = []
        var partials: [PartialResult<PartialTransaction>] = []
        for listTransaction in listTransactions.items {
            do {
                let unsealedTransaction = try unsealer.unseal(listTransaction.fragments.sealedTransaction)
                success.append(unsealedTransaction)
            } catch {
                let transaction = listTransaction.fragments.sealedTransaction
                partials.append(PartialResult(transaction: transaction, error: error))
            }
        }
        return deduplicateTransactionListResult(success: success, partials: partials, nextToken: nextToken)
    }
    
    /// Get a list of transactions by cardId and transaction type. If no transactions can be found, an empty list will be returned.
    /// - Parameters:
    ///   - cardId: Identifier of the card for associated transactions.
    ///   - transactionType: The type of transactions to retrieve.
    ///   - limit: Number of transaction to return. If nil, the limit is 10.
    ///   - nextToken: Generated token by previous calls to `list`. This is used for pagination. This value should be pre-generated from a previous
    ///         pagination call, otherwise it will throw an error.
    ///   - cachePolicy: Determines how the data is fetched.
    /// - Returns:
    ///    - Success: Transactions associated with user, or empty array if no transaction can be found.
    ///    - Failure: `Error` that occurred.
    func list(
        withCardId cardId: String,
        withTransactionType transactionType: TransactionType,
        limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy
    ) async throws -> ListAPIResult<Transaction, PartialTransaction> {
        if (transactionType.toGraphQL() == nil) {
            throw SudoVirtualCardsError.unrecognizedTransactionType
        }
        let query = GraphQL.ListTransactionsByCardIdAndTypeQuery(
            cardId: cardId,
            transactionType: transactionType.toGraphQL()!,
            limit: limit,
            nextToken: nextToken
        )
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let listTransactions = data?.listTransactionsByCardIdAndType else {
            return .empty
        }
        let nextToken = listTransactions.nextToken
        var success: [Transaction] = []
        var partials: [PartialResult<PartialTransaction>] = []
        for listTransaction in listTransactions.items {
            do {
                let unsealedTransaction = try unsealer.unseal(listTransaction.fragments.sealedTransaction)
                success.append(unsealedTransaction)
            } catch {
                let transaction = listTransaction.fragments.sealedTransaction
                partials.append(PartialResult(transaction: transaction, error: error))
            }
        }
        return deduplicateTransactionListResult(success: success, partials: partials, nextToken: nextToken)
    }

    /// Get a list of transactions. If no transactions can be found, an empty list will be returned.
    ///
    /// - Parameters:
    ///     - filter: Filter to be applied to results of query.
    ///     - limit: Number of transaction to return. If nil, the limit is 10.
    ///     - dateRange: Range of upper and lower date limits for records.
    ///     - sortOrder: Order in which records are returned (based on date).
    ///     - nextToken: Generated token by previous calls to `list`. This is used for pagination. This value should be pre-generated from a previous
    ///         pagination call, otherwise it will throw an error.
    /// - Parameter cachePolicy: Determines how the data is fetched.
    ///
    /// - Returns:
    ///    - Success: Transactions associated with user, or empty array if no transaction can be found.
    ///    - Failure: `Error` that occurred.
    func list(
        withLimit limit: Int?,
        nextToken: String?,
        dateRange: DateRangeInput?,
        sortOrder: SortOrderInput?,
        cachePolicy: CachePolicy
    ) async throws -> ListAPIResult<Transaction, PartialTransaction> {
        // sequenceId has no affect on this, but we still want to honor other filters.
        let query = GraphQL.ListTransactionsQuery(
            limit: limit,
            nextToken: nextToken,
            dateRange: dateRange?.toGraphQL(),
            sortOrder: sortOrder?.toGraphQL()
        )
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let listTransactions = data?.listTransactions2 else {
            return .empty
        }
        let nextToken = listTransactions.nextToken
        var success: [Transaction] = []
        var partials: [PartialResult<PartialTransaction>] = []
        for listTransaction in listTransactions.items {
            do {
                let unsealedTransaction = try unsealer.unseal(listTransaction.fragments.sealedTransaction)
                success.append(unsealedTransaction)
            } catch {
                let transaction = listTransaction.fragments.sealedTransaction
                partials.append(PartialResult(transaction: transaction, error: error))
            }
        }
        return deduplicateTransactionListResult(success: success, partials: partials, nextToken: nextToken)
    }

    /// Subscribe to transaction update events. This includes creation of new transactions.
    ///
    /// - Parameter statusChangeHandler: Connection status change.
    /// - Parameter resultHandler: Updated transaction event.
    ///
    /// - Returns: `Cancellable` object to cancel the subscription.
    func subscribeToUpdated(
        withStatusChangeHandler statusChangeHandler: SudoSubscriptionStatusChangeHandler?,
        resultHandler: @escaping ClientCompletion<Transaction>
    ) async throws -> Cancellable? {
        guard let owner = try? userClient.getSubject() else {
            throw SudoVirtualCardsError.notSignedIn
        }
        let subscription = GraphQL.OnTransactionUpdateSubscription(owner: owner)

        let discard = try? await graphQLClient.subscribe(
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
                    resultHandler(.failure(SudoVirtualCardsError.internalError("Error and result cannot both be nil.")))
                    return
                }
                if let errors = result.errors, let error = errors.first {
                    resultHandler(.failure(SudoVirtualCardsError(graphQLError: error)))
                    return
                }
                guard let data = result.data else {
                    resultHandler(.failure(SudoVirtualCardsError.internalError("GraphQL error and data cannot be nil")))
                    return
                }
                guard let onTransactionUpdate = data.onTransactionUpdate else {
                    resultHandler(.failure(SudoVirtualCardsError.internalError("Failed to get transaction.")))
                    return
                }
                do {
                    let transaction = try self.unsealer.unseal(onTransactionUpdate.fragments.sealedTransaction)
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
        subscriptions.append(WeakCancellable(value: cancellable))
        return cancellable
    }

    /// Subscribe to transaction delete events. This includes creation of new transactions.
    ///
    /// - Parameter statusChangeHandler: Connection status change.
    /// - Parameter resultHandler: Deleted transaction event.
    ///
    /// - Returns: `Cancellable` object to cancel the subscription.
    func subscribeToDeleted(
        withStatusChangeHandler statusChangeHandler: SudoSubscriptionStatusChangeHandler?,
        resultHandler: @escaping ClientCompletion<Transaction>
    ) async throws -> Cancellable? {
        guard let owner = try? userClient.getSubject() else {
            throw SudoVirtualCardsError.notSignedIn
        }
        let subscription = GraphQL.OnTransactionDeleteSubscription(owner: owner)

        let discard = try? await graphQLClient.subscribe(
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
                    resultHandler(.failure(SudoVirtualCardsError.internalError("Error and result cannot both be nil.")))
                    return
                }
                if let errors = result.errors, let error = errors.first {
                    resultHandler(.failure(SudoVirtualCardsError(graphQLError: error)))
                    return
                }
                guard let data = result.data else {
                    resultHandler(.failure(SudoVirtualCardsError.internalError("GraphQL error and data cannot be nil")))
                    return
                }
                guard let onTransactionDelete = data.onTransactionDelete else {
                    resultHandler(.failure(SudoVirtualCardsError.internalError("Failed to get transaction.")))
                    return
                }
                do {
                    let transaction = try self.unsealer.unseal(onTransactionDelete.fragments.sealedTransaction)
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
        subscriptions.append(WeakCancellable(value: cancellable))
        return cancellable
    }
    
    /// Removes duplicate unsealed transactions from success and partial results based on identifier, favouring unsealed transactions in
    /// the success list.
    ///
    /// - Parameter success: A list of successfully unsealed transactions.
    /// - Parameter partials: A list of partial unsealed transactions.
    /// - Parameter nextToken: A token generated from previous calls to allow for pagination.
    ///
    /// - Returns: A Success or Partial result.
    private func deduplicateTransactionListResult(
        success: [Transaction],
        partials: [PartialResult<PartialTransaction>],
        nextToken: String?
    ) -> ListAPIResult<Transaction, PartialTransaction> {
        // Remove duplicate success and partial transactions based on id
        let distinctSuccess = Array(Set(success.map { $0.id })).map { id in
            return success.first { $0.id == id }!
        }
        
        var distinctPartials = Array(Set(partials.map { $0.partial.id })).map { id in
            return partials.first { $0.partial.id == id }!
        }
        
        // Remove transactions from partial list that have been successfully unsealed
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
