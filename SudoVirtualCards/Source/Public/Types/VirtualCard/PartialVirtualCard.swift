//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of a Virtual Card without its unsealed attributes.
public struct PartialVirtualCard: Hashable, VirtualCardAttributes {

    // MARK: - Properties

    public var id: String
    public var owners: [Owner]
    public var owner: String
    public var version: Int
    public var fundingSourceId: String
    public var state: VirtualCardState
    public var cardHolder: String
    public var last4: String
    public var currency: String
    public var activeTo: Date
    public var cancelledAt: Date?
    public var createdAt: Date
    public var updatedAt: Date

    // MARK: - Lifecycle

    /// Initialize an instance of `VirtualCard`.
    public init(
        id: String,
        owners: [Owner],
        owner: String,
        version: Int,
        fundingSourceId: String,
        state: VirtualCardState,
        cardHolder: String,
        last4: String,
        currency: String,
        activeTo: Date,
        cancelledAt: Date? = nil,
        createdAt: Date,
        updatedAt: Date
    ) {
        self.id = id
        self.owners = owners
        self.owner = owner
        self.version = version
        self.fundingSourceId = fundingSourceId
        self.state = state
        self.cardHolder = cardHolder
        self.last4 = last4
        self.currency = currency
        self.activeTo = activeTo
        self.cancelledAt = cancelledAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
