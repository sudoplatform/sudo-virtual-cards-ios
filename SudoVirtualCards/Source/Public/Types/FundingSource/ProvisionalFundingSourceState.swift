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
public enum ProvisionalFundingSourceState: Hashable {
        case provisioning
        case pending
        case completed
        case failed
        case unknown(String)

        // MARK: - Lifecycle

        /// Initialize an instance of `ProvisionalFundingSource.State`.
        init(_ state: GraphQL.ProvisionalFundingSourceState) {
            switch state {
            case .provisioning:
                self = .provisioning
            case .pending:
                self = .pending
            case .completed:
                self = .completed
            case .failed:
                self = .failed
            /// Backwards compatibility guard for catching new enum values added by the service - check you have the latest version of the SDK
            case let .unknown(state):
                self = .unknown(state)
            }
        }

        func toGraphQL() -> GraphQL.ProvisionalFundingSourceState {
            switch self {
            case .provisioning:
                return .provisioning
            case .pending:
                return .pending
            case .completed:
                return .completed
            case .failed:
                return .failed
            case let .unknown(state):
                return .unknown(state)
            }
        }
    }
