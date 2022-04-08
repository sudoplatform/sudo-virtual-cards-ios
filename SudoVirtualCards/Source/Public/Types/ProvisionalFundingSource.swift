//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// The Sudo Platform SDK representation of an enumeration depicting the provisional funding source state reason.
public enum StateReason {
    case admin
    case deletion
    case entitlement
    case locked
    case processing
    case suspicious
    case unknown
    case unlocked
    case user
}

/// Provisioning Data for Stripe Provisional Funding Source.
public struct StripeProvisioningData: Equatable {

    // MARK: - Properties

    /// Version of the provisioning data.
    public let version: Int

    /// Client secret used to call stripe setup intent.
    public let clientSecret: String

    /// Intent of setup data.
    public let intent: String

    /// Provider of the provisioning data.
    public let provider: String = "stripe"

    // MARK: - Lifecycle

    public init(version: Int, clientSecret: String, intent: String) {
        self.version = version
        self.clientSecret = clientSecret
        self.intent = intent
    }
}

public typealias ProvisioningData = StripeProvisioningData

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
