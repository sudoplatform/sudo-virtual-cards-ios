//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Type of a Transaction.
public enum TransactionType: Hashable {
    case pending
    case complete
    case refund
    case decline
    case unknown(String)

    init(type: GraphQL.TransactionType) {
        switch type {
        case .pending:
            self = .pending
        case .complete:
            self = .complete
        case .refund:
            self = .refund
        case .decline:
            self = .decline

        /// Backwards compatibility guard for catching new enum values added by the service - check you have the latest version of the SDK
        case let .unknown(rawValue):
            self = .unknown(rawValue)
        }
    }
    
    // MARK: - Methods: Internal

    func toGraphQL() -> GraphQL.TransactionType? {
        switch self {
        case .pending:
            return .pending
        case .complete:
            return .complete
        case .refund:
            return .refund
        case .decline:
            return .decline
        case .unknown(_):
            return nil
        }
    }
}
