//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

struct BaseProvisioningData: FundingSourceProviderData, Decodable, Hashable {
    // MARK: - Properties

    var provider: String
    var type: FundingSourceType
    var version: Int

    // MARK: - Conformance: Decodable

    enum CodingKeys: CodingKey {
        case provider
        case type
        case version
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.provider = try container.decode(String.self, forKey: .provider)
        self.type = FundingSourceType(try container.decode(String.self, forKey: .type))
        self.version = try container.decode(Int.self, forKey: .version)
    }
}
