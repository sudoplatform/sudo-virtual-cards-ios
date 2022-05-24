//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Input object for a Provision Card operation, using `SudoVirtualCardsClient`.
public struct ProvisionVirtualCardInput: Equatable {

    // MARK: - Properties

    /// identifier of the funding source to use to fund the provisioned virtual card.
    public let fundingSourceId: String

    /// Name of the card holder.
    public let cardHolder: String

    /// Address used as the billing address of the card.
    /// If billing address is `nil`, the default billing address will be used.
    public let billingAddress: Address?

    /// Currency to provision the card with.
    public let currency: String

    /// Proof of Sudo ownership for provisioning cards. The ownership proof must
    /// contain an audience of "sudoplatform.virtual-cards.virtual-card" and can be
    /// obtained from SudoProfiles SDK via getOwnershipProof API.
    public let ownershipProof: String

    /// Custom metadata to associate with the virtual card. Can be used for values such as card aliases, card colors, image references, etc.
    ///
    /// There is a limit of 3k characters when data is serialized.
    public let metadata: JSONValue?

    /// Associated pseudonym of the user.
    @available(*, deprecated, message: "Please use metadata to store and retrieve alias instead")
    public let alias: String?

    // MARK: - Lifecycle

    /// Initialize an instance of `ProvisionCardInput`.
    public init(
        fundingSourceId: String,
        cardHolder: String,
        billingAddress: Address?,
        currency: String,
        ownershipProof: String,
        metadata: JSONValue? = nil
    ) {
        self.fundingSourceId = fundingSourceId
        self.cardHolder = cardHolder
        self.billingAddress = billingAddress
        self.currency = currency
        self.ownershipProof = ownershipProof
        self.metadata = metadata
        self.alias = nil
    }

    @available(*, deprecated, message: "Please use metadata to store and retrieve alias instead")
    public init(
        fundingSourceId: String,
        cardHolder: String,
        billingAddress: Address?,
        currency: String,
        ownershipProof: String,
        metadata: JSONValue? = nil,
        alias: String? = nil
    ) {
        self.fundingSourceId = fundingSourceId
        self.cardHolder = cardHolder
        self.billingAddress = billingAddress
        self.currency = currency
        self.ownershipProof = ownershipProof
        self.metadata = metadata
        self.alias = alias
    }

}
