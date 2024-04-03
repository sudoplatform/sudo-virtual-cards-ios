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
public enum FundingSourceFlags: Hashable {
        case unfunded
        case refresh
        case unknown(String)

        // MARK: - Lifecycle

        /// Initialize an instance of `FundingSource.Flags`.
        init(_ state: GraphQL.FundingSourceFlags) {
            switch state {
            case .unfunded:
                self = .unfunded
            case .refresh:
                self = .refresh
            /// Backwards compatibility guard for catching new enum values added by the service - check you have the latest version of the SDK
            case let .unknown(flag):
                self = .unknown(flag)
            }
        }
    }
