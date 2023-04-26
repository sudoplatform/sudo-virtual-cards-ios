//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

extension PartialResult where P == PartialProvisionalCard {

    init(provisionalCard: GraphQL.ProvisionalCard, error: Error) {
        let state = ProvisionalCardState(provisionalCard.provisioningState)
        let createdAt = Date(millisecondsSince1970: provisionalCard.createdAtEpochMs)
        let updatedAt = Date(millisecondsSince1970: provisionalCard.updatedAtEpochMs)
        let partial = PartialProvisionalCard(
            id: provisionalCard.id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            clientRefId: provisionalCard.clientRefId,
            state: state
        )
        self.init(partial: partial, error: error)
    }

}
