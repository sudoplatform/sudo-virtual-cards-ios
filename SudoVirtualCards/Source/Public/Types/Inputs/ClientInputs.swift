//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Input object for a Provision Card operation, using `SudoVirtualCardsClient`.
public struct ProvisionCardInput: Equatable {

    // MARK: - Properties

    /// identifier of the funding source to use to fund the provisioned virtual card.
    public let fundingSourceId: String

    /// Name of the card holder.
    public let cardHolder: String

    /// Associated pseudonym of the user.
    public let alias: String

    /// Address used as the billing address of the card.
    /// If billing address is `nil`, the default billing address will be used.
    public let billingAddress: Address?

    /// Currency to provision the card with.
    public let currency: String
    
    /// Proof of Sudo ownership for provisioning cards. The ownership proof must
    /// contain an audience of "sudoplatform.virtual-cards.virtual-card" and can be
    /// obtained from SudoProfiles SDK via getOwnershipProof API.
    public let ownershipProof: String

    // MARK: - Lifecycle

    /// Initialize an instance of `ProvisionCardInput`.
    public init(
        fundingSourceId: String,
        cardHolder: String,
        alias: String,
        billingAddress: Address?,
        currency: String,
        ownershipProof: String
    ) {
        self.fundingSourceId = fundingSourceId
        self.cardHolder = cardHolder
        self.alias = alias
        self.billingAddress = billingAddress
        self.currency = currency
        self.ownershipProof = ownershipProof
    }
}

/// Input object for a Update Card operation, using `SudoVirtualCardsClient`.
public struct UpdateCardInput: Equatable {

    // MARK: - Properties

    /// Id of the card.
    public let id: String

    /// Name of the card holder.
    public let cardHolder: String

    /// Associated pseudonym of the user.
    public let alias: String

    /// Address used as the billing address of the card.
    public let billingAddress: Address?

    // MARK: - Lifecycle

    /// Initialize an instance of `UpdateCardInput`.
    public init(id: String, cardHolder: String, alias: String, billingAddress: Address?) {
        self.id = id
        self.cardHolder = cardHolder
        self.alias = alias
        self.billingAddress = billingAddress
    }
}

/// Input object holding the information required for a create Credit Card funding source request.
public struct CreditCardFundingSourceInput: Equatable {

    // MARK: - Properties

    /// Card account number.
    public var cardNumber: String

    /// Required expiration month value.
    public var expirationMonth: Int

    /// Required expiration year value.
    public var expirationYear: Int

    /// Rwquired 3 or 4 digit security code from the back of the card.
    public var securityCode: String

    /// Required street address field for the cardholders legal residence.
    public var address: String

    /// Optional unit number field for the cardholders legal residence.
    public var unitNumber: String?

    /// Required city the address resides in.
    public var city: String

    /// Required state that the city resides in.
    public var state: String

    /// Required postal code for the cardholders legal residence.
    public var postalCode: String

    /// The ISO2 country code the address resides in.
    public var country: String

    // MARK: - Lifecycle

    /// Initialize an instance of `CreditCardFundingSourceInput`.
    public init(
        cardNumber: String,
        expirationMonth: Int,
        expirationYear: Int,
        securityCode: String,
        address: String,
        unitNumber: String?,
        city: String,
        state: String,
        postalCode: String,
        country: String
    ) {
        self.cardNumber = cardNumber
        self.expirationMonth = expirationMonth
        self.expirationYear = expirationYear
        self.securityCode = securityCode
        self.address = address
        self.unitNumber = unitNumber
        self.city = city
        self.state = state
        self.postalCode = postalCode
        self.country = country
    }
}
