//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoLogging

extension ProvisioningData {
    init(
        encodedProvisioningData: String,
        decoder: JSONDecoder = JSONDecoder(),
        logger: Logger = Logger.virtualCardsSDKLogger
    ) throws {

        guard let encodedProvisioningData = Data(base64Encoded: encodedProvisioningData) else {
            logger.error("Data received for ProvisionalFundingSource is not base64 encoded")
            throw SudoVirtualCardsError.internalError("Data received for ProvisionalFundingSource is not base64 encoded")
        }
        let baseProvisioningData = try decoder.decode(BaseProvisioningData.self, from: encodedProvisioningData)

        let provisioningData: ProvisioningData
        if baseProvisioningData.provider == "stripe" && baseProvisioningData.type == .creditCard && baseProvisioningData.version == 1 {
            let data = try decoder.decode(StripeCardProvisioningData.self, from: encodedProvisioningData)

            provisioningData = .stripeCard(data)
        } else if baseProvisioningData.provider == "checkout" && baseProvisioningData.type == .creditCard && baseProvisioningData.version == 1 {
            let checkoutCardData = try decoder.decode(CheckoutCardProvisioningData.self, from: encodedProvisioningData)

            provisioningData = .checkoutCard(checkoutCardData)
        } else if baseProvisioningData.provider == "checkout" && baseProvisioningData.type == .bankAccount &&
            baseProvisioningData.version == 1 {
            let checkoutBankAccountData = try decoder.decode(CheckoutBankAccountProvisioningData.self, from:
                encodedProvisioningData)

            provisioningData = .checkoutBankAccount(checkoutBankAccountData)
        } else {
            provisioningData = .unknown(baseProvisioningData)
        }
        self = provisioningData
    }
}
