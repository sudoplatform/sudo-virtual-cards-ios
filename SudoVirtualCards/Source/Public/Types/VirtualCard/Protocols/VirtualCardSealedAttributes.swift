//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
public protocol VirtualCardSealedAttributes {

    /// Owner of the card.
    var cardHolder: String { get set }

    /// User defined name associated with the card.
    @available(*, deprecated, message: "Please use metadata")
    var alias: String? { get set }

    /// Custom metadata to associate with the virtual card. Can be used for values such as card aliases, card colors, image references, etc.
    var metadata: JSONValue? { get set }

    /// Primary Account Number.
    var pan: String { get set }

    /// Card Security Code.
    var csc: String { get set }

    /// Billing address associated with the card.
    /// If billing address is `nil`, the default billing address will be used.
    var billingAddress: VirtualCardBillingAddress? { get set }

    /// Expiry of the card.
    var expiry: VirtualCardExpiry { get set }

    var lastTransaction: Transaction? { get set}
}
