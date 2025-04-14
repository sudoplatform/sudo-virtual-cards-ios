//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
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

    // MARK: - TransactionService

    /// Get a singular transaction.
    /// - Parameters:
    ///   - id: ID of the transaction to be retrieved.
    ///   - keyPair: Key used to decrypt the payload.
    /// - Returns:
    ///    - Success: Transaction associated with `id`, or `nil` if the card cannot be found.
    ///    - Failure: `Error` that occurred.
    func get(withId id: String, keyPair: KeyPair) async throws -> Transaction? {
        let query = GraphQL.GetTransactionQuery(id: id, keyId: keyPair.keyId)
        let data: GraphQL.GetTransactionQuery.Data
        do {
            data = try await graphQLClient.fetch(query: query)
        } catch {
            throw SudoVirtualCardsError.fromApiOperationError(error: error)
        }
        guard let result = data.getTransaction else {
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
    /// - Returns:
    ///    - Success: Transactions associated with user, or empty array if no transaction can be found.
    ///    - Failure: `Error` that occurred.
    func list(
        withCardId cardId: String,
        limit: Int?,
        nextToken: String?,
        dateRange: DateRangeInput?,
        sortOrder: SortOrderInput?
    ) async throws -> ListAPIResult<Transaction, PartialTransaction> {
        let query = GraphQL.ListTransactionsByCardIdQuery(
            cardId: cardId,
            limit: limit,
            nextToken: nextToken,
            dateRange: dateRange?.toGraphQL(),
            sortOrder: sortOrder?.toGraphQL()
        )
        let data: GraphQL.ListTransactionsByCardIdQuery.Data
        do {
            data = try await graphQLClient.fetch(query: query)
        } catch {
            throw SudoVirtualCardsError.fromApiOperationError(error: error)
        }
        let listTransactions = data.listTransactionsByCardId2
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
    /// - Returns:
    ///    - Success: Transactions associated with user, or empty array if no transaction can be found.
    ///    - Failure: `Error` that occurred.
    func list(
        withCardId cardId: String,
        withTransactionType transactionType: TransactionType,
        limit: Int?,
        nextToken: String?
    ) async throws -> ListAPIResult<Transaction, PartialTransaction> {
        if transactionType.toGraphQL() == nil {
            throw SudoVirtualCardsError.unrecognizedTransactionType
        }
        let query = GraphQL.ListTransactionsByCardIdAndTypeQuery(
            cardId: cardId,
            transactionType: transactionType.toGraphQL()!,
            limit: limit,
            nextToken: nextToken
        )
        let data: GraphQL.ListTransactionsByCardIdAndTypeQuery.Data
        do {
            data = try await graphQLClient.fetch(query: query)
        } catch {
            throw SudoVirtualCardsError.fromApiOperationError(error: error)
        }
        let listTransactions = data.listTransactionsByCardIdAndType
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
    /// - Parameters:
    ///     - filter: Filter to be applied to results of query.
    ///     - limit: Number of transaction to return. If nil, the limit is 10.
    ///     - dateRange: Range of upper and lower date limits for records.
    ///     - sortOrder: Order in which records are returned (based on date).
    ///     - nextToken: Generated token by previous calls to `list`. This is used for pagination. This value should be pre-generated from a previous
    ///         pagination call, otherwise it will throw an error.
    /// - Returns:
    ///    - Success: Transactions associated with user, or empty array if no transaction can be found.
    ///    - Failure: `Error` that occurred.
    func list(
        withLimit limit: Int?,
        nextToken: String?,
        dateRange: DateRangeInput?,
        sortOrder: SortOrderInput?
    ) async throws -> ListAPIResult<Transaction, PartialTransaction> {
        // sequenceId has no affect on this, but we still want to honor other filters.
        let query = GraphQL.ListTransactionsQuery(
            limit: limit,
            nextToken: nextToken,
            dateRange: dateRange?.toGraphQL(),
            sortOrder: sortOrder?.toGraphQL()
        )
        let data: GraphQL.ListTransactionsQuery.Data
        do {
            data = try await graphQLClient.fetch(query: query)
        } catch {
            throw SudoVirtualCardsError.fromApiOperationError(error: error)
        }
        let listTransactions = data.listTransactions2
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
        let distinctSuccess = (NSOrderedSet(array: success.map { $0.id }))
            // swiftlint:disable force_cast
            .map { id in return success.first { $0.id == id as! String }!
        }

        var distinctPartials = (NSOrderedSet(array: partials.map { $0.partial.id }))
            // swiftlint:disable force_cast
            .map { id in return partials.first { $0.partial.id == id as! String }!
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
