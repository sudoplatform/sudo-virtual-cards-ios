//
// Copyright © 2025 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

protocol GraphQLSubscriptionResult {}

extension GraphQL.OnTransactionDeleteSubscription.Data: GraphQLSubscriptionResult {}
extension GraphQL.OnTransactionUpdateSubscription.Data: GraphQLSubscriptionResult {}
