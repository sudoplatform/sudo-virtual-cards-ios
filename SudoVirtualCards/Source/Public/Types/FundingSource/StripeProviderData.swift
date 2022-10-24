//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
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

public struct StripeCardProvisioningData: FundingSourceProviderData, Hashable {

    // MARK: - Supplementary

    struct Data: Decodable, Hashable {

        // MARK: - Properties

        let provider: String
        let type: FundingSourceType
        let version: Int

        /// Setup Intent ID.
        var intent: String

        /// Setup Client Secret.
        var clientSecret: String

        // MARK: - Lifecycle

        init(intent: String, clientSecret: String) {
            self.provider = StripeDefaults.provider
            self.version = StripeDefaults.version
            self.type = .creditCard
            self.intent = intent
            self.clientSecret = clientSecret
        }

        // MARK: - Conformance: Decodable

        enum CodingKeys: String, CodingKey {
            case provider
            case type
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
            let type = FundingSourceType(try container.decode(String.self, forKey: .type))
            guard type == FundingSourceType.creditCard else {
                throw DecodingError.dataCorruptedError(forKey: CodingKeys.type,
                                                       in: container,
                                                       debugDescription: "Type must equal \(FundingSourceType.creditCard)")
            }

            self.provider = provider
            self.type = type
            self.version = version
            self.intent = try container.decode(String.self, forKey: .intent)
            self.clientSecret = try container.decode(String.self, forKey: .clientSecret)
        }
    }

    // MARK: - Properties

    public var provider: String {
        return data.provider
    }

    public var type: FundingSourceType {
        return data.type
    }

    public var version: Int {
        return data.version
    }

    public var intent: String {
        return data.intent
    }

    public var clientSecret: String {
        return data.clientSecret
    }

    let data: Data

    // MARK: - Lifecycle

    init(data: Data) {
        self.data = data
    }

    init(intent: String, clientSecret: String) {
        self.init(data: .init(intent: intent, clientSecret: clientSecret))
    }
}

/// Data received from stripe to complete provisioning a funding source.
public struct StripeCardCompletionData: FundingSourceProviderData, Hashable {

    // MARK: - Supplemental

    struct Data: Encodable, Hashable {

        // MARK: - Properties

        let provider: String = "stripe"
        let type: FundingSourceType = FundingSourceType.creditCard
        let version: Int = 1

        /// Specifies payment method bound to confirmed SetupIntent.
        var paymentMethod: String

        init(paymentMethod: String) {
            self.paymentMethod = paymentMethod
        }

        // MARK: - Conformance: Encodable

        enum CodingKeys: String, CodingKey {
            case provider
            case type
            case version
            case paymentMethod = "payment_method"
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(provider, forKey: .provider)
            try container.encode(type, forKey: .type)
            try container.encode(version, forKey: .version)
            try container.encode(paymentMethod, forKey: .paymentMethod)
        }
    }

    // MARK: - Properties

    let data: Data

    public var provider: String {
        return data.provider
    }

    public var type: FundingSourceType {
        return data.type
    }

    public var version: Int {
        return data.version
    }

    public var paymentMethod: String {
        return data.paymentMethod
    }

    // MARK: - Lifecycle

    init(paymentMethod: String) {
        self.data = Data(paymentMethod: paymentMethod)
    }

}
