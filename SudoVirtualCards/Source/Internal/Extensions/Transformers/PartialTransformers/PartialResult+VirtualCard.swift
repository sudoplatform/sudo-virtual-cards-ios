//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

extension PartialResult where P == PartialVirtualCard {

    init(card: GraphQL.SealedCardWithLastTransaction, error: Error) {
        let owners = card.owners.map { Owner(id: $0.id, issuer: $0.issuer) }
        let state = VirtualCardState(card.state)
        let createdAt = Date(millisecondsSince1970: card.createdAtEpochMs)
        let updatedAt = Date(millisecondsSince1970: card.updatedAtEpochMs)
        let activeTo = Date(millisecondsSince1970: card.activeToEpochMs)
        var cancelledAt: Date?
        if let cancelledAtEpochMs = card.cancelledAtEpochMs {
            cancelledAt = Date(millisecondsSince1970: cancelledAtEpochMs)
        }
        let partial = PartialVirtualCard(
            id: card.id,
            owners: owners,
            owner: card.owner,
            version: card.version,
            fundingSourceId: card.fundingSourceId,
            state: state,
            cardHolder: card.cardHolder,
            last4: card.last4,
            currency: card.currency,
            activeTo: activeTo,
            cancelledAt: cancelledAt,
            createdAt: createdAt,
            updatedAt: updatedAt
        )
        self.init(partial: partial, error: error)
    }

}
