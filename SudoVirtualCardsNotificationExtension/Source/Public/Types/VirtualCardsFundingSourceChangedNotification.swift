//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoNotificationExtension

/// Representation of a Sudo Platform Virtual Cards service fundingSourceChanged notification
public struct VirtualCardsFundingSourceChangedNotification: SudoNotification, Equatable {
    public static func == (lhs: VirtualCardsFundingSourceChangedNotification, rhs: VirtualCardsFundingSourceChangedNotification) -> Bool {
        return lhs.owner == rhs.owner &&
        lhs.fundingSourceId == rhs.fundingSourceId &&
        lhs.fundingSourceType == rhs.fundingSourceType &&
        lhs.updatedAt == rhs.updatedAt
    }
    
    // MARK: - Conformance

    public let serviceName = Constants.serviceName
    public let type: String = VirtualCardsServiceNotificationType.fundingSourceChanged.rawValue
    
    // MARK: - fundingSourceChanged

    /// ID of the owner (subject) of the funding source to which the notification pertains
    public let owner: String

    /// ID of the funding source to which the notification pertains
    public let fundingSourceId: String

    /// Type of the funding source to which the notification pertains
    public let fundingSourceType: FundingSourceType

    /// Last4 digits of the funding source
    public let last4: String

    /// state of the funding source to which the notification pertains
    public let state: FundingSourceState

    /// Flags of the funding source to which the notificaiton pertains
    public let flags: [FundingSourceFlags]

    /// Date when the funding source to which the notification pertains was updated
    public let updatedAt: Date
}
