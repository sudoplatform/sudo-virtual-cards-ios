//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Billing Address of the card.
public struct VirtualCardBillingAddress: Hashable {

    // MARK: - Properties

    /// First line of the address.
    public var addressLine1: String

    /// Second line of the address.
    public var addressLine2: String?

    /// City of the address.
    public var city: String

    /// State of the address.
    public var state: String

    /// Postal code of the address.
    public var postalCode: String

    /// Country of the address.
    public var country: String

    // MARK: - Lifecycle

    /// Initialize an instance of `Card.BillingAddress`.
    public init(
        addressLine1: String,
        addressLine2: String? = nil,
        city: String,
        state: String,
        postalCode: String,
        country: String
    ) {
        self.addressLine1 = addressLine1
        self.addressLine2 = addressLine2
        self.city = city
        self.state = state
        self.postalCode = postalCode
        self.country = country
    }
}
