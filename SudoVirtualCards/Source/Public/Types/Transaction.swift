//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of a Transaction object associated with a Virtual Card in Platform SDK.
public struct Transaction: Hashable {

    // MARK: - Supplementary

    /// Type of a Transaction.
    public enum TransactionType: Hashable {
        case pending
        case complete
        case refund
        case decline
        case unknown(String)

        init(type: SudoVirtualCards.TransactionType) {
            switch type {
            case .pending:
                self = .pending
            case .complete:
                self = .complete
            case .refund:
                self = .refund
            case .decline:
                self = .decline
            case let .unknown(rawValue):
                self = .unknown(rawValue)
            }
        }
    }

    public enum DeclineReason: Hashable {
        case insufficientFunds
        case suspicious
        case cardStopped
        case cardExpired
        case merchantBlocked
        case merchantCodeBlocked
        case merchantCountryBlocked
        case avsCheckFailed
        case cscCheckFailed
        case expiryCheckFailed
        case processingError
        case declined
        case velocityExceeded
        case currencyBlocked
        case fundingError
        case unknown(String)

        init(string: String) {
            switch string {
            case "INSUFFICIENT_FUNDS":
                self = .insufficientFunds
            case "SUSPICIOUS":
                self = .suspicious
            case "CARD_STOPPED":
                self = .cardStopped
            case "CARD_EXPIRED":
                self = .cardExpired
            case "MERCHANT_BLOCKED":
                self = .merchantBlocked
            case "MERCHANT_CODE_BLOCKED":
                self = .merchantCodeBlocked
            case "MERCHANT_COUNTRY_BLOCKED":
                self = .merchantCountryBlocked
            case "AVS_CHECK_FAILED":
                self = .avsCheckFailed
            case "CSC_CHECK_FAILED":
                self = .cscCheckFailed
            case "EXPIRY_CHECK_FAILED":
                self = .expiryCheckFailed
            case "PROCESSING_ERROR":
                self = .processingError
            case "DECLINED":
                self = .declined
            case "VELOCITY_EXCEEDED":
                self = .velocityExceeded
            case "CURRENCY_BLOCKED":
                self = .currencyBlocked
            case "FUNDING_ERROR":
                self = .fundingError
            default:
                self = .unknown(string)
            }
        }
    }

    // MARK: - Properties

    /// Identifier generated by the Virtual Cards Service.
    public let id: String

    /// Associated Card ID of the transaction.
    public let cardId: String

    /// Associated Sequence ID of the transaction. Used to identify related transactions.
    public let sequenceId: String

    /// Type of the transaction.
    public let type: TransactionType

    /// Date in which the transaction was transacted at.
    public let transactedAt: Date

    /// Transaction amount in the card's currency value.
    public let billedAmount: CurrencyAmount

    /// Transaction amount in the merchant's currency value.
    public let transactedAmount: CurrencyAmount

    /// Description of the transaction - typically is the name of the merchant.
    public let description: String

    /// Associated reason for why the tranaction was declined (if applicable).
    public let declineReason: DeclineReason?

    /// List of details about this transaction depending on transaction type. Pending,
    /// complete and refund transactions will always have detail.
    public let detail: [TransactionDetailChargeAttribute]

    /// Date stamp that the transaction was created on the Virtual Cards Service.
    public let createdAt: Date

    /// Date stamp that the transaction was last updated on the Virtual Cards Service.
    public let updatedAt: Date

    // MARK: - Lifecycle

    /// Initialize an instance of `Transaction`.
    public init(
        id: String,
        cardId: String,
        sequenceId: String,
        type: TransactionType,
        transactedAt: Date,
        billedAmount: CurrencyAmount,
        transactedAmount: CurrencyAmount,
        description: String,
        declineReason: DeclineReason? = nil,
        detail: [TransactionDetailChargeAttribute] = [],
        createdAt: Date,
        updatedAt: Date
    ) {
        self.id = id
        self.cardId = cardId
        self.type = type
        self.sequenceId = sequenceId
        self.transactedAt = transactedAt
        self.billedAmount = billedAmount
        self.transactedAmount = transactedAmount
        self.description = description
        self.declineReason = declineReason
        self.detail = detail
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

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
