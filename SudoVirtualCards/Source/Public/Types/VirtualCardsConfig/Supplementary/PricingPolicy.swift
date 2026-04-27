//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of the pricing policy for each funding source provicer which make up a component
/// of the virtual cards configuration.
public struct PricingPolicy: Codable, Equatable {

    // MARK: - Properties

    /// The Stripe-specific pricing policy.
    public let stripe: StripePricingPolicy?


    // MARK: - Conformance: Codable

    enum CodingKeys: String, CodingKey {
        case stripe
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(stripe, forKey: .stripe)
    }

    // MARK: - Lifecycle

    /// Initialise an instance of `PricingPolicy`.
    public init(stripe: StripePricingPolicy? = nil) {
        self.stripe = stripe
    }
}

public struct StripePricingPolicy: Codable, Equatable {

    // MARK: - Properties

    /// The credit card mark up data for each pricing tier.
    public let creditCard: [String: TieredMarkupPolicy]

    // MARK: - Conformance: Codable

    enum CodingKeys: String, CodingKey {
        case creditCard = "CREDIT_CARD"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(creditCard, forKey: .creditCard)
    }

    // MARK: - Lifecycle

    /// Initialise an instance of `StripePricingPolicy`.
    public init(creditCard: [String: TieredMarkupPolicy]) {
        self.creditCard = creditCard
    }
}


public struct TieredMarkup: Codable, Equatable {

    // MARK: - Properties

    /// The markup to apply.
    public let markup: Markup

    /// The minimum threshold to which a tier applies.
    public let minThreshold: Int?

    // MARK: - Conformance: Codable

    enum CodingKeys: String, CodingKey {
        case markup
        case minThreshold
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(markup, forKey: .markup)
        try container.encode(minThreshold, forKey: .minThreshold)
    }

    // MARK: - Lifecycle

    /// Initialise an instance of `TieredMarkup`.
    public init(markup: Markup, minThreshold: Int? = nil) {
        self.markup = markup
        self.minThreshold = minThreshold
    }
}

public struct TieredMarkupPolicy: Codable, Equatable {

    // MARK: - Properties

    /// Tiers of markup to apply to virtual card transactions when charging funding source.
    public let tiers: [TieredMarkup]

    // MARK: - Conformance: Codable

    enum CodingKeys: String, CodingKey {
        case tiers
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(tiers, forKey: .tiers)
    }

    // MARK: - Lifecycle

    /// Initialise an instance of `TieredMarkupPolicy`.
    public init(tiers: [TieredMarkup]) {
        self.tiers = tiers
    }
}

public struct Markup: Codable, Equatable {

    // MARK: - Properties

    /// Floating point percentage amount applied in calculating
    /// total markup multiple by 1000.
    public let percent: Int

    /// Flat amount applied in calculating total markup in minor
    /// currency unit of billed currency.
    public let flat: Int

    /// The minimum charge that will be made to the funding source.
    public let minCharge: Int?

    // MARK: - Conformance: Codable

    enum CodingKeys: String, CodingKey {
        case percent
        case flat
        case minCharge
    }

    // MARK: - Lifecycle

    /// Initialise an instance of `Markup`.
    public init(percent: Int, flat: Int, minCharge: Int? = nil) {
        self.percent = percent
        self.flat = flat
        self.minCharge = minCharge
    }
}
