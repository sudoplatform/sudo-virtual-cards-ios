//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of a Currency Amount object on the Virtual Cards Service.
public struct CurrencyAmount: Hashable {

    // MARK: - Properties

    /// Currency ISO code of the amount.
    public var currency: String

    /// Amount of the currency in cents. `100` equals $1.00 if currency is `USD`.
    public var amount: Int

    // MARK: - Lifecycle

    /// Initialize an instance of `CurrencyAmount`.
    public init(currency: String, amount: Int) {
        self.currency = currency
        self.amount = amount
    }
}
