//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Error that can contain one to many errors.
public struct AggregateError: Error, CustomStringConvertible, LocalizedError, Equatable {
    public static func == (lhs: AggregateError, rhs: AggregateError) -> Bool {
        let lhsErrors = lhs.errors.map { String(reflecting: $0)}
        let rhsErrors = rhs.errors.map { String(reflecting: $0)}
        return lhsErrors == rhsErrors
    }

    // MARK: - Properties

    public var description: String {
        errors.map { $0.localizedDescription }.reduce("Errors:") { "\($0)\n\($1)" }
    }

    public var errorDescription: String? {
        return description
    }

    public var errors: [Error] = []

    // MARK: - Lifecycle

    public init(_ errors: [Error]) {
        self.errors = errors
    }

    public init(_ error: Error) {
        self.errors = [error]
    }

    // MARK: - Methods

    public mutating func append(_ error: Error) {
        errors.append(error)
    }

}
