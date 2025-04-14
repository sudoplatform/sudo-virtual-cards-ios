//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Configuration for connecting to the Sudo VirtualCards Service via AppSync.
public struct SudoVirtualCardsConfig: Decodable {

    // MARK: - Supplementary

    enum CodingKeys: String, CodingKey {
        case endpoint = "apiUrl"
        case region
        case clientDatabasePrefix
    }

    // MARK: - Conformance: AWSAppSyncServiceConfigProvider

    public let endpoint: String

    public let region: String

    public let clientDatabasePrefix: String?

    // MARK: - Lifecycle

    /// Initialize an instance of `SudoVirtualCardsConfig`.
    public init(endpoint: String, region: String, clientDatabasePrefix: String? = nil) {
        self.endpoint = endpoint
        self.region = region
        self.clientDatabasePrefix = clientDatabasePrefix
    }

    // MARK: - Conformance: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let endpoint = try container.decode(String.self, forKey: .endpoint)
        let region = try container.decode(String.self, forKey: .region)
        let clientDatabasePrefix = try container.decodeIfPresent(String.self, forKey: .clientDatabasePrefix)
        self.init(endpoint: endpoint, region: region, clientDatabasePrefix: clientDatabasePrefix)
    }
}
