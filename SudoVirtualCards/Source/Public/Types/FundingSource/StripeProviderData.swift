//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

struct StripeDefaults {
    /// Provider String - default to "stripe".
    static let provider = "stripe"
    /// Associated supported version.
    static let version = 1
    /// Configuration Type.
    static let configurationType = "stripe"
}

public struct StripeCardProvisioningData: FundingSourceProviderData, Decodable, Hashable {

    // MARK: - Properties

    public let provider: String
    public let type: FundingSourceType
    public let version: Int

    /// Setup Intent ID.
    public let intent: String

    /// Setup Client Secret.
    public let clientSecret: String

    // MARK: - Conformance: Decodable

    enum CodingKeys: String, CodingKey {
        case provider
        case type
        case version
        case intent
        case clientSecret = "client_secret"
    }

    public init(from decoder: Decoder) throws {
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

    // MARK: - Lifecycle

    init(intent: String, clientSecret: String) {
        self.provider = StripeDefaults.provider
        self.version = StripeDefaults.version
        self.type = .creditCard
        self.intent = intent
        self.clientSecret = clientSecret
    }

}

/// Data received from stripe to complete provisioning a funding source.
public struct StripeCardCompletionData: FundingSourceProviderData, Encodable, Hashable {

    // MARK: - Properties

    public let provider: String
    public let type: FundingSourceType
    public let version: Int

    /// Specifies payment method bound to confirmed SetupIntent.
    public let paymentMethod: String

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

    // MARK: - Lifecycle

    public init(paymentMethod: String) {
        self.provider = StripeDefaults.provider
        self.version = StripeDefaults.version
        self.type = .creditCard
        self.paymentMethod = paymentMethod
    }
}
