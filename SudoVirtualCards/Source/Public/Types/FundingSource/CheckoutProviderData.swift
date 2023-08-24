//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

struct CheckoutDefaults {
    /// Provider String
    static let provider = "checkout"
    /// Associated supported version.
    static let version = 1
}

public struct CheckoutCardProvisioningData: FundingSourceProviderData, Decodable, Hashable {
    // MARK: - Properties

    public let provider: String
    public let type: FundingSourceType
    public let version: Int

    // MARK: - Conformance: Encodable

    enum CodingKeys: String, CodingKey {
        case provider
        case type
        case version
    }

    // MARK: - Lifecycle

    public init(from decoder: Decoder) throws {
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

    public init() {
        self.provider = CheckoutDefaults.provider
        self.type = .creditCard
        self.version = CheckoutDefaults.version
    }
}

public struct CheckoutBankAccountProvisioningData: FundingSourceProviderData, Decodable, Hashable {

    // MARK: - Properties
    public let provider: String
    public let type: FundingSourceType
    public let version: Int

    /// Provider setup link token
    public let linkToken: String
    /// Authorization text
    public let authorizationText: [AuthorizationText]

    // MARK: - Conformance: Encodable

    enum CodingKeys: String, CodingKey {
        case provider
        case type
        case version
        case plaidLinkToken
        case authorizationText
    }

    public init(from decoder: Decoder) throws {
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
        guard type == FundingSourceType.bankAccount else {
            throw DecodingError.dataCorruptedError(forKey: CodingKeys.type,
                                                   in: container,
                                                   debugDescription: "Type must equal \(FundingSourceType.bankAccount)")
        }
        let authorizationText = try container.decode([AuthorizationText].self, forKey: .authorizationText)

        self.provider = provider
        self.type = type
        self.version = version
        let plaidLinkToken = try container.decode(PlaidLinkToken.self, forKey: .plaidLinkToken)
        self.linkToken = plaidLinkToken.linkToken
        self.authorizationText = authorizationText
    }

    // MARK: - Lifecycle

    init(linkToken: String, authorizationText: [AuthorizationText]) {
        self.provider = CheckoutDefaults.provider
        self.version = CheckoutDefaults.version
        self.type = .bankAccount
        self.linkToken = linkToken
        self.authorizationText = authorizationText
    }

}

/// Data received from checkout to complete provisioning a card based funding source.
public struct CheckoutCardCompletionData: FundingSourceProviderData, Encodable, Hashable {

    // MARK: - Properties

    public let provider: String
    public let type: FundingSourceType
    public let version: Int

    /// Specifies payment token being setup or nil if calling back after completing
    /// required user interaction
    public let paymentToken: String?

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

    // MARK: - Lifecycle

    init(paymentToken: String?) {
        self.provider = CheckoutDefaults.provider
        self.type = .creditCard
        self.version = CheckoutDefaults.version
        self.paymentToken = paymentToken
    }
}

///
/// Data received to continue funding source completion process when further user interaction is required
/// for Checkout Card funding sources.
///
public struct CheckoutCardInteractionData: FundingSourceProviderData, Decodable, Hashable {

    // MARK: - Properties

    public let provider: String
    public let type: FundingSourceType
    public let version: Int
    public let redirectUrl: String

    // MARK: - Conformance: Encodable

    enum CodingKeys: String, CodingKey {
        case provider
        case type
        case version
        case redirectUrl
    }

    public init(from decoder: Decoder) throws {
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

    // MARK: - Lifecycle

    public init(redirectUrl: String) {
        self.provider = CheckoutDefaults.provider
        self.version = CheckoutDefaults.version
        self.type = .creditCard
        self.redirectUrl = redirectUrl
    }
}

///
/// Data received to continue funding source refresh process when further user interaction is required
/// for Checkout Bank Account funding sources.
///
public struct CheckoutBankAccountRefreshInteractionData: FundingSourceProviderData, Decodable, Hashable {

    // MARK: - Properties

    public let provider: String
    public let type: FundingSourceType
    public let version: Int
    public let linkToken: String
    public let authorizationText: [AuthorizationText]

    // MARK: - Conformance: Encodable

    enum CodingKeys: String, CodingKey {
        case provider
        case type
        case version
        case plaidLinkToken
        case authorizationText
    }

    public init(from decoder: Decoder) throws {
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
        guard type == FundingSourceType.bankAccount else {
            throw DecodingError.dataCorruptedError(forKey: CodingKeys.type,
                                                   in: container,
                                                   debugDescription: "Type must equal \(FundingSourceType.bankAccount)")
        }
        let plaidLinkToken = try container.decode(PlaidLinkToken.self, forKey: .plaidLinkToken)
        let authorizationText = try container.decode([AuthorizationText].self, forKey: .authorizationText)
        self.provider = provider
        self.type = type
        self.version = version
        self.linkToken = plaidLinkToken.linkToken
        self.authorizationText = authorizationText
    }

    // MARK: - Lifecycle

    public init(linkToken: String, authorizationText: [AuthorizationText]) {
        self.provider = CheckoutDefaults.provider
        self.version = CheckoutDefaults.version
        self.type = .bankAccount

        self.linkToken = linkToken
        self.authorizationText = authorizationText
    }
}
