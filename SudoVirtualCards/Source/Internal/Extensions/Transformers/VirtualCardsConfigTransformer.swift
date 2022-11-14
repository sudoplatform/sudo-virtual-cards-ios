//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSAppSync

extension VirtualCardsConfig {
    init(fragment: GraphQL.GetVirtualCardsConfigQuery.Data.GetVirtualCardsConfig) {
        self.maxFundingSourceVelocity = fragment.maxFundingSourceVelocity
        self.maxFundingSourceFailureVelocity = fragment.maxFundingSourceFailureVelocity
        self.maxCardCreationVelocity = fragment.maxCardCreationVelocity
        self.maxTransactionVelocity = fragment.maxTransactionVelocity.map { (velocity)
            in return CurrencyVelocity(fragment: velocity)
        }
        self.maxTransactionAmount = fragment.maxTransactionAmount.map { (amount)
            in return CurrencyAmount(fragment: amount)
        }
        self.virtualCardCurrencies = fragment.virtualCardCurrencies
        self.fundingSourceSupportInfo = fragment.fundingSourceSupportInfo.map { (info)
            in return FundingSourceSupportInfo(fragment: info)
        }
    }
}

extension CurrencyVelocity {
    init(fragment: GraphQL.GetVirtualCardsConfigQuery.Data.GetVirtualCardsConfig.MaxTransactionVelocity) {
        self.currency = fragment.currency
        self.velocity = fragment.velocity
    }
}

extension CurrencyAmount {
    init(fragment: GraphQL.GetVirtualCardsConfigQuery.Data.GetVirtualCardsConfig.MaxTransactionAmount) {
        self.currency = fragment.currency
        self.amount = fragment.amount
    }
}

extension FundingSourceSupportInfo {
    init(fragment: GraphQL.GetVirtualCardsConfigQuery.Data.GetVirtualCardsConfig.FundingSourceSupportInfo) {
        self.providerType = fragment.providerType
        self.fundingSourceType = fragment.fundingSourceType
        self.network = fragment.network
        self.detail = fragment.detail.map { (det: GraphQL.GetVirtualCardsConfigQuery.Data.GetVirtualCardsConfig.FundingSourceSupportInfo.Detail)
            in return FundingSourceSupportDetail(fragment: det)}
    }
}

extension FundingSourceSupportDetail {
    init(fragment: GraphQL.GetVirtualCardsConfigQuery.Data.GetVirtualCardsConfig.FundingSourceSupportInfo.Detail) {
        self.cardType = CardType(fragment.cardType)
    }
}
