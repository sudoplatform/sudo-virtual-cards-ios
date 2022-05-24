//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Transaction detail. Depending on transaction type will detail things like fees, real credit
/// card transaction details etc.
public struct TransactionDetailChargeAttribute: Hashable {

    // MARK: - Supplementary

    /// Representation of a markup formula.
    public struct Markup: Hashable {

        // MARK: - Properties

        /// Floating point percentage amount applied in calculating
        /// total markup multiple by 1000. For example: 2990 for 2.99%.
        /// 1/1000th of a percent is the smallest granularity that can be
        /// represented.
        public let percent: Int

        /// Flat amount applied in calculating total markup in minor
        /// currency unit of billed currency in containing transaction detail
        /// e.g. 31 for $0.31.
        public let flat: Int

        /// The minimum charge that will be made to the funding source. For example,
        /// if a small charge of $0.10 were made with a 2.99%+$0.31 fee formula
        /// then the resultant fee would be $0.31 cents resulting in an expected
        /// funding source charge of $0.41 cents. If minCharge is set and more than
        /// this amount then the minCharge will be charged instead.
        public let minCharge: Int

        // MARK: - Lifecycle

        /// Initialize an instance of `Markup`.
        public init(percent: Int, flat: Int, minCharge: Int) {
            self.percent = percent
            self.flat = flat
            self.minCharge = minCharge
        }

        /// Transitory internal init until `minCharge` is not optional.
        ///
        /// Defaults `minCharge` to `0` if `nil` is supplied.
        init(percent: Int, flat: Int, minCharge: Int? = nil) {
            self.init(
                percent: percent,
                flat: flat,
                minCharge: minCharge ?? 0)
        }
    }

    // MARK: - Properties

    /// Amount the merchant charged the virtual card.
    public let virtualCardAmount: CurrencyAmount

    /// Markup formula applied to billedAmount to calculate.
    public let markup: Markup

    /// Markup amount added to `Transaction.transactedAmout`.
    public let markupAmount: CurrencyAmount

    /// Amount charged to funding source.
    public let fundingSourceAmount: CurrencyAmount

    /// ID of funding source that funded this item.
    public let fundingSourceId: String

    /// Description that will show on the real funding source statement.
    public let description: String

    // MARK: - Lifecycle

    /// Initialize an instance of `TransactionDetailChargeAttribute`.
    public init(
        virtualCardAmount: CurrencyAmount,
        markup: Markup,
        markupAmount: CurrencyAmount,
        fundingSourceAmount: CurrencyAmount,
        fundingSourceId: String,
        description: String
    ) {
        self.virtualCardAmount = virtualCardAmount
        self.markup = markup
        self.markupAmount = markupAmount
        self.fundingSourceAmount = fundingSourceAmount
        self.fundingSourceId = fundingSourceId
        self.description = description
    }

}
