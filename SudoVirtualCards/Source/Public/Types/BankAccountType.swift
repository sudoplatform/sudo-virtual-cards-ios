// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

///  Representation of an enumeration depicting the BankAcount type of a [BankAccountFundingSource], in the Sudo
///  Platform Virtual Cards SDK.
///
public enum BankAccountType: Hashable {
    /// Checking account
    case CHECKING
    /// Savings account
    case SAVINGS
    /// Other bank account
    case OTHER

    /// Backwards compatibility guard for catching new enum values added by the service - check you have the latest version of the SDK
    case UNKNOWN(String)

    // MARK: - Lifecycle

    /// Initialise an instance of `BankAccountType`.
    init(_ cardType: GraphQL.BankAccountType) {
        switch cardType {
        case .checking:
            self = .CHECKING
        case .savings:
            self = .SAVINGS
        case .other:
            self = .OTHER
        case let .unknown(cardType):
            self = .UNKNOWN(cardType)
        }
    }
}
