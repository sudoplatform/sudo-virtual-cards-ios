//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Representation of a Mailing/Street Address used in Platform SDK.
public struct Address: Equatable {

    // MARK: - Properties

    /// First line of the address.
    public let addressLine1: String

    /// Second line of the address.
    public let addressLine2: String?

    /// City of the address.
    public let city: String

    /// State of the address.
    public let state: String

    /// Postal code of the address.
    public let postalCode: String

    /// Country of the address.
    public let country: String

    // MARK: - Lifecycle

    /// Initialize an instance of `Address`.
    public init(addressLine1: String, addressLine2: String? = nil, city: String, state: String, postalCode: String, country: String) {
        self.addressLine1 = addressLine1
        self.addressLine2 = addressLine2
        self.city = city
        self.state = state
        self.postalCode = postalCode
        self.country = country
    }
}
