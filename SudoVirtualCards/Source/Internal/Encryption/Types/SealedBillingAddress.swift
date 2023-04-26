//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Internal protocol for Sealed Billing Addresses.
struct SealedBillingAddress: Hashable {

    var addressLine1: SealedString
    var addressLine2: SealedString?
    var city: SealedString
    var state: SealedString
    var postalCode: SealedString
    var country: SealedString

}

extension SealedBillingAddress {

    init(fragment: GraphQL.SealedAddressAttribute) {
        self.addressLine1 = fragment.addressLine1
        self.addressLine2 = fragment.addressLine2
        self.city = fragment.city
        self.state = fragment.state
        self.postalCode = fragment.postalCode
        self.country = fragment.country
    }

}
