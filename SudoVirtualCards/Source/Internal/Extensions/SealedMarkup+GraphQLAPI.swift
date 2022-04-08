//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

extension GetTransactionQuery.Data.GetTransaction.Detail.Markup: _SealedMarkup {}

extension ListTransactionsQuery.Data.ListTransaction.Item.Detail.Markup: _SealedMarkup {}

extension OnTransactionUpdateSubscription.Data.OnTransactionUpdate.Detail.Markup: _SealedMarkup {}

extension OnUpdateCardProvisionStateSubscription.Data.OnUpdateCardProvisionState.Card.LastTransaction.Detail.Markup: _SealedMarkup {}
extension ListCardsQuery.Data.ListCard.Item.LastTransaction.Detail.Markup: _SealedMarkup {}
extension GetCardQuery.Data.GetCard.LastTransaction.Detail.Markup: _SealedMarkup {}
extension UpdateCardMutation.Data.UpdateCard.LastTransaction.Detail.Markup: _SealedMarkup {}
extension CancelCardMutation.Data.CancelCard.LastTransaction.Detail.Markup: _SealedMarkup {}
