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

extension OnUpdateCardProvisionStateSubscription.Data.OnUpdateCardProvisionState.Card.LastTransaction.BilledAmount: _SealedCurrencyAmount {}
extension OnUpdateCardProvisionStateSubscription.Data.OnUpdateCardProvisionState.Card.LastTransaction.TransactedAmount: _SealedCurrencyAmount {}
extension OnUpdateCardProvisionStateSubscription.Data.OnUpdateCardProvisionState.Card.LastTransaction.Detail.VirtualCardAmount: _SealedCurrencyAmount {}
extension OnUpdateCardProvisionStateSubscription.Data.OnUpdateCardProvisionState.Card.LastTransaction.Detail.MarkupAmount: _SealedCurrencyAmount {}
extension OnUpdateCardProvisionStateSubscription.Data.OnUpdateCardProvisionState.Card.LastTransaction.Detail.FundingSourceAmount: _SealedCurrencyAmount {}

extension ListCardsQuery.Data.ListCard.Item.LastTransaction.BilledAmount: _SealedCurrencyAmount {}
extension ListCardsQuery.Data.ListCard.Item.LastTransaction.TransactedAmount: _SealedCurrencyAmount {}
extension ListCardsQuery.Data.ListCard.Item.LastTransaction.Detail.VirtualCardAmount: _SealedCurrencyAmount {}
extension ListCardsQuery.Data.ListCard.Item.LastTransaction.Detail.MarkupAmount: _SealedCurrencyAmount {}
extension ListCardsQuery.Data.ListCard.Item.LastTransaction.Detail.FundingSourceAmount: _SealedCurrencyAmount {}

extension GetCardQuery.Data.GetCard.LastTransaction.BilledAmount: _SealedCurrencyAmount {}
extension GetCardQuery.Data.GetCard.LastTransaction.TransactedAmount: _SealedCurrencyAmount {}
extension GetCardQuery.Data.GetCard.LastTransaction.Detail.VirtualCardAmount: _SealedCurrencyAmount {}
extension GetCardQuery.Data.GetCard.LastTransaction.Detail.MarkupAmount: _SealedCurrencyAmount {}
extension GetCardQuery.Data.GetCard.LastTransaction.Detail.FundingSourceAmount: _SealedCurrencyAmount {}

extension UpdateCardMutation.Data.UpdateCard.LastTransaction.BilledAmount: _SealedCurrencyAmount {}
extension UpdateCardMutation.Data.UpdateCard.LastTransaction.TransactedAmount: _SealedCurrencyAmount {}
extension UpdateCardMutation.Data.UpdateCard.LastTransaction.Detail.VirtualCardAmount: _SealedCurrencyAmount {}
extension UpdateCardMutation.Data.UpdateCard.LastTransaction.Detail.MarkupAmount: _SealedCurrencyAmount {}
extension UpdateCardMutation.Data.UpdateCard.LastTransaction.Detail.FundingSourceAmount: _SealedCurrencyAmount {}

extension CancelCardMutation.Data.CancelCard.LastTransaction.BilledAmount: _SealedCurrencyAmount {}
extension CancelCardMutation.Data.CancelCard.LastTransaction.TransactedAmount: _SealedCurrencyAmount {}
extension CancelCardMutation.Data.CancelCard.LastTransaction.Detail.VirtualCardAmount: _SealedCurrencyAmount {}
extension CancelCardMutation.Data.CancelCard.LastTransaction.Detail.MarkupAmount: _SealedCurrencyAmount {}
extension CancelCardMutation.Data.CancelCard.LastTransaction.Detail.FundingSourceAmount: _SealedCurrencyAmount {}
