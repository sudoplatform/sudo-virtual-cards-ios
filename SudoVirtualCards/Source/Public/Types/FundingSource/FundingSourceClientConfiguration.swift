//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// The Sudo Platform SDK representation of the funding source client configuration for Stripe card provider
public struct StripeCardClientConfiguration: BaseFundingSourceClientConfiguration, Equatable {

    // MARK: - Properties

    /// Type of the funding source  provider.
    public let type: String = "stripe"

    /// Type of funding source provided
    public let fundingSourceType: FundingSourceType = .creditCard

    /// Configuration version.
    public let version: Int = 1

    /// API Key for configuring calls to the provider.
    public let apiKey: String

    // MARK: - Lifecycle

    public init(apiKey: String) {
        self.apiKey = apiKey
    }

}

/// The Sudo Platform SDK representation of the funding source client configuration for checkout.com bank account provider
public struct CheckoutBankAccountClientConfiguration: BaseFundingSourceClientConfiguration, Equatable {

    // MARK: - Properties

    /// Type of the funding source provider.
    public let type: String = "checkout"

    /// Type of funding source provided
    public let fundingSourceType: FundingSourceType = .bankAccount

    /// Configuration version.
    public let version: Int = 1

    /// API Key for configuring calls to the provider.
    public let apiKey: String

    // MARK: - Lifecycle

    public init(apiKey: String) {
        self.apiKey = apiKey
    }
}

public enum FundingSourceClientConfiguration: BaseFundingSourceClientConfiguration, Equatable {

    case stripeCard(StripeCardClientConfiguration)
    case checkoutBankAccount(CheckoutBankAccountClientConfiguration)
    case unknown(BaseFundingSourceClientConfiguration)

    // MARK: - Conformance BaseFundingSourceClientConfiguration

    public var type: String {
        switch self {
        case .stripeCard(let config):
            return config.type
        case .checkoutBankAccount(let config):
            return config.type
        case .unknown(let config):
            return config.type
        }
    }

    public var fundingSourceType: FundingSourceType {
        switch self {
        case .stripeCard(let config):
            return config.fundingSourceType
        case .checkoutBankAccount(let config):
            return config.fundingSourceType
        case .unknown(let config):
            return config.fundingSourceType
        }
    }

    public var version: Int {
        switch self {
        case .stripeCard(let config):
            return config.version
        case .checkoutBankAccount(let config):
            return config.version
        case .unknown(let config):
            return config.version
        }
    }

    // MARK: - Conformance: Equatable

    public static func == (lhs: FundingSourceClientConfiguration, rhs: FundingSourceClientConfiguration) -> Bool {
        switch lhs {
        case .stripeCard(let lhsConfig):
            switch rhs {
            case .stripeCard(let rhsConfig): return lhsConfig == rhsConfig
            default: return false
            }
        case .checkoutBankAccount(let lhsConfig):
            switch rhs {
            case .checkoutBankAccount(let rhsConfig): return lhsConfig == rhsConfig
            default: return false
            }
        case .unknown: return false
        }
    }
}
