//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of a Virtual Card used in Platform SDK.
public struct VirtualCard: Hashable, VirtualCardAttributes, VirtualCardSealedAttributes {

    // MARK: - Properties

    public var id: String
    public var owners: [Owner]
    public var owner: String
    public var version: Int
    public var fundingSourceId: String
    public var state: VirtualCardState
    public var cardHolder: String
    @available(*, deprecated, message: "Please use metadata")
    public var alias: String?
    public var metadata: JSONValue?
    public var last4: String
    public var pan: String
    public var csc: String
    public var billingAddress: VirtualCardBillingAddress?
    public var expiry: VirtualCardExpiry
    public var currency: String
    public var activeTo: Date
    public var cancelledAt: Date?
    public var createdAt: Date
    public var updatedAt: Date
    public var lastTransaction: Transaction?

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
        alias: String?,
        last4: String,
        pan: String,
        csc: String,
        billingAddress: VirtualCardBillingAddress?,
        expiry: VirtualCardExpiry,
        currency: String,
        activeTo: Date,
        cancelledAt: Date? = nil,
        createdAt: Date,
        updatedAt: Date,
        lastTransaction: Transaction?,
        metadata: JSONValue?
    ) {
        self.id = id
        self.owners = owners
        self.owner = owner
        self.version = version
        self.fundingSourceId = fundingSourceId
        self.state = state
        self.cardHolder = cardHolder
        self.alias = alias
        self.last4 = last4
        self.pan = pan
        self.csc = csc
        self.billingAddress = billingAddress
        self.expiry = expiry
        self.currency = currency
        self.activeTo = activeTo
        self.cancelledAt = cancelledAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.lastTransaction = lastTransaction
        self.metadata = metadata
    }
}
