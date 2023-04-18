//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Data required to refresh a bank account funding source with the Checkout provider.
/// The authorization text signature is optional as the client may attempt a refresh without authorization to begin
/// the negotiation of refresh with the institution.
struct CheckoutBankAccountRefreshData: FundingSourceProviderData, Encodable, Hashable {
    // MARK: - Properties

    let provider: String
    let type: FundingSourceType
    let version: Int

    /// Client application name, shared with the service for configuration information
    let applicationName: String

    /// Specifies the key id used to sign the authorization text
    let keyId: String

    // If provided, specifies the proof of user's acknowledgement of bank account access authorization.
    let authorizationTextSignature: AuthorizationTextSignature?

    // MARK: - Conformance: Encodable

    enum CodingKeys: String, CodingKey {
        case provider
        case type
        case version
        case applicationName
        case keyId
        case authorizationTextSignature
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(provider, forKey: .provider)
        try container.encode(type, forKey: .type)
        try container.encode(version, forKey: .version)
        try container.encode(applicationName, forKey: .applicationName)
        try container.encode(keyId, forKey: .keyId)
        try container.encode(authorizationTextSignature, forKey: .authorizationTextSignature)
    }

    // MARK: - Lifecycle

    init(applicationName: String, keyId: String, authorizationTextSignature: AuthorizationTextSignature?) {
        self.provider = CheckoutDefaults.provider
        self.type = .bankAccount
        self.version = CheckoutDefaults.version
        self.applicationName = applicationName
        self.keyId = keyId
        self.authorizationTextSignature = authorizationTextSignature
    }
}
