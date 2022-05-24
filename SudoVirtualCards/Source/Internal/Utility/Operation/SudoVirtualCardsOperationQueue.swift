//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Subclass adding behaviour around `SudoVirtualCardsOperation` in a queue.
open class SudoVirtualCardsOperationQueue: OperationQueue {

    // MARK: - Methods: OperationQueue

    /// Adds the specified operation to the receiver.
    ///
    /// If the operation is a `SudoVirtualCardsOperation`, the operation will have its conditions
    /// and extra functionality, such as delegation.
    ///
    /// - Parameter op: The operation to be added to the queue.
    open override func addOperation(_ op: Operation) {
        guard let operation = op as? SudoVirtualCardsOperation else {
            addOrdinaryOperation(op)
            return
        }
        operation.willEnqueue()

        super.addOperation(op)
    }

    open override func addOperation(_ block: @escaping () -> Void) {
        let op = BlockOperation(block: block)
        addOrdinaryOperation(op)
    }

    /// Adds the specified operations to the queue.
    ///
    /// See `SudoVirtualCardsOperationQueue.addOperation(:)` for more details.
    ///
    /// # Important
    /// If using `waitUntilFinished`, please ensure the queue is not suspended, or the call will block.
    ///
    /// - Parameters:
    ///   - ops: The operations to be added to the queue.
    ///   - wait: if true, will block and wait until all operations that are passed in have completed.
    open override func addOperations(_ ops: [Operation], waitUntilFinished wait: Bool) {
        // Two separate iterators are necessary to avoid a deadlock for dependent operations.
        ops.forEach {
            addOperation($0)
        }

        if wait {
            ops.forEach {
                $0.waitUntilFinished()
            }
        }
    }

    /// Add a non-`SudoVirtualCardsOperation` to the internal queue.
    ///
    /// This will add a completion block that will call the `delegate`.
    private func addOrdinaryOperation(_ op: Operation) {
        super.addOperation(op)
    }
}
