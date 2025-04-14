//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

extension CreditCardFundingSource {
    init(fragment: GraphQL.CreditCardFundingSource) {
        self.id =  fragment.id
        self.owner =  fragment.owner
        self.version =  fragment.version
        self.createdAt =  Date(millisecondsSince1970: fragment.createdAtEpochMs)
        self.updatedAt =  Date(millisecondsSince1970: fragment.updatedAtEpochMs)
        self.state = FundingSourceState(fragment.getFundingSourceState())
        self.flags = fragment.getFundingSourceFlags().map { FundingSourceFlags($0) }
        self.currency = fragment.currency
        self.transactionVelocity = fragment.transactionVelocity?.maximum == nil && fragment.transactionVelocity?.velocity == nil
            ? nil
            : TransactionVelocity(
                maximum: fragment.transactionVelocity?.maximum,
                velocity: fragment.transactionVelocity?.velocity)
        self.last4 = fragment.last4
        self.network = Network(fragment.getCreditCardNetwork())
        self.cardType = CardType(fragment.getCardType())
    }
}
