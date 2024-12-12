//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

extension FundingSourceType {
    /// Initialize an instance of `FundingSourceType` from GraphQL type
    init(_ type: GraphQL.FundingSourceType) {
        switch type {
        case .creditCard:
            self = .creditCard
        case .bankAccount:
            self = .bankAccount
        case let .unknown(type):
            self = .unknown(type)
        }
    }

}
