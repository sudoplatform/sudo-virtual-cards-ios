//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of a Virtual Card Config
public struct VirtualCardsConfig: Equatable {

    // MARK: - Properties

    /// The maximum number of funding sources that can be
    /// successfully created within a defined period.
    public var maxFundingSourceVelocity: [String]

    /// The maximum number of failed funding source
    /// creations that can be performed within a defined period.
    public var maxFundingSourceFailureVelocity: [String]

    /// The maximum number of pending funding source
    /// creations that can be performed within a defined period.
    public var maxFundingSourcePendingVelocity: [String]

    /// The maximum number of virtual cards that can be
    /// created within a defined period.
    public var maxCardCreationVelocity: [String]

    /// The maximum number of transactions that
    /// can be created within a defined period.
    public var maxTransactionVelocity: [CurrencyVelocity]

    /// The maximum transaction amount per currency.
    public var maxTransactionAmount: [CurrencyAmount]

    /// The list of supported virtual card currencies.
    public var virtualCardCurrencies: [String]

    /// The funding source support info.
    public var fundingSourceSupportInfo: [FundingSourceSupportInfo]

    /// The funding source client configuration.
    public var fundingSourceClientConfiguration: [FundingSourceClientConfiguration]

    /// The pricing policy for each funding source provider.
    public var pricingPolicy: PricingPolicy?

    // MARK: - Lifecycle

    /// Initialise an instance of `VirtualCardConfig`.
    public init(
        maxFundingSourceVelocity: [String],
        maxFundingSourceFailureVelocity: [String],
        maxFundingSourcePendingVelocity: [String],
        maxCardCreationVelocity: [String],
        maxTransactionVelocity: [CurrencyVelocity],
        maxTransactionAmount: [CurrencyAmount],
        virtualCardCurrencies: [String],
        fundingSourceSupportInfo: [FundingSourceSupportInfo],
        fundingSourceClientConfiguration: [FundingSourceClientConfiguration],
        pricingPolicy: PricingPolicy
    ) {
        self.maxFundingSourceVelocity = maxFundingSourceVelocity
        self.maxFundingSourceFailureVelocity = maxFundingSourceFailureVelocity
        self.maxFundingSourcePendingVelocity = maxFundingSourcePendingVelocity
        self.maxCardCreationVelocity = maxCardCreationVelocity
        self.maxTransactionVelocity = maxTransactionVelocity
        self.maxTransactionAmount = maxTransactionAmount
        self.virtualCardCurrencies = virtualCardCurrencies
        self.fundingSourceSupportInfo = fundingSourceSupportInfo
        self.fundingSourceClientConfiguration = fundingSourceClientConfiguration
        self.pricingPolicy = pricingPolicy
    }
}
