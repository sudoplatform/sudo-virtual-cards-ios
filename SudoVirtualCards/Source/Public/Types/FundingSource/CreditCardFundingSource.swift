//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of a Credit Card Funding Source
public struct CreditCardFundingSource: BaseFundingSource, Hashable {
    struct Constants {
        static let TypeName: String = "CreditCardFundingSource"
    }

    /// Valid Credit Card Network options
    public enum Network: Hashable {
        case amex
        case diners
        case discover
        case jcb
        case mastercard
        case unionpay
        case visa
        case other

        /// Backwards compatibility guard for catching new enum values added by the service - check you have the latest version of the SDK
        case unknown(String)

        /// Initialize an instance of `FundingSource.Network`.
        init(_ network: GraphQL.CreditCardNetwork) {
            switch network {
            case .amex:
                self = .amex
            case .diners:
                self = .diners
            case .discover:
                self = .discover
            case .jcb:
                self = .jcb
            case .mastercard:
                self = .mastercard
            case .unionpay:
                self = .unionpay
            case .visa:
                self = .visa
            case .other:
                self = .other
            case let .unknown(type):
                self = .unknown(type)
            }
        }
    }

    // MARK: - Conformance: FundingSource

    /// Identifier generated by the Virtual Cards Service.
    public let id: String

    /// Owner identifier of the funding source. Typically the user sub.
    public let owner: String

    /// Version assigned by the service.
    public let version: Int

    /// Virtual Cards service timestamp to when the funding source record was created.
    public let createdAt: Date

    /// Virtual Cards service timestamp to when the funding source record was last updated.
    public let updatedAt: Date

    /// Type of this funding source - always `CREDIT_CARD`
    public let type: FundingSourceType = .creditCard

    /// Current state of the funding source.
    public let state: FundingSourceState

    /// Set of flags associated with the funding source
    public let flags: [FundingSourceFlags ]

    /// Currency of the funding source.
    public let currency: String

    /// Effective transaction velocity, if any, applied to
    /// virtual card transactions funded by this funding source.
    /// This is the combined result of all velocity policies
    /// (global and funding source specific) as at the time this funding
    /// source was retrieved.
    public let transactionVelocity: TransactionVelocity?

    // MARK: - CreditCardFundingSource

    /// Last 4 digits of the card of the funding source.
    public let last4: String

    /// Payment Method network of the funding source.
    public let network: Network

    /// Type of card represented by this funding source
    public let cardType: CardType

    /// Construct a credit card funding source
    /// - Parameters:
    ///   - id: Identifier generated by the Virtual Cards Service.
    ///   - owner: Owner identifier of the funding source. Typically the user sub.
    ///   - version: Version assigned by the service.
    ///   - createdAt: Virtual Cards service timestamp to when the funding source record was created.
    ///   - updatedAt: Virtual Cards service timestamp to when the funding source record was last updated.
    ///   - state: Current state of the funding source.
    ///   - flags: Current set of flags associated with the funding source.
    ///   - currency: Currency of the funding source.
    ///   - transactionVelocity: Effective transaction velocity, if any, applied to virtual card transactions funded by this funding source.
    ///   - last4: Last 4 digits of the card number of the funding source.
    ///   - network: Payment Method network of the funding source.
    ///   - cardType: Type of card represented by this funding source.
    public init(
        id: String,
        owner: String,
        version: Int,
        state: FundingSourceState,
        flags: [FundingSourceFlags],
        currency: String,
        transactionVelocity: TransactionVelocity? = nil,
        last4: String,
        network: Network,
        cardType: CardType,
        createdAt: Date,
        updatedAt: Date
    ) {
        self.id = id
        self.owner = owner
        self.version = version
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.state = state
        self.flags = flags
        self.currency = currency
        self.transactionVelocity = transactionVelocity

        self.last4 = last4
        self.network = network
        self.cardType = cardType
    }

    public func isUnfunded() -> Bool {
        return self.flags.contains(.unfunded)
    }
}
