//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Transaction detail. Depending on transaction type will detail
/// things like fees, real credit card transaction details etc.
struct SealedTransactionDetailChargeAttribute: Equatable {

    /// ID of funding source that funded this item.
    var fundingSourceId: String

    /// Sealed amount the merchant charged the virtual card.
    var virtualCardAmount: SealedCurrencyAmount

    /// Sealed markup formula applied to billedAmount to calculate.
    var markup: SealedMarkup

    /// Sealed markup amount added to `Transaction.transactedAmout`.
    var markupAmount: SealedCurrencyAmount

    /// Sealed amount charged to funding source.
    var fundingSourceAmount: SealedCurrencyAmount

    /// Sealed description that will show on the real funding source statement.
    var description: SealedString

    init(
        fundingSourceId: String,
        virtualCardAmount: _SealedCurrencyAmount,
        markup: _SealedMarkup,
        markupAmount: _SealedCurrencyAmount,
        fundingSourceAmount: _SealedCurrencyAmount,
        description: SealedString
    ) {
        self.fundingSourceId = fundingSourceId
        self.virtualCardAmount = .init(virtualCardAmount)
        self.markup = .init(markup)
        self.markupAmount = .init(markupAmount)
        self.fundingSourceAmount = .init(fundingSourceAmount)
        self.description = description
    }
}

protocol _SealedMarkup {
    var percent: SealedInt { get set }
    var flat: SealedInt { get set }
    var minCharge: SealedInt? { get set }
}

struct SealedMarkup: _SealedMarkup, Equatable {
    var percent: SealedInt
    var flat: SealedInt
    var minCharge: SealedInt?

    init(percent: SealedInt, flat: SealedInt, minCharge: SealedInt?) {
        self.percent = percent
        self.flat = flat
        self.minCharge = minCharge
    }

    init(_ obj: _SealedMarkup) {
        self.percent = obj.percent
        self.flat = obj.flat
        self.minCharge = obj.minCharge
    }
}
