//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
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

    /// Sealed charge detail state
    var state: SealedString?

}

extension SealedTransactionDetailChargeAttribute {

    init(_ fragment: GraphQL.SealedTransactionDetailChargeAttribute) {
        self.fundingSourceId = fragment.fundingSourceId
        self.virtualCardAmount = .init(fragment.virtualCardAmount.fragments.sealedCurrencyAmountAttribute)
        self.markup = .init(fragment.markup.fragments.sealedMarkupAttribute)
        self.markupAmount = .init(fragment.markupAmount.fragments.sealedCurrencyAmountAttribute)
        self.fundingSourceAmount = .init(fragment.fundingSourceAmount.fragments.sealedCurrencyAmountAttribute)
        self.description = fragment.description
        self.state = fragment.state
    }

}
