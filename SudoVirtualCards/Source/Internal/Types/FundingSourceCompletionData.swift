//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

enum FundingSourceCompletionData: Hashable, Encodable {
    case stripeCard(StripeCardCompletionData)
    case checkoutCard(CheckoutCardCompletionData)
    case checkoutBankAccount(CheckoutBankAccountCompletionData)

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .stripeCard(let data):
            try container.encode(data)
        case .checkoutCard(let data):
            try container.encode(data)
        default:
            throw SudoVirtualCardsError.fatalError(description: "Unsupported provider completion data")
        }
    }
}
