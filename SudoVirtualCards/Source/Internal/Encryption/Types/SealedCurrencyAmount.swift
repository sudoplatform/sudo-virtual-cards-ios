//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Internal protocol for Sealed Currency Amounts, used to allow for protocol conformance to GraphQL API.
protocol _SealedCurrencyAmount {

    /// Sealed currency attribute. Underlying unsealed attribute type is `String`.
    var currency: SealedString { get set }

    /// Sealed amount attribute. Underlying unsealed attribute type is `Int`.
    var amount: SealedInt { get set }
}

/// Struct implementation of `_SealedCurrencyAmount`. All fields are encrypted.
struct SealedCurrencyAmount: _SealedCurrencyAmount, Equatable {

    // MARK: - Properties

    public var currency: SealedString

    public var amount: SealedInt

    // MARK: - Lifecycle

    /// Initialize an instance of `SealedCurrencyAmount`.
    init(currency: SealedString, amount: SealedInt) {
        self.currency = currency
        self.amount = amount
    }

    /// Initialize an instance of `SealedCurrencyAmount` using a GraphQL API conforming object.
    init(_ object: _SealedCurrencyAmount) {
        self.currency = object.currency
        self.amount = object.amount
    }
}
