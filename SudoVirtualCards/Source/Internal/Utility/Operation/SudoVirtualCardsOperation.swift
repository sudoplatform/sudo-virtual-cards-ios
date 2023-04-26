//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoLogging

/// Operation implementation that all other Operations should be subclassed from.
///
/// This class requires that it is enqueued to a `SudoVirtualCardsOperationQueue` to be executed.
class SudoVirtualCardsOperation: Operation {

    // MARK: - Supplementary: KVO State Mechanisms

    private static let stateKeyPath = "state"

    @objc class func keyPathsForValuesAffectingIsReady() -> Set<NSObject> {
        return [stateKeyPath as NSObject]
    }

    @objc class func keyPathsForValuesAffectingIsExecuting() -> Set<NSObject> {
        return [stateKeyPath as NSObject]
    }

    @objc class func keyPathsForValuesAffectingIsFinished() -> Set<NSObject> {
        return [stateKeyPath as NSObject]
    }

    // MARK: - Supplementary: State Enumeration

    /// State of a SudoVPN Operation.
    /// - initialized: Initial state - automatically set when creating a new `SudoVirtualCardsOperation`.
    /// - pending: Ready to begin execution.
    /// - executing: `SudoVirtualCardsOperation` is currently executing.
    /// - finished: `SudoVirtualCardsOperation` has finished executing and in a completed state.
    enum State: Int, Comparable {
        case initialized
        case pending
        case executing
        case finished

         /// Boolean operation to determine of a `SudoVirtualCardsOperation.State` can transition between states.
         /// This is useful for assertion testing to make sure there is not a bug in the code.
        func canTransitionToState(_ target: State) -> Bool {
            switch (self, target) {
            case (.initialized, .pending),
                 (.pending, .executing),
                 (.pending, .finished),
                 (.executing, .finished):
                return true
            default:
                return false
            }
        }

        // MARK: - Conformance: Comparable

        static func < (lhs: SudoVirtualCardsOperation.State, rhs: SudoVirtualCardsOperation.State) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
    }

    // MARK: - Properties: Diagnostics

    /// Logging mechanism - provides debugging information.
    let logger: Logger

    /// Operation ID.
    let id: String = UUID().uuidString

    /// Operation start time.
    private(set) var startTime = Date(timeIntervalSince1970: 0)

    /// Operation finish time.
    private(set) var finishTime = Date(timeIntervalSince1970: 0)

    // MARK: - Properties: State/Lifecycle

    /// Optional reference to an async task to support cancellation.
    private var executionTask: Task<Void, Never>?

    /// A lock to protect the access to the `_state` property.
    private let stateLock = NSLock()

    /// Private storage for state of the `SudoVirtualCardsOperation` that is KVO observed.
    private var _state = State.initialized

    /// State of the `SudoVirtualCardsOperation`. Set is protected with `stateLock`.
    private(set) var state: State {
        get {
            return self.stateLock.withCriticalScope {
                self._state
            }
        }
        set {
            willChangeValue(forKey: SudoVirtualCardsOperation.stateKeyPath)
            self.stateLock.withCriticalScope {
                guard self._state != .finished else {
                    return
                }
                assert(_state.canTransitionToState(newValue), "performing invalid state transition.")
                logger.debug("Operation \(type(of: self)) (\(id)) transitioning from \(_state) to \(newValue).")
                self._state = newValue
            }
            didChangeValue(forKey: SudoVirtualCardsOperation.stateKeyPath)
        }
    }

    /// Errors associated with the execution of this operation.
    private(set) var errors: [Error] = []

    // MARK: - Properties: Operation

    override var isExecuting: Bool {
        return self.state == .executing
    }

    override var isFinished: Bool {
        return self.state == .finished
    }

    // MARK: - Lifecycle

    /// Initialize a SudoVPN Operation.
    init(logger: Logger) {
        self.logger = logger
    }

    // MARK: - Methods

    /// Transitions `SudoVirtualCardsOperation` to `pending` state to begin evaluating conditions.
    final func willEnqueue() {
        state = .pending
    }

    /// Executes the operation. The default implementation calls the async execute method.
    /// Subclasses must override one of the execute methods.
    func execute() {
        executionTask = Task {
            await execute()
        }
    }

    /// Executes the operation. Subclasses must override this method.
    ///
    /// When subclassing, ensure that `finish()` is called somehow to avoid definite deadlock.
    func execute() async {
        fatalError("Your subclass must override one of the execute methods")
    }

    /// Optional override to perform work when the operation is finishing.
    func finished(_ errors: [Error]) {
        // No Op.
    }

    /// Performs the finish work of the operation.
    final func finish(_ errors: [Error] = []) {
        guard !isFinished else {
            return
        }
        let combinedErrors = errors + self.errors
        self.errors = combinedErrors

        self.finishTime = Date()
        let elapsed = finishTime.timeIntervalSince(self.startTime)
        self.logger.info("\(type(of: self)) (id=\(self.id)) finished in \(elapsed) sec. Errors: \(combinedErrors)")

        finished(combinedErrors)
        state = .finished
    }

    /// Convenience method to cancel with an error. If no error is supplied, the internal error management will not be affected.
    func cancelWithError(_ error: Error? = nil) {
        if let error = error {
            errors.append(error)
        }
        cancel()
    }

    /// Convenienvce method to finish with an error. If no error is supplied, the internal error management will not be affected.
    final func finishWithError(_ error: Error?) {
        if let error = error {
            finish([error])
        } else {
            finish()
        }
    }

    // MARK: - Methods: Operation

    override func addDependency(_ op: Operation) {
        assert(state < .executing, "Dependencies cannot be modified after execution has begun.")
        super.addDependency(op)
    }

    override final func start() {
        logger.debug("state: \(state)")
        guard !isCancelled else {
            finish()
            return
        }
        super.start()
    }

    override final func main() {
        assert(state == .pending, "This operation must be performed on an operation queue.")
        guard errors.isEmpty, !isCancelled else {
            finish()
            return
        }
        self.startTime = Date()
        self.logger.info("\(type(of: self)) started")
        self.state = .executing
        self.execute()
    }

}

extension NSLock {

    /// Performs synchronized execution of a block.
    ///
    /// - Parameter block: block to execute.
    func withCriticalScope<T>(_ block: () -> T) -> T {
        lock()
        let value = block()
        unlock()
        return value
    }
}
