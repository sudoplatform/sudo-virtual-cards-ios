//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSAppSync
import AWSCore

/// Configuration for connecting to the Sudo VirtualCards Service via AppSync.
public struct SudoVirtualCardsConfig: AWSAppSyncServiceConfigProvider, Decodable {

    // MARK: - Conformance: AWSAppSyncServiceConfigProvider

    public var endpoint: URL

    public var region: AWSRegionType

    public var authType: AWSAppSyncAuthType = .amazonCognitoUserPools

    public var apiKey: String?

    public var clientDatabasePrefix: String?

    // MARK: - Lifecycle

    /// Initialize an instance of `SudoVirtualCardsConfig`.
    public init(
        endpoint: URL,
        region: AWSRegionType,
        authType: AWSAppSyncAuthType = .amazonCognitoUserPools,
        apiKey: String? = nil,
        clientDatabasePrefix: String? = nil
    ) {
        self.endpoint = endpoint
        self.region = region
        self.authType = authType
        self.apiKey = apiKey
        self.clientDatabasePrefix = clientDatabasePrefix
    }

    // MARK: - Conformance: Decodable

    enum CodingKeys: String, CodingKey {
        case endpoint = "apiUrl"
        case region
        case authType = "authMode"
        case apiKey
        case clientDatabasePrefix
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let endpoint = try container.decode(URL.self, forKey: .endpoint)
        let region = try container.decode(AWSRegionType.self, forKey: .region)
        let authType = try container.decodeIfPresent(AWSAppSyncAuthType.self, forKey: .authType) ?? .amazonCognitoUserPools
        let apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        let clientDatabasePrefix = try container.decodeIfPresent(String.self, forKey: .clientDatabasePrefix)
        self.init(
            endpoint: endpoint,
            region: region,
            authType: authType,
            apiKey: apiKey,
            clientDatabasePrefix: clientDatabasePrefix)
    }

}
