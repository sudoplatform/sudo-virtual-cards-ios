//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of a Transaction object associated with a Virtual Card in Platform SDK.
public struct PartialTransaction: Hashable {

    // MARK: - Properties

    public let id: String
    public let cardId: String
    public let sequenceId: String
    public let type: TransactionType
    public let sortDate: Date
    public let createdAt: Date
    public let updatedAt: Date

    // MARK: - Lifecycle

    /// Initialize an instance of `Transaction`.
    public init(
        id: String,
        cardId: String,
        sequenceId: String,
        type: TransactionType,
        sortDate: Date,
        createdAt: Date,
        updatedAt: Date
    ) {
        self.id = id
        self.cardId = cardId
        self.type = type
        self.sequenceId = sequenceId
        self.sortDate = sortDate
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
