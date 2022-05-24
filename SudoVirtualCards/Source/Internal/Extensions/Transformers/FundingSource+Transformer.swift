//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

extension FundingSource {

    init(fragment: GraphQL.FundingSource) {
        self.id = fragment.id
        self.owner = fragment.owner
        self.version = fragment.version
        self.state = State(fragment.state)
        self.currency = fragment.currency
        self.last4 = fragment.last4
        self.network = Network(fragment.network)
        self.createdAt = Date(millisecondsSince1970: fragment.createdAtEpochMs)
        self.updatedAt = Date(millisecondsSince1970: fragment.updatedAtEpochMs)
    }
}
