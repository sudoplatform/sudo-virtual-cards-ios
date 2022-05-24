//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of a Transaction object associated with a Virtual Card in Platform SDK.
public struct Transaction: TransactionAttributes, TransactionSealedAttributes, Hashable {

    // MARK: - Properties

    public var id: String
    public var cardId: String
    public var sequenceId: String
    public var type: TransactionType
    public var sortDate: Date
    public var transactedAt: Date
    public var settledAt: Date?
    public var billedAmount: CurrencyAmount
    public var transactedAmount: CurrencyAmount
    public var description: String
    public var declineReason: TransactionDeclineReason?
    public var detail: [TransactionDetailChargeAttribute]
    public var createdAt: Date
    public var updatedAt: Date

    // MARK: - Lifecycle

    /// Initialize an instance of `Transaction`.
    public init(
        id: String,
        cardId: String,
        sequenceId: String,
        type: TransactionType,
        sortDate: Date,
        transactedAt: Date,
        settledAt: Date?,
        billedAmount: CurrencyAmount,
        transactedAmount: CurrencyAmount,
        description: String,
        declineReason: TransactionDeclineReason? = nil,
        detail: [TransactionDetailChargeAttribute] = [],
        createdAt: Date,
        updatedAt: Date
    ) {
        self.id = id
        self.cardId = cardId
        self.type = type
        self.sequenceId = sequenceId
        self.sortDate = sortDate
        self.transactedAt = transactedAt
        self.settledAt = settledAt
        self.billedAmount = billedAmount
        self.transactedAmount = transactedAmount
        self.description = description
        self.declineReason = declineReason
        self.detail = detail
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
