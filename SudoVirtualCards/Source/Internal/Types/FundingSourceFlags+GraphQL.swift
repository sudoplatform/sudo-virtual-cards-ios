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
            case let .unknown(flag):
                self = .unknown(flag)
            case .invalid:
                self = .unknown("invalid")
            }

    }
}
