//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Internal protocol for Sealed Expiries.
public struct SealedExpiry: Hashable {

    public var mm: String
    public var yyyy: String

}

extension SealedExpiry {

    init(fragment: GraphQL.SealedExpiryAttribute) {
        self.mm = fragment.mm
        self.yyyy = fragment.yyyy
    }

}
