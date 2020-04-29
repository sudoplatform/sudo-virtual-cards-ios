//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

// BillingAddress

extension OnUpdateCardProvisionStateSubscription.Data.OnUpdateCardProvisionState.Card.BillingAddress: _SealedBillingAddress {}

extension CancelCardMutation.Data.CancelCard.BillingAddress: _SealedBillingAddress {}

extension UpdateCardMutation.Data.UpdateCard.BillingAddress: _SealedBillingAddress {}

extension GetCardQuery.Data.GetCard.BillingAddress: _SealedBillingAddress {}

extension ListCardsQuery.Data.ListCard.Item.BillingAddress: _SealedBillingAddress {}

extension GetProvisionalCardQuery.Data.GetProvisionalCard.Card.BillingAddress: _SealedBillingAddress {}

extension ListProvisionalCardsQuery.Data.ListProvisionalCard.Item.Card.BillingAddress: _SealedBillingAddress {}

// Expiry

extension OnUpdateCardProvisionStateSubscription.Data.OnUpdateCardProvisionState.Card.Expiry: _SealedExpiry {}

extension CancelCardMutation.Data.CancelCard.Expiry: _SealedExpiry {}

extension UpdateCardMutation.Data.UpdateCard.Expiry: _SealedExpiry {}

extension GetCardQuery.Data.GetCard.Expiry: _SealedExpiry {}

extension ListCardsQuery.Data.ListCard.Item.Expiry: _SealedExpiry {}

extension GetProvisionalCardQuery.Data.GetProvisionalCard.Card.Expiry: _SealedExpiry {}

extension ListProvisionalCardsQuery.Data.ListProvisionalCard.Item.Card.Expiry: _SealedExpiry {}
