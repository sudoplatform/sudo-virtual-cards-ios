//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// State type associated with `FundingSource`.
/// - active: funding source is active.
/// - inactive: funding source is inactive.
/// - refresh: funding source requires refreshing and revalidation with funding source provider
/// - unknown: type could not be discerned - associated value is unknown and suggests that the SDK version is out of sync with the service.
public enum FundingSourceState: Hashable {
        case active
        case inactive
        case refresh
        case unknown(String)

        // MARK: - Lifecycle

        /// Initialize an instance of `FundingSource.State`.
        init(_ state: GraphQL.FundingSourceState) {
            switch state {
            case .active:
                self = .active
            case .inactive:
                self = .inactive
            case .refresh:
                self = .refresh

            /// Backwards compatibility guard for catching new enum values added by the service - check you have the latest version of the SDK
            case let .unknown(state):
                self = .unknown(state)
            }
        }
    }
