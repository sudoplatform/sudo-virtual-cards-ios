//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
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
        case let .unknown(rawValue):
            self = .unknown(rawValue)
        }
    }
}