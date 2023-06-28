//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public struct PlaidAccountMetadata: Equatable {
    // MARK: - Properties

    /// Plaid account ID for passing in completion data to completeFundingSource
    public let accountId: String

    /// Account sub type
    public let subtype: BankAccountType
}

extension SudoVirtualCards.BankAccountType {
    public init(plaidSubType: String) {
        switch plaidSubType {
        case "checking":
            self = .CHECKING
        case "savings":
            self = .SAVINGS
        default:
            self = .UNKNOWN(plaidSubType)
        }
    }
}
