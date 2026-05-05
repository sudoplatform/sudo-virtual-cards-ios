//
// Copyright © 2025 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// The types of notifications that can be sent to `Subscriber` instances.
public enum SubscriptionNotification: Sendable, Equatable {
    /// A transaction has been updated.
    case transactionUpdated(Transaction)
    /// A transaction has been deleted.
    case transactionDeleted(Transaction)
}
