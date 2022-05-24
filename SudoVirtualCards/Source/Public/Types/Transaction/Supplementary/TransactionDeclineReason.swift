//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public enum TransactionDeclineReason: Hashable {
    case insufficientFunds
    case suspicious
    case cardStopped
    case cardExpired
    case merchantBlocked
    case merchantCodeBlocked
    case merchantCountryBlocked
    case avsCheckFailed
    case cscCheckFailed
    case expiryCheckFailed
    case processingError
    case declined
    case velocityExceeded
    case currencyBlocked
    case fundingError
    case unknown(String)

    init(string: String) {
        switch string {
        case "INSUFFICIENT_FUNDS":
            self = .insufficientFunds
        case "SUSPICIOUS":
            self = .suspicious
        case "CARD_STOPPED":
            self = .cardStopped
        case "CARD_EXPIRED":
            self = .cardExpired
        case "MERCHANT_BLOCKED":
            self = .merchantBlocked
        case "MERCHANT_CODE_BLOCKED":
            self = .merchantCodeBlocked
        case "MERCHANT_COUNTRY_BLOCKED":
            self = .merchantCountryBlocked
        case "AVS_CHECK_FAILED":
            self = .avsCheckFailed
        case "CSC_CHECK_FAILED":
            self = .cscCheckFailed
        case "EXPIRY_CHECK_FAILED":
            self = .expiryCheckFailed
        case "PROCESSING_ERROR":
            self = .processingError
        case "DECLINED":
            self = .declined
        case "VELOCITY_EXCEEDED":
            self = .velocityExceeded
        case "CURRENCY_BLOCKED":
            self = .currencyBlocked
        case "FUNDING_ERROR":
            self = .fundingError
        default:
            self = .unknown(string)
        }
    }
}