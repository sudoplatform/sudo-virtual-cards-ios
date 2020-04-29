//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Internal protocol for Sealed Billing Addresses, used to allow for protocol conformance to GraphQL API.
protocol _SealedBillingAddress {

    /// Line 1 of the address.
    var addressLine1: SealedString { get set }

    /// Line 2 of the address. Optional.
    var addressLine2: SealedString? { get set }

    /// City of the address.
    var city: SealedString { get set }

    /// State of the address.
    var state: SealedString { get set }

    /// Postal code of the address.
    var postalCode: SealedString { get set }

    /// Country of the address.
    var country: SealedString { get set }
}

/// Struct implementation of `_SealedBillingAddress`. All fields are encrypted.
struct SealedBillingAddress: _SealedBillingAddress, Hashable {

    // MARK: - Properties

    var addressLine1: SealedString

    var addressLine2: SealedString?

    var city: SealedString

    var state: SealedString

    var postalCode: SealedString

    var country: SealedString

    // MARK: - Lifecycle

    /// Initialize a `SealedBillingAddress`.
    init(
        addressLine1: SealedString,
        addressLine2: SealedString? = nil,
        city: SealedString,
        state: SealedString,
        postalCode: SealedString,
        country: SealedString
    ) {
        self.addressLine1 = addressLine1
        self.addressLine2 = addressLine2
        self.city = city
        self.state = state
        self.postalCode = postalCode
        self.country = country
    }

    /// Initialize a `SealedBillingAddress` using a GraphQL API conforming object.
    init(_ object: _SealedBillingAddress) {
        self.addressLine1 = object.addressLine1
        self.addressLine2 = object.addressLine2
        self.city = object.city
        self.state = object.state
        self.postalCode = object.postalCode
        self.country = object.country
    }
}
