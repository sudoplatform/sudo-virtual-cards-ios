//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
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
        case .unknown: return false
        }
    }

    case stripeCard(StripeCardProvisioningData)
    case checkoutCard(CheckoutCardProvisioningData)
    case unknown(any FundingSourceProviderData)

    public var provider: String {
        switch self {
        case .stripeCard(let data):
            return data.provider
        case .checkoutCard(let data):
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
        case .unknown(let data):
            return data.version
        }
    }
}

/// The Sudo Platform SDK representation of a funding source.
public struct ProvisionalFundingSource: Equatable {

    // MARK: - Supplementary

    /// The Sudo Platform SDK representation of an enumeration depicting the provisional funding source state.
    public enum State {
        case completed
        case failed
        case pending
        case provisioning
    }

    // MARK: - Properties

    /// Unique identifier of the funding source.
    public let id: String

    /// Identifier of the user that owns the funding source.
    public let owner: String

    /// Version of this entity.
    public let version: Int

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
        createdAt: Date,
        updatedAt: Date,
        provisioningData: ProvisioningData
    ) {
        self.id = id
        self.owner = owner
        self.version = version
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.provisioningData = provisioningData
    }

}
