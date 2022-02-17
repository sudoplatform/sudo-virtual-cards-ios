//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// disabled nesting for StripeSetup.Data.CodingKeys
// swiftlint:disable nesting

import Foundation

struct StripeDefaults {
    /// Provider String - default to "stripe".
    static let provider = "stripe"
    /// Associated supported version.
    static let version = 1
    /// Configuration Type.
    static let configurationType = "stripe"
}

/// Basic Stripe Data - all stripe related data contains this.
protocol StripeData {

    /// Provider String.
    var provider: String { get }
    /// Associated supported version.
    var version: Int { get }
}

struct StripeSetup: StripeData, Hashable {

    // MARK: - Supplementary

    struct Data: Decodable, Hashable {
        let provider: String

        let version: Int

        /// Setup Intent ID.
        var intent: String

        /// Setup Client Secret.
        var clientSecret: String

        init(intent: String, clientSecret: String) {
            self.provider = StripeDefaults.provider
            self.version = StripeDefaults.version
            self.intent = intent
            self.clientSecret = clientSecret
        }

        // MARK: - Conformance: Decodable

        enum CodingKeys: String, CodingKey {
            case provider
            case version
            case intent
            case clientSecret = "client_secret"
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let provider = try container.decode(String.self, forKey: .provider)
            guard provider == StripeDefaults.provider else {
                throw DecodingError.dataCorruptedError(
                    forKey: CodingKeys.provider,
                    in: container,
                    debugDescription: "Provider must equal \(StripeDefaults.provider)")
            }
            let version = try container.decode(Int.self, forKey: .version)
            guard version == StripeDefaults.version else {
                throw DecodingError.dataCorruptedError(forKey: CodingKeys.version,
                                                       in: container,
                                                       debugDescription: "Version must equal \(StripeDefaults.version)")
            }
            self.provider = provider
            self.version = version
            self.intent = try container.decode(String.self, forKey: .intent)
            self.clientSecret = try container.decode(String.self, forKey: .clientSecret)
        }
    }

    /// ID Associated with the provisioning of the funding source.
    let id: String

    var provider: String {
        return data.provider
    }

    var version: Int {
        return data.version
    }

    var intent: String {
        return data.intent
    }

    var clientSecret: String {
        return data.clientSecret
    }

    let data: Data

    init(id: String, data: Data) {
        self.id = id
        self.data = data
    }
}

/// Data received from stripe to complete provisioning a funding source.
struct StripeCompletionData: StripeData, Encodable, Hashable {

    let provider: String

    let version: Int

    /// Specifies payment method bound to confirmed SetupIntent.
    var paymentMethod: String

    init(paymentMethod: String) {
        self.provider = StripeDefaults.provider
        self.version = StripeDefaults.version
        self.paymentMethod = paymentMethod
    }

    // MARK: - Conformance: Encodable

    enum CodingKeys: String, CodingKey {
        case provider
        case version
        case paymentMethod = "payment_method"
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(provider, forKey: .provider)
        try container.encode(version, forKey: .version)
        try container.encode(paymentMethod, forKey: .paymentMethod)
    }
}

/// Data retrieved from the Sudo Virtual Cards Service call `getFundingSourceClientConfiguration`.
struct StripeClientConfiguration: Decodable, Hashable {

    // MARK: - Supplementary

    struct FundingSourceType: Decodable, Hashable {
        var type: String = StripeDefaults.configurationType
        var version: Int = StripeDefaults.version
        let apiKey: String

        init(apiKey: String) {
            self.apiKey = apiKey
        }
    }

    // MARK: - Properties

    let fundingSourceTypes: [FundingSourceType]

    // MARK: - Lifecycle

    init(fundingSourceTypes: [FundingSourceType]) {
        self.fundingSourceTypes = fundingSourceTypes
    }

    init(apiKey: String) {
        self.fundingSourceTypes = [FundingSourceType(apiKey: apiKey)]
    }

    init(apiKeys: [String]) {
        self.fundingSourceTypes = apiKeys.map(FundingSourceType.init(apiKey:))
    }
}
