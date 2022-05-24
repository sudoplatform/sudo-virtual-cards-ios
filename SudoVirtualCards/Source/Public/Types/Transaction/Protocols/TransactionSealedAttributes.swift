//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public protocol TransactionSealedAttributes {

    /// Date in which the transaction was transacted at.
    var transactedAt: Date { get set }

    /// Date when the transaction was completed. Complete and Refund transactions only.
    var settledAt: Date? { get set }

    /// Transaction amount in the card's currency value.
    var billedAmount: CurrencyAmount { get set }

    /// Transaction amount in the merchant's currency value.
    var transactedAmount: CurrencyAmount { get set }

    /// Description of the transaction - typically is the name of the merchant.
    var description: String { get set }

    /// Associated reason for why the tranaction was declined (if applicable).
    var declineReason: TransactionDeclineReason? { get set }

    /// List of details about this transaction depending on transaction type. Pending,
    /// complete and refund transactions will always have detail.
    var detail: [TransactionDetailChargeAttribute] { get set }

}
