//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Used to convert a Transaction Filter input for `sequenceId`.
///
/// This is transitory as the service does not currently support `sequenceId` filtering.
/// Once support is added, this should be removed.
struct LocalTransactionFilter {

    /// Attributes that are supported for local filtering on the client.
    enum FilterableAttribute {
        /// Sequence ID of the transaction.
        case sequenceId
    }

    /// Filter to apply to transactions.
    let filter: FilterInput<String>

    /// Attribute to filter.
    let attribute: FilterableAttribute

    /// Execute the filter on `transactions`.
    func execute(_ transactions: [Transaction]) -> [Transaction] {
        return transactions.filter {
            switch attribute {
            case .sequenceId:
                return filter.matchesPredicate($0.sequenceId)
            }
        }
    }
}
