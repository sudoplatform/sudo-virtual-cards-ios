//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Internal protocol for Sealed Currency Amounts.
struct SealedCurrencyAmount: Equatable {

    public var currency: SealedString
    public var amount: SealedInt

}

extension SealedCurrencyAmount {

    /// Initialize an instance of `SealedCurrencyAmount` using a GraphQL Fragment.
    init(_ fragment: GraphQL.SealedCurrencyAmountAttribute) {
        self.currency = fragment.currency
        self.amount = fragment.amount
    }

}
