//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

extension FundingSourceFlags {

        /// Initialize an instance of `FundingSourceFlags`.
        init(_ flag: GraphQL.FundingSourceFlags) {
            switch flag {
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
