//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// State of the card.
/// - issued: Card is in an issued state and ready to be used.
/// - failed: Card is in a failed state and needs to be rectified.
/// - closed: Card has been closed.
/// - suspended: Card has been suspended.
/// - unknown: API Evolution - if this occurs, it may mean you need to update the library.
public enum VirtualCardState: Hashable, CustomStringConvertible {
    case issued
    case failed
    case closed
    case suspended
    case unknown(String)

    // MARK: - Lifecycle

    /// Initialize an instance of `Card.State`.
    init(_ state: GraphQL.CardState) {
        switch state {
        case .issued:
            self = .issued
        case .failed:
            self = .failed
        case .closed:
            self = .closed
        case .suspended:
            self = .suspended
        case let .unknown(rawValue):
            self = .unknown(rawValue)
        }
    }

    // MARK: - Conformance: CustomStringConvertible

    public var description: String {
        switch self {
        case .issued:
            return "ISSUED"
        case .failed:
            return "FAILED"
        case .closed:
            return "CLOSED"
        case .suspended:
            return "SUSPENDED"
        case let .unknown(value):
            return value
        }
    }
}
