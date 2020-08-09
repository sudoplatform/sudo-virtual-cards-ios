//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSAppSync
import SudoUser
import SudoOperations
import SudoLogging

/// Abstraction of the SDKs capabilities surrounding `Transaction` access/manipulation with virtual cards service.
class TransactionService {

    // MARK: - Supplementary

    /// Typealias for a `ListOutput` for `Transactions`.
    typealias TransactionList = ListOutput<Transaction>

    /// Typealias for a `PlatformQueryOperation` that is using a `GetTransactionQuery` as its query.
    typealias GetOperation = PlatformQueryOperation<GetTransactionQuery>

    /// Typealias for a `PlatformQueryOperation` that is using a `ListTransactionsQuery` as its query.
    typealias ListOperation = PlatformQueryOperation<ListTransactionsQuery>

    // MARK: - Properties

    /// Used to determine if the user is signed in and access the user owner ID.
    /// Unowned used since this should always outlive the lifetime of this class.
    unowned let userClient: SudoUserClient

    /// Used to make GraphQL requests to AWS. Injected into operations to delegate the calls.
    unowned let appSyncClient: AWSAppSyncClient

    /// Used to generate operations.
    unowned let operationFactory: OperationFactory

    /// Used to unseal incoming transactions.
    unowned let unsealer: Unsealer

    /// Logs errors and diagnostic information.
    let logger: Logger

    /// Operation queue used by the `TransactionService`.
    var queue = PlatformOperationQueue()

    /// Weak reference to existing subscriptions.
    var subscriptions: [WeakCancellable] = []

    // MARK: - Lifecycle

    /// Initialize an instance of `TransactionService`.
    init(
        userClient: SudoUserClient,
        appSyncClient: AWSAppSyncClient,
        unsealer: Unsealer,
        operationFactory: OperationFactory,
        logger: Logger = Logger.virtualCardsSDKLogger
    ) {
        self.userClient = userClient
        self.appSyncClient = appSyncClient
        self.unsealer = unsealer
        self.operationFactory = operationFactory
        self.logger = logger
    }

    /// Cancel all operations on the `TransactionService` operation queue.
    func cancelAllOperations() {
        queue.cancelAllOperations()
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
    func get(withId id: String, cachePolicy: CachePolicy, keyPair: KeyPair, completion: @escaping ClientCompletion<Transaction?>) {
        let query = GetTransactionQuery(id: id, keyId: keyPair.keyId)
        let operation = operationFactory.generateQueryOperation(query: query, appSyncClient: appSyncClient, cachePolicy: cachePolicy, logger: logger)
        let observer = generateGetCompletionObserver(completion: completion)
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    /// Get a list of transactions. If no transactions can be found, an empty list will be returned.
    ///
    /// - Parameters:
    ///     - filter: Filter to be applied to results of query.
    ///     - limit: Number of transaction to return. If nil, the limit is 10.
    ///     - nextToken: Generated token by previous calls to `getTransactions`. This is used for pagination. This value should be pre-generated from a previous
    ///         pagination call, otherwise it will throw an error.
    /// - Parameter cachePolicy: Determines how the data is fetched.
    ///
    /// - Returns:
    ///    - Success: Transactions associated with user, or empty array if no transaction can be found.
    ///    - Failure: `Error` that occurred.
    func list(
        withFilter filter: GetTransactionsFilterInput?,
        limit: Int?,
        nextToken: String?,
        cachePolicy: CachePolicy,
        completion: @escaping ClientCompletion<TransactionList>
    ) {
        // sequenceId has no affect on this, but we still want to honor other filters.
        let graphQLFilter = filter?.toGraphQLFilter()
        let query = ListTransactionsQuery(filter: graphQLFilter, limit: limit, nextToken: nextToken)
        let operation = operationFactory.generateQueryOperation(query: query, appSyncClient: appSyncClient, cachePolicy: cachePolicy, logger: logger)
        let observer = generateListCompletionObserver(filter: filter, completion: completion)
        operation.addObserver(observer)
        operation.addCondition(SignedInCondition(userClient: userClient))
        queue.addOperation(operation)
    }

    /// Subscribe to transaction update events. This includes creation of new transactions.
    ///
    /// - Parameter statusChangeHandler: Connection status change.
    /// - Parameter resultHandler: Updated transaction event.
    ///
    /// - Returns: `Cancellable` object to cancel the subscription.
    func subscribe(
        withStatusChangeHandler statusChangeHandler: SudoSubscriptionStatusChangeHandler?,
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
                    resultHandler(.failure(SudoVirtualCardsError.internalError(cause: "Error and result cannot both be nil.")))
                    return
                }
                if let errors = result.errors, let error = errors.first {
                    resultHandler(.failure(SudoPlatformError(error)))
                    return
                }
                guard let data = result.data else {
                    resultHandler(.failure(SudoVirtualCardsError.internalError(cause: "GraphQL error and data cannot be nil")))
                    return
                }
                guard let onTransactionUpdate = data.onTransactionUpdate else {
                    resultHandler(.failure(SudoVirtualCardsError.internalError(cause: "Failed to get transaction.")))
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
        subscriptions.append(WeakCancellable(value: cancellable))
        return cancellable
    }

    // MARK: - Helpers

    /// Generates a `PlatformBlockObserver` that handles the result of a `GetTransactionQuery`.
    func generateGetCompletionObserver(completion: @escaping ClientCompletion<Transaction?>) -> PlatformBlockObserver {
        return PlatformBlockObserver(finishHandler: { [weak self] operation, errors in
            guard let weakSelf = self else { return }
            guard let operation = operation as? GetOperation else {
                let error = SudoVirtualCardsError.internalError(
                    cause: "generateGetCompletionObserver should only be used with PlatformQueryOperation<GetTransactionQuery>"
                )
                completion(.failure(error))
                return
            }
            if let error = errors.first {
                completion(.failure(error))
                return
            }
            guard let getTransaction = operation.result?.getTransaction else {
                completion(.success(nil))
                return
            }
            do {
                let transaction = try weakSelf.unsealer.unseal(getTransaction)
                completion(.success(transaction))
                return
            } catch {
                weakSelf.logger.error("failed to decode transaction: \(error)")
                completion(.failure(error))
                return
            }
        })
    }

    /// Generates a `PlatformBlockObserver` that handles the result of a `ListTransactionQuery`.
    func generateListCompletionObserver(filter: GetTransactionsFilterInput?, completion: @escaping ClientCompletion<TransactionList>) -> PlatformBlockObserver {
        return PlatformBlockObserver(finishHandler: { [weak self] operation, errors in
            guard let weakSelf = self else { return }
            guard let operation = operation as? ListOperation else {
                let error = SudoVirtualCardsError.internalError(
                    cause: "generateGetCompletionObserver should only be used with PlatformQueryOperation<GetTransactionQuery>"
                )
                completion(.failure(error))
                return
            }
            if let error = errors.first {
                completion(.failure(error))
                return
            }
            guard let listTransactions = operation.result?.listTransactions else {
                completion(.success(TransactionList.empty))
                return
            }
            var transactions: [Transaction]
            do {
                transactions = try listTransactions.items.map(weakSelf.unsealer.unseal(_:))
            } catch {
                weakSelf.logger.error("failed to decode transactions: \(error)")
                completion(.failure(error))
                return
            }
            if let sequenceIdFilter = filter?.sequenceId {
                let localFilter = LocalTransactionFilter(filter: sequenceIdFilter, attribute: .sequenceId)
                transactions = localFilter.execute(transactions)
            }
            let nextToken = listTransactions.nextToken
            completion(.success(TransactionList(items: transactions, nextToken: nextToken)))
        })
    }
}
