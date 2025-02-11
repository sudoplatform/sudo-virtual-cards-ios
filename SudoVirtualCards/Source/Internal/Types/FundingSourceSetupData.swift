//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

// Representation of the client application data which is provided with
// each funding source setup request and mapped to configuration data stored
// at the service.
internal struct FundingSourceSetupData: Encodable, Hashable {

    // MARK: - Properties

    // Specifies the client application name
    let applicationName: String

    // MARK: - Conformance: Encodable

    enum CodingKeys: String, CodingKey {
        case applicationName
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(applicationName, forKey: .applicationName)
    }
}
