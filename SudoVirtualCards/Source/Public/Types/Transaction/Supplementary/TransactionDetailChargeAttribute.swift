//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
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

    /// Enum describing the state of the transaction charge detail. Historically all transaction charges would complete
    /// immediately, resulting in a `CLEARED` state, however some transactions, particularly those backed by ACH funding sources
    /// can take some time to resolve so will begin as `PENDING` and may result in failure.
    public enum ChargeDetailState: Hashable {
        /// Funding transaction initiated
        case pending
        /// Funding transaction cleared
        case cleared
        /// Funding transaction failed due to insufficient funds
        case insufficientFunds
        /// Funding transaction failed for other reasons
        case failed
        /// Backwards compatibility guard for catching new enum values added by the service - check you have the latest version of the SDK
        case unknown(String)

        // MARK: - Lifecycle

        /// Initialize an instance of `ChargeDetailState`.
        public init(_ state: String) {
            switch state {
            case "PENDING":
                self = .pending
            case "CLEARED":
                self = .cleared
            case "INSUFFICIENT_FUNDS":
                self = .insufficientFunds
            case "FAILED":
                self = .failed
                /// Backwards compatibility guard for catching new enum values added by the service - check you have the latest version of the SDK
            default:
                self = .unknown(state)
            }
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

    /// Current state of the transaction detail charge
    public let state: ChargeDetailState

    // MARK: - Lifecycle

    /// Initialize an instance of `TransactionDetailChargeAttribute`.
    public init(
        virtualCardAmount: CurrencyAmount,
        markup: Markup,
        markupAmount: CurrencyAmount,
        fundingSourceAmount: CurrencyAmount,
        fundingSourceId: String,
        description: String,
        state: ChargeDetailState
    ) {
        self.virtualCardAmount = virtualCardAmount
        self.markup = markup
        self.markupAmount = markupAmount
        self.fundingSourceAmount = fundingSourceAmount
        self.fundingSourceId = fundingSourceId
        self.description = description
        self.state = state
    }
}
