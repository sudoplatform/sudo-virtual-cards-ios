//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Input object for a Update Card operation, using `SudoVirtualCardsClient`.
public struct UpdateVirtualCardInput: Equatable {

    // MARK: - Properties

    /// Id of the card.
    public let id: String

    /// Version of card to update. If specified, version must match existing version of card.
    public let expectedCardVersion: Int?

    /// Name of the card holder.
    public let cardHolder: String

    /// Address used as the billing address of the card.
    public let billingAddress: Nullish<Address>

    /// Custom metadata to associate with the virtual card. Can be used for values such as card aliases, card colors, image references, etc.
    ///
    /// There is a limit of 3k characters when data is serialized.
    public let metadata: Nullish<JSONValue>

    /// Associated pseudonym of the user.
    @available(*, deprecated, message: "Please use metadata to store and retrieve alias instead")
    public let alias: Nullish<String>

    // MARK: - Lifecycle

    /// Initialize an instance of `UpdateVirtualCardInput`.
    public init(id: String, expectedCardVersion: Int? = nil, cardHolder: String, billingAddress: Nullish<Address> = nil, metadata: Nullish<JSONValue> = nil) {
        self.id = id
        self.expectedCardVersion = expectedCardVersion
        self.cardHolder = cardHolder
        self.billingAddress = billingAddress
        self.metadata = metadata
        self.alias = nil
    }

    @available(*, deprecated, message: "Please use metadata to store and retrieve alias instead")
    public init(
        id: String,
        expectedCardVersion: Int? = nil,
        cardHolder: String,
        billingAddress: Nullish<Address> = nil,
        metadata: Nullish<JSONValue> = nil,
        alias: Nullish<String> = nil
    ) {
        self.id = id
        self.expectedCardVersion = expectedCardVersion
        self.cardHolder = cardHolder
        self.billingAddress = billingAddress
        self.metadata = metadata
        self.alias = alias
    }

}
