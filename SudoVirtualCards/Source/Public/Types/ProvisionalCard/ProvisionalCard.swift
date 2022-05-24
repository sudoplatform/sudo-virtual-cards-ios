//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of a transitory item used in the creation of a `VirtualCard` on the back-end.
public struct ProvisionalCard: ProvisionalCardAttributes, ProvisionalCardSealedAttributes, Hashable {

    // MARK: - Properties

    public var id: String
    public var createdAt: Date
    public var updatedAt: Date
    public var clientRefId: String
    public var state: ProvisionalCardState
    public var card: VirtualCard?

    // MARK: - Lifecycle

    /// Initialize an instance of `ProvisionalCard`.
    public init(
        id: String,
        createdAt: Date,
        updatedAt: Date,
        clientRefId: String,
        state: ProvisionalCardState,
        card: VirtualCard? = nil
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.clientRefId = clientRefId
        self.state = state
        self.card = card
    }

    // TODO: Move
    /// Initialize an instance of `ProvisionalCard`.
    /// 
    /// For internal use when initializing from a GraphQL object.
    init(
        id: String,
        createdAtEpochMs: Double,
        updatedAtEpochMs: Double,
        clientRefId: String,
        provisioningState: GraphQL.ProvisioningState,
        card: VirtualCard? = nil
    ) {
        let createdAt = Date(millisecondsSince1970: createdAtEpochMs)
        let updatedAt = Date(millisecondsSince1970: updatedAtEpochMs)
        let state = ProvisionalCardState(provisioningState)
        self.init(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            clientRefId: clientRefId,
            state: state,
            card: card)
    }
}
