//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// swiftlint:disable function_parameter_count

import Foundation

/// Errors thrown while attempting to decrypt and decode resources.
/// - keyNotFound: Key in input does not match any keys on keychain.
/// - symmetricKeyMissing: Decoded base64 data does not conain a symmetric key.
/// - dataDecodingFailed: Failed to decode the data while unsealing.
/// - unsupportedAlgorithm: Unsupported algorithm.
enum UnsealingError: Error, Equatable {
    case keyNotFound
    case symmetricKeyMissing
    case dataNotUTF8Encoded
    case dataDecodingFailed
    case unsupportedAlgorithm(String)
}

/// Works in conjunction with `DecryptionWorker` to unseal any attributes incoming from GraphQL API.
protocol Unsealer: AnyObject {
    // MARK: - Lifecycle

    /// Initialize an instance of `Unsealer`.
    init(platformKeyManager: PlatformKeyManager)

    // MARK: - Methods: Unseal Cards

    /// Attempt to unseal a card received from  GraphQL.
    ///
    /// Returns: Card that is unsealed using the input `card`'s `keyId`.
    /// Throws:
    ///     - UnsealingError.
    ///     - KeyManagerError.
    func unseal(_ card: GraphQL.SealedCardWithLastTransaction) throws -> VirtualCard

    /// Attempt to unseal a card received from GraphQL.
    ///
    /// Returns: Card that is unsealed using the input `card`'s `keyId`.
    /// Throws:
    ///     - UnsealingError.
    ///     - KeyManagerError.
    func unseal(_ card: GraphQL.SealedCard) throws -> VirtualCard

    // MARK: - Methods: Unseal Transactions

    /// Attempt to unseal a transaction received from a `GraphQL.GetTransactionQuery`.
    ///
    /// Returns: Transaction that is unsealed using the input `transaction`'s `keyId`.
    /// Throws:
    ///     - UnsealingError.
    ///     - KeyManagerError.
    func unseal(_ transaction: GraphQL.SealedTransaction) throws -> Transaction

    /// Attempt to unseal a bank account funding source received from a `GraphQL.*FundingSource` query or mutation.
    ///
    /// Returns: BankAccount funding source that is unsealed using contained keyIds as required.
    /// Throws:
    ///     - UnsealingError.
    ///     - KeyManagerError.
    func unseal(_ fundingSource: GraphQL.BankAccountFundingSource) throws -> BankAccountFundingSource

    /// Attempt to unseal a sealedAttribute
    ///
    /// Returns: String value that is unsealed using contained keyIds as required
    /// Throws:
    ///     - `UnsealingError.dataDecodingFailed`:
    ///         - If the decrypted data cannot be decoded to a string.
    ///     - `KeyManagerError` if the data cannot be decrypted.
    func unseal(_ attribute: GraphQL.SealedAttribute) throws -> String
}

/// Unseals various resources received from the Virtual Cards Service.
class DefaultUnsealer: Unsealer {
    // MARK: - Supplementary

    /// Unowned instance of `PlatformKeyManager` used to lookup if key exists on input.
    private unowned let platformKeyManager: PlatformKeyManager

    /// Utility worker than can unseal properties.
    private let worker: DecryptionWorker

    private let decoder: JSONDecoder = JSONDecoder()

    // MARK: - Lifecycle

    required init(platformKeyManager: PlatformKeyManager) {
        self.platformKeyManager = platformKeyManager
        self.worker = DefaultDecryptionWorker(platformKeyManager: platformKeyManager)
    }

    init(platformKeyManager: PlatformKeyManager, worker: DecryptionWorker) {
        self.platformKeyManager = platformKeyManager
        self.worker = worker
    }

    // MARK: - Conformance: Unsealer

    func unseal(_ card: GraphQL.SealedCardWithLastTransaction) throws -> VirtualCard {
        var unsealedCard = try unseal(card.fragments.sealedCard)

        if let gqlLastTransaction = card.lastTransaction?.fragments.sealedTransaction {
            unsealedCard.lastTransaction = try unseal(gqlLastTransaction)
        }
        return unsealedCard
    }

    func unseal(_ card: GraphQL.SealedCard) throws -> VirtualCard {
        let state = VirtualCardState(card.state)
        let billingAddress: SealedBillingAddress?
        if let address = card.billingAddress?.fragments.sealedAddressAttribute {
            billingAddress = SealedBillingAddress(fragment: address)
        } else {
            billingAddress = nil
        }
        let expiry = SealedExpiry(fragment: card.expiry.fragments.sealedExpiryAttribute)
        let activeTo = Date(millisecondsSince1970: card.activeToEpochMs)
        var cancelledAt: Date?
        if let cancelledAtEpochMs = card.cancelledAtEpochMs {
            cancelledAt = Date(millisecondsSince1970: cancelledAtEpochMs)
        }
        let createdAt = Date(millisecondsSince1970: card.createdAtEpochMs)
        let updatedAt = Date(millisecondsSince1970: card.updatedAtEpochMs)
        let owners = card.owners.map { Owner(id: $0.id, issuer: $0.issuer) }

        var metadata: JSONValue?
        if let md = card.metadata?.fragments.sealedAttribute {
            metadata = try unseal(metadata: md)
        }

        let keyInfo = KeyInfo(keyId: card.keyId, keyType: .privateKey, algorithm: card.algorithm)

        return try unsealCard(
            id: card.id,
            owner: card.owner,
            owners: owners,
            version: card.version,
            createdAt: createdAt,
            updatedAt: updatedAt,
            fundingSourceId: card.fundingSourceId,
            currency: card.currency,
            state: state,
            activeTo: activeTo,
            cancelledAt: cancelledAt,
            last4: card.last4,
            lastTransaction: nil,
            metadata: metadata,
            alias: card.alias,
            cardHolder: card.cardHolder,
            pan: card.pan,
            csc: card.csc,
            billingAddress: billingAddress,
            expiry: expiry,
            withKeyInfo: keyInfo
        )
    }

    func unseal(_ transaction: GraphQL.SealedTransaction) throws -> Transaction {
        let type = TransactionType(type: transaction.type)
        let createdAt = Date(millisecondsSince1970: transaction.createdAtEpochMs)
        let updatedAt = Date(millisecondsSince1970: transaction.updatedAtEpochMs)
        let sortDate = Date(millisecondsSince1970: transaction.sortDateEpochMs)
        let billedAmount = SealedCurrencyAmount(transaction.billedAmount.fragments.sealedCurrencyAmountAttribute)
        let transactedAmount = SealedCurrencyAmount(transaction.transactedAmount.fragments.sealedCurrencyAmountAttribute)
        var detail: [SealedTransactionDetailChargeAttribute] = []
        if let gqlDetail = transaction.detail {
            detail = gqlDetail.map {
                return SealedTransactionDetailChargeAttribute($0.fragments.sealedTransactionDetailChargeAttribute)
            }
        }

        let keyInfo = KeyInfo(keyId: transaction.keyId, keyType: .privateKey, algorithm: transaction.algorithm)

        return try unsealTransaction(
            id: transaction.id,
            cardId: transaction.cardId,
            sequenceId: transaction.sequenceId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            sortDate: sortDate,
            type: type,
            transactedAEpochMs: transaction.transactedAtEpochMs,
            settledAtEpochMs: transaction.settledAtEpochMs,
            billedAmount: billedAmount,
            transactedAmount: transactedAmount,
            description: transaction.description,
            declineReason: transaction.declineReason,
            detail: detail,
            withKeyInfo: keyInfo
        )
    }

    func unseal(_ fundingSource: GraphQL.BankAccountFundingSource) throws -> BankAccountFundingSource {
        let institutionName = try unseal(fundingSource.institutionName.fragments.sealedAttribute)
        let optionalLogo = try fundingSource.institutionLogo.map { try unseal(institutionLogo: $0.fragments.sealedAttribute) }

        return BankAccountFundingSource(
            id: fundingSource.id,
            owner: fundingSource.owner,
            version: fundingSource.version,
            createdAt: Date(millisecondsSince1970: fundingSource.createdAtEpochMs),
            updatedAt: Date(millisecondsSince1970: fundingSource.updatedAtEpochMs),
            state: FundingSourceState(fundingSource.state),
            currency: fundingSource.currency,
            transactionVelocity: TransactionVelocity(
                maximum: fundingSource.transactionVelocity?.maximum,
                velocity: fundingSource.transactionVelocity?.velocity
            ),
            last4: fundingSource.last4,
            bankAccountType: BankAccountType(fundingSource.bankAccountType),
            institutionName: institutionName,
            institutionLogo: optionalLogo
        )
    }

    func unseal(_ attribute: GraphQL.SealedAttribute) throws -> String {
        let unsealed = try worker.unsealString(
            attribute.base64EncodedSealedData,
            withKeyInfo: .init(
                keyId: attribute.keyId,
                keyType: .privateKey,
                algorithm: attribute.algorithm
            )
        )
        return unsealed
    }

    // MARK: - Helpers: Decrypting Resources

    /// Unseal a card, using its `keyId`.
    ///
    /// Attributes that are sealed and will be unsealed are: [`cardHolder`, `alias`, `metadata`,`` `pan`, `csc`, `billingAddress`, `expiry`].
    ///
    /// - Parameter id: Id of the card. NOT SEALED.
    /// - Parameter owner: Owner of the card. NOT SEALED.
    /// - Parameter owners: List of owners of the card. NOT SEALED.
    /// - Parameter version: Version of the card. NOT SEALED.
    /// - Parameter createdAt: Created date of the card. NOT SEALED.
    /// - Parameter updatedAt: Updated date of the card. NOT SEALED.
    /// - Parameter fundingSourceId: Funding source id of the card. NOT SEALED.
    /// - Parameter currency: Currency ISO code of the card. NOT SEALED.
    /// - Parameter state: State of the card. NOT SEALED.
    /// - Parameter activeTo: Active to date of the card. NOT SEALED.
    /// - Parameter cancelledAt: Cancelled at date of the card. NOT SEALED.
    /// - Parameter last4: Last 4 digits on the card. NOT SEALED.
    /// - Parameter cardHolder: Card holder name to be unsealed.
    /// - Parameter alias: Alias associated with the card to be unsealed.
    /// - Parameter metadata: Metadata associated with the card to be unsealed.
    /// - Parameter pan: Primary account number of the card to be unsealed.
    /// - Parameter csc: Card security code of the card to be unsealed.
    /// - Parameter billingAddress: Billing address of the card to be unsealed.
    /// - Parameter expiry: Expiry of the card to be unsealed.
    /// - Parameter keyId: Key Id used to unseal the card attributes that are sealed.
    /// - Parameter algorithm: Algorithm in plain text to use to decrypt the AES key.
    func unsealCard(
        id: String,
        owner: String,
        owners: [Owner],
        version: Int,
        createdAt: Date,
        updatedAt: Date,
        fundingSourceId: String,
        currency: String,
        state: VirtualCardState,
        activeTo: Date,
        cancelledAt: Date?,
        last4: String,
        lastTransaction: Transaction?,
        metadata: JSONValue?,
        alias: SealedString?,
        cardHolder: SealedString,
        pan: SealedString,
        csc: SealedString,
        billingAddress: SealedBillingAddress?,
        expiry: SealedExpiry,
        withKeyInfo keyInfo: KeyInfo
    ) throws -> VirtualCard {
        let cardHolder = try worker.unsealString(cardHolder, withKeyInfo: keyInfo)
        let pan = try worker.unsealString(pan, withKeyInfo: keyInfo)
        let csc = try worker.unsealString(csc, withKeyInfo: keyInfo)
        var optionalAlias: String?
        if let alias = alias {
            optionalAlias = try worker.unsealString(alias, withKeyInfo: keyInfo)
        }
        let optionalBillingAddress: VirtualCardBillingAddress?
        if let billingAddress = billingAddress {
            optionalBillingAddress = try unsealBillingAddress(billingAddress, withKeyInfo: keyInfo)
        } else {
            optionalBillingAddress = nil
        }
        let expiry = try unsealExpiry(expiry, withKeyInfo: keyInfo)
        return VirtualCard(
            id: id,
            owners: owners,
            owner: owner,
            version: version,
            fundingSourceId: fundingSourceId,
            state: state,
            cardHolder: cardHolder,
            alias: optionalAlias,
            last4: last4,
            pan: pan,
            csc: csc,
            billingAddress: optionalBillingAddress,
            expiry: expiry,
            currency: currency,
            activeTo: activeTo,
            cancelledAt: cancelledAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            lastTransaction: lastTransaction,
            metadata: metadata
        )
    }

    /// Unseal a transaction, using its `keyId`.
    ///
    /// Attributes that are sealed and will be unsealed are: [`transactedAEpochMs`, `billedAmount`, `transactedAmount`, `description`, `declineReason`].
    ///
    /// - Parameter id: Id of the transaction. NOT SEALED.
    /// - Parameter cardId: Card Id of the transaction. NOT SEALED.
    /// - Parameter sequenceId: sequence ID of the transaction. NOT SEALED.
    /// - Parameter createdAt: Created date of the transaction. NOT SEALED.
    /// - Parameter updatedAt: Updated date of the transaction. NOT SEALED.
    /// - Parameter type: Type of the transaction. NOT SEALED.
    /// - Parameter transactedAEpochMs: Transaction time in milliseconds to be unsealed.
    /// - Parameter transactedAEpochMs: Settled at time in milliseconds to be unsealed.
    /// - Parameter billedAmount: Amount that is billed to be unsealed.
    /// - Parameter transactedAmount: Amount that is transacted to be unsealed.
    /// - Parameter description: Description of the transaction to be unsealed.
    /// - Parameter declineReason: Optional decline reason of the transaction to be unsealed.
    /// - Parameter keyId: Key Id used to unseal the transaction attributes that are sealed.
    /// - Parameter algorithm: Algorithm in plain text to use to decrypt the AES key.
    func unsealTransaction(
        id: String,
        cardId: String,
        sequenceId: String,
        createdAt: Date,
        updatedAt: Date,
        sortDate: Date,
        type: TransactionType,
        transactedAEpochMs: SealedDate,
        settledAtEpochMs: SealedDate?,
        billedAmount: SealedCurrencyAmount,
        transactedAmount: SealedCurrencyAmount,
        description: SealedString,
        declineReason: SealedString?,
        detail: [SealedTransactionDetailChargeAttribute],
        withKeyInfo keyInfo: KeyInfo
    ) throws -> Transaction {
        let transactedAt = try worker.unsealDate(transactedAEpochMs, withKeyInfo: keyInfo)
        let billedAmount = try unsealCurrencyAmount(billedAmount, withKeyInfo: keyInfo)
        let transactedAmount = try unsealCurrencyAmount(transactedAmount, withKeyInfo: keyInfo)
        let description = try worker.unsealString(description, withKeyInfo: keyInfo)
        let optionalDeclineReason: TransactionDeclineReason?
        if let declineReason = declineReason {
            let declineReasonString = try worker.unsealString(declineReason, withKeyInfo: keyInfo)
            optionalDeclineReason = TransactionDeclineReason(string: declineReasonString)
        } else {
            optionalDeclineReason = nil
        }
        var settledAt: Date?
        if let settledAtEpochMs = settledAtEpochMs {
            settledAt = try worker.unsealDate(settledAtEpochMs, withKeyInfo: keyInfo)
        }

        let detail = try detail.map {
            try unsealTransactionDetailChargeAttribute(
                $0,
                withKeyInfo: keyInfo
            )
        }
        return Transaction(
            id: id,
            cardId: cardId,
            sequenceId: sequenceId,
            type: type,
            sortDate: sortDate,
            transactedAt: transactedAt,
            settledAt: settledAt,
            billedAmount: billedAmount,
            transactedAmount: transactedAmount,
            description: description,
            declineReason: optionalDeclineReason,
            detail: detail,
            createdAt: createdAt,
            updatedAt: updatedAt
        )
    }

    /// Unseal a sealed currency amount property.
    ///
    /// - Parameter currencyAmount: Encrypted currency amount value as a string to be decrypted.
    /// - Parameter keyId: Key Id to be used to access the stored key and decrypt the data with.
    /// - Parameter algorithm: Algorithm in plain text to use to decrypt the AES key.
    /// - Throws:
    ///     - `UnsealingError.dataDecodingFailed`:
    ///         - If the input data cannot be encoded to a base 64 data object.
    ///         - If The decrypted data cannot be decoded to a string.
    ///     - `KeyManagerError` if the data cannot be decrypted.
    func unsealCurrencyAmount(_ currencyAmount: SealedCurrencyAmount, withKeyInfo keyInfo: KeyInfo) throws -> CurrencyAmount {
        let currency = try worker.unsealString(currencyAmount.currency, withKeyInfo: keyInfo)
        let amount = try worker.unsealInt(currencyAmount.amount, withKeyInfo: keyInfo)
        return CurrencyAmount(currency: currency, amount: amount)
    }

    /// Unseal a billing address property.
    ///
    /// - Parameter billingAddress: Encrypted billing address to be decrypted.
    /// - Parameter keyId: Key Id to be used to access the stored key and decrypt the data with.
    /// - Parameter algorithm: Algorithm in plain text to use to decrypt the AES key.
    /// - Throws:
    ///     - `UnsealingError.dataDecodingFailed`:
    ///         - If the input data cannot be encoded to a base 64 data object.
    ///         - If The decrypted data cannot be decoded to a string.
    ///     - `KeyManagerError` if the data cannot be decrypted.
    func unsealBillingAddress(_ billingAddress: SealedBillingAddress, withKeyInfo keyInfo: KeyInfo) throws -> VirtualCardBillingAddress {
        let addressLine1 = try worker.unsealString(billingAddress.addressLine1, withKeyInfo: keyInfo)
        let addressLine2: String?
        if let al2 = billingAddress.addressLine2 {
            addressLine2 = try worker.unsealString(al2, withKeyInfo: keyInfo)
        } else {
            addressLine2 = nil
        }
        let city = try worker.unsealString(billingAddress.city, withKeyInfo: keyInfo)
        let state = try worker.unsealString(billingAddress.state, withKeyInfo: keyInfo)
        let postalCode = try worker.unsealString(billingAddress.postalCode, withKeyInfo: keyInfo)
        let country = try worker.unsealString(billingAddress.country, withKeyInfo: keyInfo)

        return VirtualCardBillingAddress(
            addressLine1: addressLine1,
            addressLine2: addressLine2,
            city: city,
            state: state,
            postalCode: postalCode,
            country: country
        )
    }

    /// Unseal a expiry property.
    ///
    /// - Parameter expiry: Encrypted expiry to be decrypted.
    /// - Parameter keyId: Key Id to be used to access the stored key and decrypt the data with.
    /// - Parameter algorithm: Algorithm in plain text to use to decrypt the AES key.
    /// - Throws:
    ///     - `UnsealingError.dataDecodingFailed`:
    ///         - If the input data cannot be encoded to a base 64 data object.
    ///         - If The decrypted data cannot be decoded to a string.
    ///     - `KeyManagerError` if the data cannot be decrypted.
    func unsealExpiry(_ expiry: SealedExpiry, withKeyInfo keyInfo: KeyInfo) throws -> VirtualCardExpiry {
        let mm = try worker.unsealInt(expiry.mm, withKeyInfo: keyInfo)
        let yyyy = try worker.unsealInt(expiry.yyyy, withKeyInfo: keyInfo)
        return VirtualCardExpiry(mm: mm, yyyy: yyyy)
    }

    /// Unseal a transaction detail charge attribute.
    ///
    /// - Parameter attribute: Encrypted attribute to be decrypted.
    /// - Parameter keyId: Key Id to be used to access the stored key and decrypt the data with.
    /// - Parameter algorithm: Algorithm in plain text to use to decrypt the AES key.
    /// - Throws:
    ///     - `UnsealingError.dataDecodingFailed`:
    ///         - If the input data cannot be encoded to a base 64 data object.
    ///         - If The decrypted data cannot be decoded to a string.
    ///     - `KeyManagerError` if the data cannot be decrypted.
    func unsealTransactionDetailChargeAttribute(
        _ attribute: SealedTransactionDetailChargeAttribute,
        withKeyInfo keyInfo: KeyInfo
    ) throws -> TransactionDetailChargeAttribute {
        let virtualCardAmount = try unsealCurrencyAmount(attribute.virtualCardAmount, withKeyInfo: keyInfo)
        let markup = try unsealMarkup(attribute.markup, withKeyInfo: keyInfo)
        let markupAmount = try unsealCurrencyAmount(attribute.markupAmount, withKeyInfo: keyInfo)
        let fundingSourceAmount = try unsealCurrencyAmount(attribute.fundingSourceAmount, withKeyInfo: keyInfo)
        let description = try worker.unsealString(attribute.description, withKeyInfo: keyInfo)
        // Remain backwards compatible by defaulting the state to CLEARED
        var state: TransactionDetailChargeAttribute.ChargeDetailState = .cleared
        if let detailState = attribute.state {
            state = .init(try worker.unsealString(detailState, withKeyInfo: keyInfo))
        }
        return .init(
            virtualCardAmount: virtualCardAmount,
            markup: markup,
            markupAmount: markupAmount,
            fundingSourceAmount: fundingSourceAmount,
            fundingSourceId: attribute.fundingSourceId,
            description: description,
            state: state
        )
    }

    /// Unseal a markup formula.
    ///
    /// - Parameter markup: Encrypted markup formula to be decrypted
    /// - Parameter keyId: Key Id to be used to access the stored key and decrypt the data with.
    /// - Parameter algorithm: Algorithm in plain text to use to decrypt the AES key.
    /// - Throws:
    ///     - `UnsealingError.dataDecodingFailed`:
    ///         - If the input data cannot be encoded to a base 64 data object.
    ///         - If The decrypted data cannot be decoded to a string.
    ///     - `KeyManagerError` if the data cannot be decrypted.
    func unsealMarkup(_ markup: SealedMarkup, withKeyInfo keyInfo: KeyInfo) throws -> TransactionDetailChargeAttribute.Markup {
        let percent = try worker.unsealInt(markup.percent, withKeyInfo: keyInfo)
        let flat = try worker.unsealInt(markup.flat, withKeyInfo: keyInfo)
        var minCharge: Int?
        if let markupMinCharge = markup.minCharge {
            minCharge = try worker.unsealInt(markupMinCharge, withKeyInfo: keyInfo)
        }
        return .init(percent: percent, flat: flat, minCharge: minCharge)
    }

    /// Unseal a sealed institution logo.
    ///
    /// - Parameter institutionLogo: Attribute containing encrypted logo and key id with which it can be decrypted.
    /// Returns: Decrypted institution logo
    /// Throws:
    ///     - `UnsealingError.dataDecodingFailed`:
    ///         - If the input data cannot be encoded to a base 64 data object.
    ///         - If The decrypted data cannot be decoded to a string.
    ///     - `KeyManagerError` if the data cannot be decrypted.
    func unseal(institutionLogo: GraphQL.SealedAttribute) throws -> BankAccountFundingSource.InstitutionLogo {
        let unsealedLogoString = try unseal(institutionLogo)
        guard let data = unsealedLogoString.data(using: .utf8) else {
            throw UnsealingError.dataDecodingFailed
        }
        return try decoder.decode(BankAccountFundingSource.InstitutionLogo.self, from: data)
    }

    // MARK: - Helpers: Unseal Metadata

    func unseal(metadata: GraphQL.SealedAttribute) throws -> JSONValue {
        guard SymmetricKeyEncryptionAlgorithm.isAlgorithmSupported(metadata.algorithm) else {
            throw SudoVirtualCardsError.unrecognizedAlgorithm(metadata.algorithm)
        }
        let string = try worker.unsealString(
            metadata.base64EncodedSealedData,
            withKeyInfo: .init(
                keyId: metadata.keyId,
                keyType: .symmetricKey,
                algorithm: metadata.algorithm
            )
        )
        guard let data = string.data(using: .utf8) else {
            throw UnsealingError.dataDecodingFailed
        }
        let anyJSON = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
        return try JSONValue(anyJSON)
    }
}
