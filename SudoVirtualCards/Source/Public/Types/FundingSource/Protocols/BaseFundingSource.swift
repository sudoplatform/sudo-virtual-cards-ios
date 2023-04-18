//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of the common attributes of a funding source used in the Sudo Platform SDK.
public protocol BaseFundingSource {
    /// Identifier generated by the Virtual Cards Service.
    var id: String { get }

    /// Owner identifier of the funding source. Typically the user sub.
    var owner: String { get }

    /// Version assigned by the service.
    var version: Int { get }

    /// Virtual Cards service timestamp to when the funding source record was created.
    var createdAt: Date { get }

    /// Virtual Cards service timestamp to when the funding source record was last updated.
    var updatedAt: Date { get }

    /// Type of this funding source
    var type: FundingSourceType { get }

    /// Current state of the funding source.
    var state: FundingSourceState { get }

    /// Currency of the funding source.
    var currency: String { get }

    /// Effective transaction velocity, if any, applied to
    /// virtual card transactions funded by this funding source.
    /// This is the combined result of all velocity policies
    /// (global and funding source specific) as at the time this funding
    /// source was retrieved.
    var transactionVelocity: TransactionVelocity? { get }
}