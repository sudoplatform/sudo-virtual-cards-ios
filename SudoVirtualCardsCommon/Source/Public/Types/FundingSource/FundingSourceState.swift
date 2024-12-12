//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// State type associated with `FundingSource`.
/// - active: funding source is active.
/// - inactive: funding source is inactive.
/// - unknown: type could not be discerned - associated value is unknown and suggests that the SDK version is out of sync with the service.
public enum FundingSourceState: Encodable, Decodable, Hashable {
        case active
        case inactive
        case unknown(String)

        // MARK: - Lifecycle

        /// Initialize an instance of `FundingSource.State`.
        init(_ state: String) {
            switch state {
            case "ACTIVE":
                self = .active
            case "INACTIVE":
                self = .inactive
            /// Backwards compatibility guard for catching new enum values added by the service - check you have the latest version of the SDK
            default:
                self = .unknown(state)
            }
        }
    
    public init(from decoder: Decoder) throws {
        let state = try decoder.singleValueContainer().decode(String.self)
        self.init(state)
        }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .active:
            try container.encode("ACTIVE")
        case .inactive:
            try container.encode("INACTIVE")
        case .unknown(let state):
            try container.encode(state)
        }
    }
}
