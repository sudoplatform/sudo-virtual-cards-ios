//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Plaid specific application configuration to support funding source creation.
public struct PlaidApplicationConfiguration: Codable, Equatable {

    // MARK: - Properties

    /// Name of the client application.
    public let clientName: String

    /// The Post-OAuth redirect URI.
    public let redirectUri: String

    /// The application identifier associationto support the Associated Domains Entitlement.
    public let appIdAssociation: String

    // MARK: - Conformance: Codable

    enum CodingKeys: String, CodingKey {
        case clientName = "client_name"
        case redirectUri = "redirect_uri"
        case appIdAssociation = "app_id_association"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(clientName, forKey: .clientName)
        try container.encode(redirectUri, forKey: .redirectUri)
        try container.encode(appIdAssociation, forKey: .appIdAssociation)
    }
}

/// The funding source provider configuration.
public struct FundingSourceProviders: Codable, Equatable {
    /// The Plaid specific configuration.
    public let plaid: PlaidApplicationConfiguration

    // MARK: - Conformance: Codable

    enum CodingKeys: String, CodingKey {
        case plaid
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(plaid, forKey: .plaid)
    }
}

/// The client application configuration containing information associated with Android client applications.
public struct ClientApplicationConfiguration: Codable, Equatable {
    /// The configuration for each funding source provider.
    public let fundingSourceProviders: FundingSourceProviders

    // MARK: - Conformance: Codable

    enum CodingKeys: String, CodingKey {
        case fundingSourceProviders = "funding_source_providers"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(fundingSourceProviders, forKey: .fundingSourceProviders)
    }
}
