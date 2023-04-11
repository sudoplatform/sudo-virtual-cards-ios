//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Data returned as part of fundingSourceRequiresUserInteraction thrown when completeFundingSource or refreshFundingSource
/// are called but requires further user interaction. The data contains funding source provider specific information
/// required to carry out that user interfaction.
///
/// *Values*
/// - checkoutCard - data for Checkout Card funding sources
/// - checkoutBankAccount - data for Checkout Bank Account funding sources
/// - unknown - data for a funding source type not yet supported by this SDK. Update your SDK version to resolve.
/// 
public enum FundingSourceInteractionData: Equatable, FundingSourceProviderData {
    public static func == (lhs: FundingSourceInteractionData, rhs: FundingSourceInteractionData) -> Bool {
        switch lhs {
        case .checkoutCard(let lhsData):
            switch rhs {
            case .checkoutCard(let rhsData): return lhsData == rhsData
            default: return false
            }
        case .checkoutBankAccount(let lhsData):
            switch rhs {
            case .checkoutBankAccount(let rhsData): return lhsData == rhsData
            default: return false
            }
        case .unknown: return false
        }
    }

    case checkoutCard(CheckoutCardInteractionData)
    case checkoutBankAccount(CheckoutBankAccountRefreshInteractionData)
    case unknown(any FundingSourceProviderData)

    public var provider: String {
        switch self {
        case .checkoutCard(let data):
            return data.provider
        case .checkoutBankAccount(let data):
            return data.provider
        case .unknown(let data):
            return data.provider
        }
    }

    public var type: FundingSourceType {
        switch self {
        case .checkoutCard(let data):
            return data.type
        case .checkoutBankAccount(let data):
            return data.type
        case .unknown(let data):
            return data.type
        }
    }

    public var version: Int {
        switch self {
        case .checkoutCard(let data):
            return data.version
        case .checkoutBankAccount(let data):
            return data.version
        case .unknown(let data):
            return data.version
        }
    }
}
