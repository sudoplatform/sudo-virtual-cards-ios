//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
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
protocol Unsealer: class {
    // MARK: - Lifecycle

    /// Initialize an instance of `Unsealer`.
    init(platformKeyManager: PlatformKeyManager)

    // MARK: - Methods: Unseal Cards

    /// Attempt to unseal a card received from a `OnUpdateCardProvisionStateSubscription`.
    ///
    /// Returns: Card that is unsealed using the input `card`'s `keyId`.
    /// Throws:
    ///     - UnsealingError.
    ///     - KeyManagerError.
    func unseal(_ card: OnUpdateCardProvisionStateSubscription.Data.OnUpdateCardProvisionState.Card) throws -> Card

    /// Attempt to unseal a card received from a `CancelCardMutation`.
    ///
    /// Returns: Card that is unsealed using the input `card`'s `keyId`.
    /// Throws:
    ///     - UnsealingError.
    ///     - KeyManagerError.
    func unseal(_ card: CancelCardMutation.Data.CancelCard) throws -> Card

    /// Attempt to unseal a card received from a `UpdateCardMutation`.
    ///
    /// Returns: Card that is unsealed using the input `card`'s `keyId`.
    /// Throws:
    ///     - UnsealingError.
    ///     - KeyManagerError.
    func unseal(_ card: UpdateCardMutation.Data.UpdateCard) throws -> Card

    /// Attempt to unseal a card received from a `GetCardQuery`.
    ///
    /// Returns: Card that is unsealed using the input `card`'s `keyId`.
    /// Throws:
    ///     - UnsealingError.
    ///     - KeyManagerError.
    func unseal(_ card: GetCardQuery.Data.GetCard) throws -> Card

    /// Attempt to unseal a card received from a `ListCardsQuery`.
    ///
    /// Returns: Card that is unsealed using the input `card`'s `keyId`.
    /// Throws:
    ///     - UnsealingError.
    ///     - KeyManagerError.
    func unseal(_ card: ListCardsQuery.Data.ListCard.Item) throws -> Card

    /// Attempt to unseal a card received from a `GetProvisionalCardQuery`.
    ///
    /// Returns: Card that is unsealed using the input `card`'s `keyId`.
    /// Throws:
    ///     - UnsealingError.
    ///     - KeyManagerError.
    func unseal(_ cards: [GetProvisionalCardQuery.Data.GetProvisionalCard.Card]) throws -> Card

    /// Attempt to unseal a card received from a `ListProvisionalCardsQuery`.
    ///
    /// Returns: Card that is unsealed using the input `card`'s `keyId`.
    /// Throws:
    ///     - UnsealingError.
    ///     - KeyManagerError.
    func unseal(_ cards: [ListProvisionalCardsQuery.Data.ListProvisionalCard.Item.Card]) throws -> Card

    // MARK: - Methods: Unseal Transactions

    /// Attempt to unseal a transaction received from a `GetTransactionQuery`.
    ///
    /// Returns: Transaction that is unsealed using the input `transaction`'s `keyId`.
    /// Throws:
    ///     - UnsealingError.
    ///     - KeyManagerError.
    func unseal(_ transaction: GetTransactionQuery.Data.GetTransaction) throws -> Transaction

    /// Attempt to unseal a transaction received from a `ListTransactionsQuery`.
    ///
    /// Returns: Transaction that is unsealed using the input `transaction` `keyId`.
    /// Throws:
    ///     - UnsealingError.
    ///     - KeyManagerError.
    func unseal(_ transaction: ListTransactionsQuery.Data.ListTransaction.Item) throws -> Transaction

    /// Attempt to unseal a transaction received from a `OnTransactionUpdateSubscription`.
    ///
    /// Returns: Transaction that is unsealed using the input `transaction` `keyId`.
    /// Throws:
    ///     - UnsealingError.
    ///     - KeyManagerError.
    func unseal(_ transaction: OnTransactionUpdateSubscription.Data.OnTransactionUpdate) throws -> Transaction
}

/// Unseals various resources received from the Virtual Cards Service.
class DefaultUnsealer: Unsealer {

    // MARK: - Supplementary

    /// Unowned instance of `PlatformKeyManager` used to lookup if key exists on input.
    private unowned let platformKeyManager: PlatformKeyManager

    /// Utility worker than can unseal properties.
    private let worker: DecryptionWorker

    // MARK: - Lifecycle

    required init(platformKeyManager: PlatformKeyManager) {
        self.platformKeyManager = platformKeyManager
        self.worker = DefaultDecryptionWorker(platformKeyManager: platformKeyManager)
    }

    init(platformKeyManager: PlatformKeyManager, worker: DecryptionWorker) {
        self.platformKeyManager = platformKeyManager
        self.worker = worker
    }

    // MARK: Methods - Cards

    func unseal(_ card: OnUpdateCardProvisionStateSubscription.Data.OnUpdateCardProvisionState.Card) throws -> Card {
        let state = Card.State(card.state)
        let billingAddress: SealedBillingAddress?
        if let address = card.billingAddress {
            billingAddress = SealedBillingAddress(address)
        } else {
            billingAddress = nil
        }
        let expiry = SealedExpiry(card.expiry)
        let activeTo = Date(millisecondsSince1970: card.activeToEpochMs)
        var cancelledAt: Date?
        if let cancelledAtEpochMs = card.cancelledAtEpochMs {
            cancelledAt = Date(millisecondsSince1970: cancelledAtEpochMs)
        }
        let created = Date(millisecondsSince1970: card.createdAtEpochMs)
        let updated = Date(millisecondsSince1970: card.updatedAtEpochMs)
        let owners = card.owners.map({Owner(id: $0.id, issuer: $0.issuer)})

        return try unsealCard(
            id: card.id,
            owner: card.owner,
            owners: owners,
            version: card.version,
            created: created,
            updated: updated,
            fundingSourceId: card.fundingSourceId,
            currency: card.currency,
            state: state,
            activeTo: activeTo,
            cancelledAt: cancelledAt,
            last4: card.last4,
            cardHolder: card.cardHolder,
            alias: card.alias,
            pan: card.pan,
            csc: card.csc,
            billingAddress: billingAddress,
            expiry: expiry,
            withKeyId: card.keyId,
            algorithm: card.algorithm)
    }

    func unseal(_ card: CancelCardMutation.Data.CancelCard) throws -> Card {
        let state = Card.State(card.state)
        let billingAddress: SealedBillingAddress?
        if let address = card.billingAddress {
            billingAddress = SealedBillingAddress(address)
        } else {
            billingAddress = nil
        }
        let expiry = SealedExpiry(card.expiry)
        let activeTo = Date(millisecondsSince1970: card.activeToEpochMs)
        var cancelledAt: Date?
        if let cancelledAtEpochMs = card.cancelledAtEpochMs {
            cancelledAt = Date(millisecondsSince1970: cancelledAtEpochMs)
        }
        let created = Date(millisecondsSince1970: card.createdAtEpochMs)
        let updated = Date(millisecondsSince1970: card.updatedAtEpochMs)
        let owners = card.owners.map({Owner(id: $0.id, issuer: $0.issuer)})

        return try unsealCard(
            id: card.id,
            owner: card.owner,
            owners: owners,
            version: card.version,
            created: created,
            updated: updated,
            fundingSourceId: card.fundingSourceId,
            currency: card.currency,
            state: state,
            activeTo: activeTo,
            cancelledAt: cancelledAt,
            last4: card.last4,
            cardHolder: card.cardHolder,
            alias: card.alias,
            pan: card.pan,
            csc: card.csc,
            billingAddress: billingAddress,
            expiry: expiry,
            withKeyId: card.keyId,
            algorithm: card.algorithm)
    }

    func unseal(_ card: UpdateCardMutation.Data.UpdateCard) throws -> Card {
        let state = Card.State(card.state)
        let billingAddress: SealedBillingAddress?
        if let address = card.billingAddress {
            billingAddress = SealedBillingAddress(address)
        } else {
            billingAddress = nil
        }
        let expiry = SealedExpiry(card.expiry)
        let activeTo = Date(millisecondsSince1970: card.activeToEpochMs)
        var cancelledAt: Date?
        if let cancelledAtEpochMs = card.cancelledAtEpochMs {
            cancelledAt = Date(millisecondsSince1970: cancelledAtEpochMs)
        }
        let created = Date(millisecondsSince1970: card.createdAtEpochMs)
        let updated = Date(millisecondsSince1970: card.updatedAtEpochMs)
        let owners = card.owners.map({Owner(id: $0.id, issuer: $0.issuer)})

        return try unsealCard(
            id: card.id,
            owner: card.owner,
            owners: owners,
            version: card.version,
            created: created,
            updated: updated,
            fundingSourceId: card.fundingSourceId,
            currency: card.currency,
            state: state,
            activeTo: activeTo,
            cancelledAt: cancelledAt,
            last4: card.last4,
            cardHolder: card.cardHolder,
            alias: card.alias,
            pan: card.pan,
            csc: card.csc,
            billingAddress: billingAddress,
            expiry: expiry,
            withKeyId: card.keyId,
            algorithm: card.algorithm)
    }

    func unseal(_ card: GetCardQuery.Data.GetCard) throws -> Card {
        let state = Card.State(card.state)
        let billingAddress: SealedBillingAddress?
        if let address = card.billingAddress {
            billingAddress = SealedBillingAddress(address)
        } else {
            billingAddress = nil
        }
        let expiry = SealedExpiry(card.expiry)
        let activeTo = Date(millisecondsSince1970: card.activeToEpochMs)
        var cancelledAt: Date?
        if let cancelledAtEpochMs = card.cancelledAtEpochMs {
            cancelledAt = Date(millisecondsSince1970: cancelledAtEpochMs)
        }
        let created = Date(millisecondsSince1970: card.createdAtEpochMs)
        let updated = Date(millisecondsSince1970: card.updatedAtEpochMs)
        let owners = card.owners.map({Owner(id: $0.id, issuer: $0.issuer)})

        return try unsealCard(
            id: card.id,
            owner: card.owner,
            owners: owners,
            version: card.version,
            created: created,
            updated: updated,
            fundingSourceId: card.fundingSourceId,
            currency: card.currency,
            state: state,
            activeTo: activeTo,
            cancelledAt: cancelledAt,
            last4: card.last4,
            cardHolder: card.cardHolder,
            alias: card.alias,
            pan: card.pan,
            csc: card.csc,
            billingAddress: billingAddress,
            expiry: expiry,
            withKeyId: card.keyId,
            algorithm: card.algorithm)
    }

    func unseal(_ card: ListCardsQuery.Data.ListCard.Item) throws -> Card {
        let state = Card.State(card.state)
        let billingAddress: SealedBillingAddress?
        if let address = card.billingAddress {
            billingAddress = SealedBillingAddress(address)
        } else {
            billingAddress = nil
        }
        let expiry = SealedExpiry(card.expiry)
        let activeTo = Date(millisecondsSince1970: card.activeToEpochMs)
        var cancelledAt: Date?
        if let cancelledAtEpochMs = card.cancelledAtEpochMs {
            cancelledAt = Date(millisecondsSince1970: cancelledAtEpochMs)
        }
        let created = Date(millisecondsSince1970: card.createdAtEpochMs)
        let updated = Date(millisecondsSince1970: card.updatedAtEpochMs)
        let owners = card.owners.map({Owner(id: $0.id, issuer: $0.issuer)})

        return try unsealCard(
            id: card.id,
            owner: card.owner,
            owners: owners,
            version: card.version,
            created: created,
            updated: updated,
            fundingSourceId: card.fundingSourceId,
            currency: card.currency,
            state: state,
            activeTo: activeTo,
            cancelledAt: cancelledAt,
            last4: card.last4,
            cardHolder: card.cardHolder,
            alias: card.alias,
            pan: card.pan,
            csc: card.csc,
            billingAddress: billingAddress,
            expiry: expiry,
            withKeyId: card.keyId,
            algorithm: card.algorithm)
    }

    func unseal(_ cards: [GetProvisionalCardQuery.Data.GetProvisionalCard.Card]) throws -> Card {
        guard let card = try cards.first(where: {
            try platformKeyManager.getKeyPairWithId($0.keyId) != nil
        }) else {
            throw UnsealingError.keyNotFound
        }
        let state = Card.State(card.state)
        let billingAddress: SealedBillingAddress?
        if let address = card.billingAddress {
            billingAddress = SealedBillingAddress(address)
        } else {
            billingAddress = nil
        }
        let expiry = SealedExpiry(card.expiry)
        let activeTo = Date(millisecondsSince1970: card.activeToEpochMs)
        var cancelledAt: Date?
        if let cancelledAtEpochMs = card.cancelledAtEpochMs {
            cancelledAt = Date(millisecondsSince1970: cancelledAtEpochMs)
        }
        let created = Date(millisecondsSince1970: card.createdAtEpochMs)
        let updated = Date(millisecondsSince1970: card.updatedAtEpochMs)
        let owners = card.owners.map({Owner(id: $0.id, issuer: $0.issuer)})

        return try unsealCard(
            id: card.id,
            owner: card.owner,
            owners: owners,
            version: card.version,
            created: created,
            updated: updated,
            fundingSourceId: card.fundingSourceId,
            currency: card.currency,
            state: state,
            activeTo: activeTo,
            cancelledAt: cancelledAt,
            last4: card.last4,
            cardHolder: card.cardHolder,
            alias: card.alias,
            pan: card.pan,
            csc: card.csc,
            billingAddress: billingAddress,
            expiry: expiry,
            withKeyId: card.keyId,
            algorithm: card.algorithm)
    }

    func unseal(_ cards: [ListProvisionalCardsQuery.Data.ListProvisionalCard.Item.Card]) throws -> Card {
        guard let card = try cards.first(where: {
            try platformKeyManager.getKeyPairWithId($0.keyId) != nil
        }) else {
            throw UnsealingError.keyNotFound
        }

        let state = Card.State(card.state)
        let billingAddress: SealedBillingAddress?
        if let address = card.billingAddress {
            billingAddress = SealedBillingAddress(address)
        } else {
            billingAddress = nil
        }
        let expiry = SealedExpiry(card.expiry)
        let activeTo = Date(millisecondsSince1970: card.activeToEpochMs)
        var cancelledAt: Date?
        if let cancelledAtEpochMs = card.cancelledAtEpochMs {
            cancelledAt = Date(millisecondsSince1970: cancelledAtEpochMs)
        }
        let created = Date(millisecondsSince1970: card.createdAtEpochMs)
        let updated = Date(millisecondsSince1970: card.updatedAtEpochMs)
        let owners = card.owners.map({Owner(id: $0.id, issuer: $0.issuer)})

        return try unsealCard(
            id: card.id,
            owner: card.owner,
            owners: owners,
            version: card.version,
            created: created,
            updated: updated,
            fundingSourceId: card.fundingSourceId,
            currency: card.currency,
            state: state,
            activeTo: activeTo,
            cancelledAt: cancelledAt,
            last4: card.last4,
            cardHolder: card.cardHolder,
            alias: card.alias,
            pan: card.pan,
            csc: card.csc,
            billingAddress: billingAddress,
            expiry: expiry,
            withKeyId: card.keyId,
            algorithm: card.algorithm)
    }

    // MARK: Methods - Transactions

    func unseal(_ transaction: GetTransactionQuery.Data.GetTransaction) throws -> Transaction {
        let type = Transaction.TransactionType(type: transaction.type)
        let created = Date(millisecondsSince1970: transaction.createdAtEpochMs)
        let updated = Date(millisecondsSince1970: transaction.updatedAtEpochMs)
        let billedAmount = SealedCurrencyAmount(transaction.billedAmount)
        let transactedAmount = SealedCurrencyAmount(transaction.transactedAmount)
        var detail: [SealedTransactionDetailChargeAttribute] = []
        if let gqlDetail = transaction.detail {
            detail = gqlDetail.map {
                return SealedTransactionDetailChargeAttribute(
                    fundingSourceId: $0.fundingSourceId,
                    virtualCardAmount: $0.virtualCardAmount,
                    markup: $0.markup,
                    markupAmount: $0.markupAmount,
                    fundingSourceAmount: $0.fundingSourceAmount,
                    description: $0.description)
            }
        }
        return try unsealTransaction(
            id: transaction.id,
            cardId: transaction.cardId,
            sequenceId: transaction.sequenceId,
            created: created,
            updated: updated,
            type: type,
            transactedAEpochMs: transaction.transactedAtEpochMs,
            billedAmount: billedAmount,
            transactedAmount: transactedAmount,
            description: transaction.description,
            declineReason: transaction.declineReason,
            detail: detail,
            withKeyId: transaction.keyId,
            algorithm: transaction.algorithm)
    }

    func unseal(_ transaction: ListTransactionsQuery.Data.ListTransaction.Item) throws -> Transaction {
        let type = Transaction.TransactionType(type: transaction.type)
        let created = Date(millisecondsSince1970: transaction.createdAtEpochMs)
        let updated = Date(millisecondsSince1970: transaction.updatedAtEpochMs)
        let billedAmount = SealedCurrencyAmount(transaction.billedAmount)
        let transactedAmount = SealedCurrencyAmount(transaction.transactedAmount)
        var detail: [SealedTransactionDetailChargeAttribute] = []
        if let gqlDetail = transaction.detail {
            detail = gqlDetail.map {
                return SealedTransactionDetailChargeAttribute(
                    fundingSourceId: $0.fundingSourceId,
                    virtualCardAmount: $0.virtualCardAmount,
                    markup: $0.markup,
                    markupAmount: $0.markupAmount,
                    fundingSourceAmount: $0.fundingSourceAmount,
                    description: $0.description)
            }
        }
        return try unsealTransaction(
            id: transaction.id,
            cardId: transaction.cardId,
            sequenceId: transaction.sequenceId,
            created: created,
            updated: updated,
            type: type,
            transactedAEpochMs: transaction.transactedAtEpochMs,
            billedAmount: billedAmount,
            transactedAmount: transactedAmount,
            description: transaction.description,
            declineReason: transaction.declineReason,
            detail: detail,
            withKeyId: transaction.keyId,
            algorithm: transaction.algorithm)
    }

    func unseal(_ transaction: OnTransactionUpdateSubscription.Data.OnTransactionUpdate) throws -> Transaction {
        let type = Transaction.TransactionType(type: transaction.type)
        let created = Date(millisecondsSince1970: transaction.createdAtEpochMs)
        let updated = Date(millisecondsSince1970: transaction.updatedAtEpochMs)
        let billedAmount = SealedCurrencyAmount(transaction.billedAmount)
        let transactedAmount = SealedCurrencyAmount(transaction.transactedAmount)
        var detail: [SealedTransactionDetailChargeAttribute] = []
        if let gqlDetail = transaction.detail {
            detail = gqlDetail.map {
                return SealedTransactionDetailChargeAttribute(
                    fundingSourceId: $0.fundingSourceId,
                    virtualCardAmount: $0.virtualCardAmount,
                    markup: $0.markup,
                    markupAmount: $0.markupAmount,
                    fundingSourceAmount: $0.fundingSourceAmount,
                    description: $0.description)
            }
        }
        return try unsealTransaction(
            id: transaction.id,
            cardId: transaction.cardId,
            sequenceId: transaction.sequenceId,
            created: created,
            updated: updated,
            type: type,
            transactedAEpochMs: transaction.transactedAtEpochMs,
            billedAmount: billedAmount,
            transactedAmount: transactedAmount,
            description: transaction.description,
            declineReason: transaction.declineReason,
            detail: detail,
            withKeyId: transaction.keyId,
            algorithm: transaction.algorithm)
    }

    // MARK: - Helpers: Decrypting Resources

    /// Unseal a card, using its `keyId`.
    ///
    /// Attributes that are sealed and will be unsealed are: [`cardHolder`, `alias`, `pan`, `csc`, `billingAddress`, `expiry`].
    ///
    /// - Parameter id: Id of the card. NOT SEALED.
    /// - Parameter owner: Owner of the card. NOT SEALED.
    /// - Parameter owners: List of owners of the card. NOT SEALED.
    /// - Parameter version: Version of the card. NOT SEALED.
    /// - Parameter created: Created date of the card. NOT SEALED.
    /// - Parameter updated: Updated date of the card. NOT SEALED.
    /// - Parameter fundingSourceId: Funding source id of the card. NOT SEALED.
    /// - Parameter currency: Currency ISO code of the card. NOT SEALED.
    /// - Parameter state: State of the card. NOT SEALED.
    /// - Parameter activeTo: Active to date of the card. NOT SEALED.
    /// - Parameter cancelledAt: Cancelled at date of the card. NOT SEALED.
    /// - Parameter last4: Last 4 digits on the card. NOT SEALED.
    /// - Parameter cardHolder: Card holder name to be unsealed.
    /// - Parameter alias: Alias associated with the card to be unsealed.
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
        created: Date,
        updated: Date,
        fundingSourceId: String,
        currency: String,
        state: Card.State,
        activeTo: Date,
        cancelledAt: Date?,
        last4: String,
        cardHolder: SealedString,
        alias: SealedString,
        pan: SealedString,
        csc: SealedString,
        billingAddress: SealedBillingAddress?,
        expiry: SealedExpiry,
        withKeyId keyId: String,
        algorithm: String
    ) throws -> Card {
        let cardHolder = try worker.unsealString(cardHolder, withKeyId: keyId, algorithm: algorithm)
        let alias = try worker.unsealString(alias, withKeyId: keyId, algorithm: algorithm)
        let pan = try worker.unsealString(pan, withKeyId: keyId, algorithm: algorithm)
        let csc = try worker.unsealString(csc, withKeyId: keyId, algorithm: algorithm)
        let optionalBillingAddress: Card.BillingAddress?
        if let billingAddress = billingAddress {
            optionalBillingAddress = try unsealBillingAddress(billingAddress, withKeyId: keyId, algorithm: algorithm)
        } else {
            optionalBillingAddress = nil
        }
        let expiry = try unsealExpiry(expiry, withKeyId: keyId, algorithm: algorithm)
        return Card(
            id: id,
            owners: owners,
            owner: owner,
            version: version,
            fundingSourceId: fundingSourceId,
            state: state,
            cardHolder: cardHolder,
            alias: alias,
            last4: last4,
            pan: pan,
            csc: csc,
            billingAddress: optionalBillingAddress,
            expiry: expiry,
            currency: currency,
            activeTo: activeTo,
            cancelledAt: cancelledAt,
            created: created,
            updated: updated)
    }

    /// Unseal a transaction, using its `keyId`.
    ///
    /// Attributes that are sealed and will be unsealed are: [`transactedAEpochMs`, `billedAmount`, `transactedAmount`, `description`, `declineReason`].
    ///
    /// - Parameter id: Id of the transaction. NOT SEALED.
    /// - Parameter cardId: Card Id of the transaction. NOT SEALED.
    /// - Parameter sequenceId: sequence ID of the transaction. NOT SEALED.
    /// - Parameter created: Created date of the transaction. NOT SEALED.
    /// - Parameter updated: Updated date of the transaction. NOT SEALED.
    /// - Parameter type: Type of the transaction. NOT SEALED.
    /// - Parameter transactedAEpochMs: Transaction time in milliseconds to be unsealed.
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
        created: Date,
        updated: Date,
        type: Transaction.TransactionType,
        transactedAEpochMs: SealedDate,
        billedAmount: SealedCurrencyAmount,
        transactedAmount: SealedCurrencyAmount,
        description: SealedString,
        declineReason: SealedString?,
        detail: [SealedTransactionDetailChargeAttribute],
        withKeyId keyId: String,
        algorithm: String
    ) throws -> Transaction {
        let transactedAt = try worker.unsealDate(transactedAEpochMs, withKeyId: keyId, algorithm: algorithm)
        let billedAmount = try unsealCurrencyAmount(billedAmount, withKeyId: keyId, algorithm: algorithm)
        let transactedAmount = try unsealCurrencyAmount(transactedAmount, withKeyId: keyId, algorithm: algorithm)
        let description = try worker.unsealString(description, withKeyId: keyId, algorithm: algorithm)
        let optionalDeclineReason: String?
        if let declineReason = declineReason {
            optionalDeclineReason = try worker.unsealString(declineReason, withKeyId: keyId, algorithm: algorithm)
        } else {
            optionalDeclineReason = nil
        }

        let detail = try detail.map {
            try unsealTransactionDetailChargeAttribute(
                $0,
                withKeyId: keyId,
                algorithm: algorithm)
        }
        return Transaction(
            id: id,
            cardId: cardId,
            sequenceId: sequenceId,
            type: type,
            transactedAt: transactedAt,
            billedAmount: billedAmount,
            transactedAmount: transactedAmount,
            description: description,
            declineReason: optionalDeclineReason,
            detail: detail,
            created: created,
            updated: updated)
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
    func unsealCurrencyAmount(_ currencyAmount: SealedCurrencyAmount, withKeyId keyId: String, algorithm: String) throws -> CurrencyAmount {
        let currency = try worker.unsealString(currencyAmount.currency, withKeyId: keyId, algorithm: algorithm)
        let amount = try worker.unsealInt(currencyAmount.amount, withKeyId: keyId, algorithm: algorithm)
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
    func unsealBillingAddress(_ billingAddress: SealedBillingAddress, withKeyId keyId: String, algorithm: String) throws -> Card.BillingAddress {
        let addressLine1 = try worker.unsealString(billingAddress.addressLine1, withKeyId: keyId, algorithm: algorithm)
        let addressLine2: String?
        if let al2 = billingAddress.addressLine2 {
            addressLine2 = try worker.unsealString(al2, withKeyId: keyId, algorithm: algorithm)
        } else {
            addressLine2 = nil
        }
        let city = try worker.unsealString(billingAddress.city, withKeyId: keyId, algorithm: algorithm)
        let state = try worker.unsealString(billingAddress.state, withKeyId: keyId, algorithm: algorithm)
        let postalCode = try worker.unsealString(billingAddress.postalCode, withKeyId: keyId, algorithm: algorithm)
        let country = try worker.unsealString(billingAddress.country, withKeyId: keyId, algorithm: algorithm)

        return Card.BillingAddress(
            addressLine1: addressLine1,
            addressLine2: addressLine2,
            city: city,
            state: state,
            postalCode: postalCode,
            country: country)
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
    func unsealExpiry(_ expiry: SealedExpiry, withKeyId keyId: String, algorithm: String) throws -> Card.Expiry {
        let mm = try worker.unsealInt(expiry.mm, withKeyId: keyId, algorithm: algorithm)
        let yyyy = try worker.unsealInt(expiry.yyyy, withKeyId: keyId, algorithm: algorithm)
        return Card.Expiry(mm: mm, yyyy: yyyy)
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
        withKeyId keyId: String,
        algorithm: String
    ) throws -> TransactionDetailChargeAttribute {
        let virtualCardAmount = try unsealCurrencyAmount(attribute.virtualCardAmount, withKeyId: keyId, algorithm: algorithm)
        let markup = try unsealMarkup(attribute.markup, withKeyId: keyId, algorithm: algorithm)
        let markupAmount = try unsealCurrencyAmount(attribute.markupAmount, withKeyId: keyId, algorithm: algorithm)
        let fundingSourceAmount = try unsealCurrencyAmount(attribute.fundingSourceAmount, withKeyId: keyId, algorithm: algorithm)
        let description = try worker.unsealString(attribute.description, withKeyId: keyId, algorithm: algorithm)
        return .init(
            virtualCardAmount: virtualCardAmount,
            markup: markup,
            markupAmount: markupAmount,
            fundingSourceAmount: fundingSourceAmount,
            fundingSourceId: attribute.fundingSourceId,
            description: description)
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
    func unsealMarkup(_ markup: SealedMarkup, withKeyId keyId: String, algorithm: String) throws -> TransactionDetailChargeAttribute.Markup {
        let percent = try worker.unsealInt(markup.percent, withKeyId: keyId, algorithm: algorithm)
        let flat = try worker.unsealInt(markup.flat, withKeyId: keyId, algorithm: algorithm)
        var minCharge: Int?
        if let markupMinCharge = markup.minCharge {
            minCharge = try worker.unsealInt(markupMinCharge, withKeyId: keyId, algorithm: algorithm)
        }
        return .init(percent: percent, flat: flat, minCharge: minCharge)
    }
}
