//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

extension FundingSourceState {
    /// Initialize an instance of `FundingSourceState` from GraphQL type
    init(_ state: GraphQL.FundingSourceState) {
        switch state {
        case .active:
            self = .active
        case .inactive:
            self = .inactive

        /// Backwards compatibility guard for catching new enum values added by the service - check you have the latest version of the SDK
        case let .unknown(state):
            self = .unknown(state)
        }
    }

    func toGraphQL() -> GraphQL.FundingSourceState {
        switch self {
        case .active:
            return .active
        case .inactive:
            return .inactive
        case let .unknown(state):
            return .unknown(state)
        }
    }

}
