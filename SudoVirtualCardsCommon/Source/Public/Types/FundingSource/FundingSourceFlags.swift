//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Flags values associated with `FundingSource`.
/// - unfunded: funding source has one or more outstanding transactions and cannot be used to transact
/// - refresh: funding source requires refreshing and revalidation with funding source provider
/// - unknown: value could not be discerned - associated value is unknown and suggests that the SDK version is out of sync with the service.
public enum FundingSourceFlags: Encodable, Decodable, Hashable {
        case unfunded
        case refresh
        case unknown(String)

        // MARK: - Lifecycle

        /// Initialize an instance of `FundingSource.Flags`.
        init(_ flag: String) {
            switch flag {
            case "UNFUNDED":
                self = .unfunded
            case "REFRESH":
                self = .refresh
            /// Backwards compatibility guard for catching new enum values added by the service - check you have the latest version of the SDK
            default:
                self = .unknown(flag)
            }
        }
    public init(from decoder: Decoder) throws {
        let flag = try decoder.singleValueContainer().decode(String.self)
        self.init(flag)
        }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .unfunded:
            try container.encode("UNFUNDED")
        case .refresh:
            try container.encode("REFRESH")
        case .unknown(let flag):
            try container.encode(flag)
        }
    }
}
