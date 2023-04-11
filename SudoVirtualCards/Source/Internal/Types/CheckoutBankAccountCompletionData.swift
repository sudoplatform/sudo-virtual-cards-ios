//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Data received from checkout to complete provisioning a bank account based funding source.
struct CheckoutBankAccountCompletionData: FundingSourceProviderData, Hashable {

    // MARK: - Properties

    public let provider: String
    public let type: FundingSourceType
    public let version: Int

    /// Token to be exchanged in order to perform bank account operations.
    public let publicToken: String
    /// Identifier of the bank account to be used.
    public let accountId: String
    /// Identifier of the institution at which account to be used is held.
    public let institutionId: String
    /// Authorization text presented to and agreed to by the user.
    public let authorizationText: AuthorizationText

    // MARK: - Lifecycle

    init(publicToken: String, accountId: String, institutionId: String, authorizationText: AuthorizationText) {
        self.provider = CheckoutDefaults.provider
        self.type = .bankAccount
        self.version = CheckoutDefaults.version
        self.publicToken = publicToken
        self.accountId = accountId
        self.institutionId = institutionId
        self.authorizationText = authorizationText
    }
}

/// Data required to complete the bank account funding source creation.
struct SerializedCheckoutBankAccountCompletionData: FundingSourceProviderData, Encodable, Hashable {

    // MARK: - Properties

    let provider: String
    let type: FundingSourceType
    let version: Int

    /// Specifies the key id used to sign the authorization text
    let keyId: String
    /// Token to be exchanged in order to perform bank account operations.
    let publicToken: String
    /// Identifier of the bank account to be used.
    let accountId: String
    /// Identifier of the institution at which account to be used is held.
    let institutionId: String
    /// Specifies the proof of user's acknowledgement of bank account access authorization.
    let authorizationTextSignature: AuthorizationTextSignature

    // MARK: - Conformance: Encodable

    enum CodingKeys: String, CodingKey {
        case provider
        case type
        case version
        case keyId
        case publicToken = "public_token"
        case accountId = "account_id"
        case institutionId = "institution_id"
        case authorizationTextSignature
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(provider, forKey: .provider)
        try container.encode(type, forKey: .type)
        try container.encode(version, forKey: .version)
        try container.encode(keyId, forKey: .keyId)
        try container.encode(publicToken, forKey: .publicToken)
        try container.encode(accountId, forKey: .accountId)
        try container.encode(institutionId, forKey: .institutionId)
        try container.encode(authorizationTextSignature, forKey: .authorizationTextSignature)
    }

    // MARK: - Lifecycle

    init(keyId: String, publicToken: String, accountId: String, institutionId: String, authorizationTextSignature: AuthorizationTextSignature) {
        self.provider = CheckoutDefaults.provider
        self.type = .bankAccount
        self.version = CheckoutDefaults.version
        self.keyId = keyId
        self.publicToken = publicToken
        self.accountId = accountId
        self.institutionId = institutionId
        self.authorizationTextSignature = authorizationTextSignature
    }
}
