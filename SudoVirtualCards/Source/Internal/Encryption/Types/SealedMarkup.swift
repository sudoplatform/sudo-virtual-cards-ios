//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

struct SealedMarkup: Equatable {

    var percent: SealedInt
    var flat: SealedInt
    var minCharge: SealedInt?

}

extension SealedMarkup {

    init(_ fragment: GraphQL.SealedMarkupAttribute) {
        self.percent = fragment.percent
        self.flat = fragment.flat
        self.minCharge = fragment.minCharge
    }

}
