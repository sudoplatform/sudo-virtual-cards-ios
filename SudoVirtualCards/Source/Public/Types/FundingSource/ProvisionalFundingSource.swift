//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public enum ProvisioningData: Equatable, FundingSourceProviderData {
    public static func == (lhs: ProvisioningData, rhs: ProvisioningData) -> Bool {
        switch lhs {
        case .stripeCard(let lhsData):
            switch rhs {
            case .stripeCard(let rhsData): return lhsData == rhsData
            default: return false
            }
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

    case stripeCard(StripeCardProvisioningData)
    case checkoutCard(CheckoutCardProvisioningData)
    case checkoutBankAccount(CheckoutBankAccountProvisioningData)
    case unknown(any FundingSourceProviderData)

    public var provider: String {
        switch self {
        case .stripeCard(let data):
            return data.provider
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
        case .stripeCard(let data):
            return data.type
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
        case .stripeCard(let data):
            return data.version
        case .checkoutCard(let data):
            return data.version
        case .checkoutBankAccount(let data):
            return data.version
        case .unknown(let data):
            return data.version
        }
    }
}

/// The Sudo Platform SDK representation of a funding source.
public struct ProvisionalFundingSource: Equatable {

    // MARK: - Properties

    /// Unique identifier of the funding source.
    public let id: String

    /// Identifier of the user that owns the funding source.
    public let owner: String

    /// Version of this entity.
    public let version: Int

    /// Sate of this entity
    public let state: ProvisionalFundingSourceState

    /// Type of this funding source
    public let type: FundingSourceType

    /// Last 4 digits of the funding source account
    public let last4: String

    /// Date when the funding source was created.
    public let createdAt: Date

    /// Date when the funding source was last updated.
    public let updatedAt: Date

    /// The data for provisioning the funding source.
    public let provisioningData: ProvisioningData

    // MARK: - Lifecycle

    public init(
        id: String,
        owner: String,
        version: Int,
        state: ProvisionalFundingSourceState,
        type: FundingSourceType,
        last4: String,
        createdAt: Date,
        updatedAt: Date,
        provisioningData: ProvisioningData
    ) {
        self.id = id
        self.owner = owner
        self.version = version
        self.state = state
        self.type = type
        self.last4 = last4
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.provisioningData = provisioningData
    }

}
