//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSAppSync

extension VirtualCardsConfig {
    init(fragment: GraphQL.GetVirtualCardsConfigQuery.Data.GetVirtualCardsConfig) {
        self.maxFundingSourceVelocity = fragment.maxFundingSourceVelocity
        self.maxFundingSourceFailureVelocity = fragment.maxFundingSourceFailureVelocity
        self.maxFundingSourcePendingVelocity = fragment.maxFundingSourcePendingVelocity ?? []
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
        self.bankAccountFundingSourceExpendableEnabled = fragment.bankAccountFundingSourceExpendableEnabled
        self.bankAccountFundingSourceCreationEnabled = fragment.bankAccountFundingSourceCreationEnabled
        self.fundingSourceClientConfiguration = (fragment.fundingSourceClientConfiguration?.data)
            .flatMap { try? decodeFundingSourceClientConfiguration(configData: $0) } ?? []
        self.clientApplicationConfiguration = (fragment.clientApplicationsConfiguration?.data)
            .flatMap { try? decodeClientApplicationConfiguration(configData: $0) } ?? [:]
        self.pricingPolicy = (fragment.pricingPolicy?.data)
            .flatMap { try? decodePricingPolicy(policyData: $0) } ?? nil
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

internal func decodePricingPolicy(policyData: String) throws -> PricingPolicy {
    let msg = "pricing policy data cannot be decoded"
    let decoder: JSONDecoder = JSONDecoder()

    guard
        let encodedData = Data(base64Encoded: policyData)
    else {
        throw SudoVirtualCardsError.fatalError(description: "\(msg): Base64 decoding failed \(policyData)")
    }
    let decodedData: PricingPolicy
    do {
        decodedData = try decoder.decode(PricingPolicy.self, from: encodedData)
    } catch {
        throw SudoVirtualCardsError.fatalError(description: "\(msg): JSON parsing failed \(encodedData): \(error)")
    }

    return decodedData
}

internal func decodeFundingSourceClientConfiguration(configData: String) throws -> [FundingSourceClientConfiguration] {
    let msg = "funding source client configuration cannot be decoded"
    let decoder: JSONDecoder = JSONDecoder()

    guard
        let encodedData = Data(base64Encoded: configData)
    else {
        throw SudoVirtualCardsError.fatalError(description: "\(msg): Base64 decoding failed \(configData)")
    }
    let decodedData: ClientConfigurations
    do {
        decodedData = try decoder.decode(ClientConfigurations.self, from: encodedData)
    } catch {
        throw SudoVirtualCardsError.fatalError(description: "\(msg): JSON parsing failed \(encodedData): \(error)")
    }

    return decodedData.fundingSourceTypes.map {
        switch $0 {
        case let .stripeCard(config):
            return .stripeCard(StripeCardClientConfiguration(apiKey: config.apiKey))
        case let .checkoutCard(config):
            return .checkoutCard(CheckoutCardClientConfiguration(apiKey: config.apiKey))
        case let .checkoutBankAccount(config):
            return .checkoutBankAccount(CheckoutBankAccountClientConfiguration(apiKey: config.apiKey))
        case let .unknown(config):
            return .unknown(config)
        }
    }
}

internal func decodeClientApplicationConfiguration(configData: String) throws -> [String: ClientApplicationConfiguration] {
    let msg = "client application configuration cannot be decoded"
    let decoder: JSONDecoder = JSONDecoder()

    guard
        let encodedData = Data(base64Encoded: configData)
    else {
        throw SudoVirtualCardsError.fatalError(description: "\(msg): Base64 decoding failed \(configData)")
    }

    do {
        let decodedObject = try JSONSerialization.jsonObject(with: encodedData) as? [String: Any]

        var clientApplicationConfiguration: [String: ClientApplicationConfiguration] = [:]
        if let decodedObject = decodedObject {
            for (key, value) in decodedObject {
                if let fundingSourceProviders = (value as? [String: Any])?["funding_source_providers"] as? [String: Any],
                    let plaid = fundingSourceProviders["plaid"] as? [String: Any],
                    plaid["app_id_association"] != nil {
                    let jsonData = try JSONSerialization.data(withJSONObject: value)
                    let fundingSourceProvider = try decoder.decode(ClientApplicationConfiguration.self, from: jsonData)
                    clientApplicationConfiguration[key] = fundingSourceProvider
                }
            }
        }
        return clientApplicationConfiguration
    } catch {
        throw SudoVirtualCardsError.fatalError(description: "\(msg): JSON parsing failed: \(encodedData): \(error)")
    }
}
