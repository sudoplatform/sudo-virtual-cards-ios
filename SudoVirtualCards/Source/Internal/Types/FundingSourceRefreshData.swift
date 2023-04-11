//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

enum FundingSourceRefreshData: Hashable, Encodable {
    case checkoutBankAccount(CheckoutBankAccountRefreshData)

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .checkoutBankAccount(let data):
            try container.encode(data)
        }
    }
}
