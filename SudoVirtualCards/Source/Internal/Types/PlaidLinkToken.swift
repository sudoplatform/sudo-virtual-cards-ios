//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

// A replication of the link token produced by Plaid and delivered to the client to enable invocation
// of the Plaid Link interface.
struct PlaidLinkToken: Decodable, Hashable {

    // token expiration timestamp
    let expiration: String
    // token string to be presented
    let linkToken: String
    // unique request identifier from Plaid
    let requestId: String

    enum CodingKeys: String, CodingKey {
        case expiration
        case linkToken = "link_token"
        case requestId = "request_id"

    }

    // Construct a plaid link token by decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.expiration = try container.decode(String.self, forKey: .expiration)
        self.linkToken = try container.decode(String.self, forKey: .linkToken)
        self.requestId = try container.decode(String.self, forKey: .requestId)
    }
}
