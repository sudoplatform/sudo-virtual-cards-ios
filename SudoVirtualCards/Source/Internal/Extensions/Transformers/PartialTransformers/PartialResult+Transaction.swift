//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

extension PartialResult where P == PartialTransaction {

    init(transaction: GraphQL.SealedTransaction, error: Error) {
        let transactionType = TransactionType(type: transaction.type)
        let createdAt = Date(millisecondsSince1970: transaction.createdAtEpochMs)
        let updatedAt = Date(millisecondsSince1970: transaction.updatedAtEpochMs)
        let sortDate = Date(millisecondsSince1970: transaction.sortDateEpochMs)
        let partial = PartialTransaction(
            id: transaction.id,
            cardId: transaction.cardId,
            sequenceId: transaction.sequenceId,
            type: transactionType,
            sortDate: sortDate,
            createdAt: createdAt,
            updatedAt: updatedAt
        )
        self.init(partial: partial, error: error)
    }

}
