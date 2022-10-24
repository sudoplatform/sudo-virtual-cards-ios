//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// disabled nesting for *.Data.CodingKeys
// swiftlint:disable nesting

import Foundation

struct CheckoutDefaults {
    /// Provider String
    static let provider = "checkout"
    /// Associated supported version.
    static let version = 1
}

public struct CheckoutCardProvisioningData: FundingSourceProviderData, Hashable {

    // MARK: - Supplementary

    struct Data: Decodable, Hashable {

        // MARK: - Properties

        let provider: String
        let type: FundingSourceType
        let version: Int

        // MARK: - Lifecycle

        init() {
            self.provider = CheckoutDefaults.provider
            self.version = CheckoutDefaults.version
            self.type = .creditCard
        }

        // MARK: - Conformance: Encodable

        enum CodingKeys: String, CodingKey {
            case provider
            case type
            case version
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let provider = try container.decode(String.self, forKey: .provider)
            guard provider == CheckoutDefaults.provider else {
                throw DecodingError.dataCorruptedError(
                    forKey: CodingKeys.provider,
                    in: container,
                    debugDescription: "Provider must equal \(CheckoutDefaults.provider)")
            }
            let version = try container.decode(Int.self, forKey: .version)
            guard version == CheckoutDefaults.version else {
                throw DecodingError.dataCorruptedError(forKey: CodingKeys.version,
                                                       in: container,
                                                       debugDescription: "Version must equal \(CheckoutDefaults.version)")
            }
            let typeValue = try container.decode(String.self, forKey: .type)
            let type = FundingSourceType(typeValue)
            guard type == FundingSourceType.creditCard else {
                throw DecodingError.dataCorruptedError(forKey: CodingKeys.type,
                                                       in: container,
                                                       debugDescription: "Type must equal \(FundingSourceType.creditCard)")
            }
            self.provider = provider
            self.type = type
            self.version = version
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

    let data: Data

    // MARK: - Lifecycle

    init(data: Data) {
        self.data = data
    }
}

/// Data received from checkout to complete provisioning a funding source.
public struct CheckoutCardCompletionData: FundingSourceProviderData, Hashable {

    // MARK: - Supplementary

    struct Data: Encodable, Hashable {
        // MARK: - Properties

        let provider: String = CheckoutDefaults.provider
        let type: FundingSourceType = FundingSourceType.creditCard
        let version: Int = CheckoutDefaults.version

        /// Specifies payment token being setup
        var paymentToken: String

        // MARK: - Lifecycle

        init(paymentToken: String) {
            self.paymentToken = paymentToken
        }

        // MARK: - Conformance: Encodable

        enum CodingKeys: String, CodingKey {
            case provider
            case type
            case version
            case paymentToken = "payment_token"
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(provider, forKey: .provider)
            try container.encode(type, forKey: .type)
            try container.encode(version, forKey: .version)
            try container.encode(paymentToken, forKey: .paymentToken)
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

    public var paymentToken: String {
        return data.paymentToken
    }

    // MARK: - Lifecycle

    init(paymentToken: String) {
        self.data = Data(paymentToken: paymentToken)
    }
}

///
/// Data received to continue funding source completion process when further user interaction is required
/// for Checkout Card funding sources.
///
public struct CheckoutCardInteractionData: FundingSourceProviderData, Hashable {
    // MARK: - Supplementary

    struct Data: Decodable, Hashable {

        // MARK: - Properties

        let provider: String
        let type: FundingSourceType
        let version: Int
        let redirectUrl: String

        // MARK: - Lifecycle

        init(redirectUrl: String) {
            self.provider = CheckoutDefaults.provider
            self.version = CheckoutDefaults.version
            self.type = .creditCard
            self.redirectUrl = redirectUrl
        }

        // MARK: - Conformance: Encodable

        enum CodingKeys: String, CodingKey {
            case provider
            case type
            case version
            case redirectUrl
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let provider = try container.decode(String.self, forKey: .provider)
            guard provider == CheckoutDefaults.provider else {
                throw DecodingError.dataCorruptedError(
                    forKey: CodingKeys.provider,
                    in: container,
                    debugDescription: "Provider must equal \(CheckoutDefaults.provider)")
            }
            let version = try container.decode(Int.self, forKey: .version)
            guard version == CheckoutDefaults.version else {
                throw DecodingError.dataCorruptedError(forKey: CodingKeys.version,
                                                       in: container,
                                                       debugDescription: "Version must equal \(CheckoutDefaults.version)")
            }
            let typeValue = try container.decode(String.self, forKey: .type)
            let type = FundingSourceType(typeValue)
            guard type == FundingSourceType.creditCard else {
                throw DecodingError.dataCorruptedError(forKey: CodingKeys.type,
                                                       in: container,
                                                       debugDescription: "Type must equal \(FundingSourceType.creditCard)")
            }
            let redirectUrl = try container.decode(String.self, forKey: .redirectUrl)
            self.provider = provider
            self.type = type
            self.version = version
            self.redirectUrl = redirectUrl
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

    public var redirectUrl: String {
        return data.redirectUrl
    }

    let data: Data

    // MARK: - Lifecycle

    init(data: Data) {
        self.data = data
    }
}
