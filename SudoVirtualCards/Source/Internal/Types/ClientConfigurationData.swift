//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

struct BaseClientConfiguration: BaseFundingSourceClientConfiguration, Decodable, Equatable {
    // MARK: - Properties

    let type: String
    let fundingSourceType: FundingSourceType
    let version: Int

    // MARK: - Supplementary

    enum CodingKeys: String, CodingKey {
        case type
        case fundingSourceType
        case version
    }

    // MARK: - Lifecycle

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)
        let fundingSourceTypeValue = try container.decode(String.self, forKey: .fundingSourceType)
        fundingSourceType = FundingSourceType(fundingSourceTypeValue)
        version = try container.decode(Int.self, forKey: .version)
    }
}

struct InternalStripeCardClientConfiguration: BaseFundingSourceClientConfiguration, Decodable, Equatable {
    // MARK: - Properties

    var type: String = "stripe"
    var fundingSourceType: FundingSourceType = FundingSourceType.creditCard
    var version: Int = 1
    let apiKey: String

    // MARK: - Conformance: Decodable

    enum CodingKeys: String, CodingKey {
        case apiKey
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiKey = try container.decode(String.self, forKey: .apiKey)
    }

    // MARK: - Lifecycle

    init(apiKey: String) {
        self.apiKey = apiKey
    }
}

struct InternalCheckoutCardClientConfiguration: BaseFundingSourceClientConfiguration, Decodable, Equatable {
    // MARK: - Properties

    var type: String = "checkout"
    var fundingSourceType: FundingSourceType = FundingSourceType.creditCard
    var version: Int = 1
    let apiKey: String

    // MARK: - Conformance: Decodable

    enum CodingKeys: String, CodingKey {
        case apiKey
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiKey = try container.decode(String.self, forKey: .apiKey)
    }

    // MARK: - Lifecycle

    init(apiKey: String) {
        self.apiKey = apiKey
    }
}

struct InternalCheckoutBankAccountClientConfiguration: BaseFundingSourceClientConfiguration, Decodable, Equatable {
    // MARK: - Properties

    var type: String = "checkout"
    var fundingSourceType: FundingSourceType = FundingSourceType.bankAccount
    var version: Int = 1
    let apiKey: String

    // MARK: - Conformance: Decodable

    enum CodingKeys: String, CodingKey {
        case apiKey
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiKey = try container.decode(String.self, forKey: .apiKey)
    }

    // MARK: - Lifecycle

    init(apiKey: String) {
        self.apiKey = apiKey
    }
}

enum ClientConfiguration: Decodable, Equatable {

    case stripeCard(InternalStripeCardClientConfiguration)
    case checkoutCard(InternalCheckoutCardClientConfiguration)
    case checkoutBankAccount(InternalCheckoutBankAccountClientConfiguration)
    case unknown(BaseFundingSourceClientConfiguration)

    // MARK: - Conformance: Decodable

    init(from decoder: Decoder) throws {
        let base = try BaseClientConfiguration(from: decoder)
        if base.type == "stripe" && base.fundingSourceType == .creditCard && base.version == 1 {
            self = try .stripeCard(InternalStripeCardClientConfiguration(from: decoder))
        } else if base.type == "checkout" && base.fundingSourceType == .creditCard && base.version == 1 {
            self = try .checkoutCard(InternalCheckoutCardClientConfiguration(from: decoder))
        } else if base.type == "checkout" && base.fundingSourceType == .bankAccount && base.version == 1 {
            self = try .checkoutBankAccount(InternalCheckoutBankAccountClientConfiguration(from: decoder))
        } else {
            self = .unknown(base)
        }
    }

    // MARK: - Conformance: Equatable

    static func == (lhs: ClientConfiguration, rhs: ClientConfiguration) -> Bool {
        switch lhs {
        case .stripeCard(let lhsConfig):
            switch rhs {
            case .stripeCard(let rhsConfig): return lhsConfig == rhsConfig
            default: return false
            }
        case .checkoutCard(let lhsConfig):
            switch rhs {
            case .checkoutCard(let rhsConfig): return lhsConfig == rhsConfig
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

/// Data retrieved from the Sudo Virtual Cards Service call `getFundingSourceClientConfiguration`.
struct ClientConfigurations: Decodable, Equatable {
    // MARK: - Supplementary

    // MARK: - Properties

    let fundingSourceTypes: [ClientConfiguration]

    // MARK: - Lifecycle

    init(fundingSourceTypes: [ClientConfiguration]) {
        self.fundingSourceTypes = fundingSourceTypes
    }

    enum CodingKeys: String, CodingKey {
        case fundingSourceTypes
    }

    init(from: Decoder) throws {
        let container = try from.container(keyedBy: CodingKeys.self)
        self.fundingSourceTypes = try container.decode([ClientConfiguration].self, forKey: .fundingSourceTypes)
    }
}
