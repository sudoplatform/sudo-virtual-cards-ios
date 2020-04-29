//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

extension GetTransactionQuery.Data.GetTransaction.BilledAmount: _SealedCurrencyAmount {}
extension GetTransactionQuery.Data.GetTransaction.TransactedAmount: _SealedCurrencyAmount {}
extension GetTransactionQuery.Data.GetTransaction.Detail.VirtualCardAmount: _SealedCurrencyAmount {}
extension GetTransactionQuery.Data.GetTransaction.Detail.MarkupAmount: _SealedCurrencyAmount {}
extension GetTransactionQuery.Data.GetTransaction.Detail.FundingSourceAmount: _SealedCurrencyAmount {}

extension ListTransactionsQuery.Data.ListTransaction.Item.BilledAmount: _SealedCurrencyAmount {}
extension ListTransactionsQuery.Data.ListTransaction.Item.TransactedAmount: _SealedCurrencyAmount {}
extension ListTransactionsQuery.Data.ListTransaction.Item.Detail.VirtualCardAmount: _SealedCurrencyAmount {}
extension ListTransactionsQuery.Data.ListTransaction.Item.Detail.MarkupAmount: _SealedCurrencyAmount {}
extension ListTransactionsQuery.Data.ListTransaction.Item.Detail.FundingSourceAmount: _SealedCurrencyAmount {}

extension OnTransactionUpdateSubscription.Data.OnTransactionUpdate.BilledAmount: _SealedCurrencyAmount {}
extension OnTransactionUpdateSubscription.Data.OnTransactionUpdate.TransactedAmount: _SealedCurrencyAmount {}
extension OnTransactionUpdateSubscription.Data.OnTransactionUpdate.Detail.VirtualCardAmount: _SealedCurrencyAmount {}
extension OnTransactionUpdateSubscription.Data.OnTransactionUpdate.Detail.MarkupAmount: _SealedCurrencyAmount {}
extension OnTransactionUpdateSubscription.Data.OnTransactionUpdate.Detail.FundingSourceAmount: _SealedCurrencyAmount {}
