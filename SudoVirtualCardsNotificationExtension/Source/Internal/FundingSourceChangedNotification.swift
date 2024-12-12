//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of decrypted raw JSON payload of a fundingSourceChanged notification
struct FundingSourceChangedNotification: Decodable, Equatable {
    
    enum CodingKeys: String, CodingKey {
        case type
        case owner
        case fundingSourceId
        case fundingSourceType
        case last4
        case state
        case flags
        case updatedAtEpochMs
    }
    static func == (lhs: FundingSourceChangedNotification, rhs: FundingSourceChangedNotification) -> Bool {
        return lhs.type == rhs.type &&
        lhs.owner == rhs.owner &&
        lhs.fundingSourceId == rhs.fundingSourceId &&
        lhs.fundingSourceType == rhs.fundingSourceType &&
        lhs.updatedAtEpochMs == rhs.updatedAtEpochMs
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)
        owner = try container.decode(String.self, forKey: .owner)
        fundingSourceId = try container.decode(String.self, forKey: .fundingSourceId)
        fundingSourceType = try container.decode(FundingSourceType.self, forKey: .fundingSourceType)
        last4 = try container.decode(String.self, forKey: .last4)
        state = try container.decode(FundingSourceState.self, forKey: .state)
        flags = try container.decode([FundingSourceFlags].self, forKey: .flags)
        updatedAtEpochMs = try container.decode(Int.self, forKey: .updatedAtEpochMs)
    }
    
    internal init(type: String, owner: String, fundingSourceId: String, fundingSourceType: FundingSourceType, last4: String, state: FundingSourceState, flags: [FundingSourceFlags], updatedAtEpochMs: Int) {
        self.type = type
        self.owner = owner
        self.fundingSourceId = fundingSourceId
        self.fundingSourceType = fundingSourceType
        self.last4 = last4
        self.state = state
        self.flags = flags
        self.updatedAtEpochMs = updatedAtEpochMs
    }
    /// Notification type (will always be "FundingSourceChangedNotification")
    let type: String

    /// ID of the owner (subject) of the funding source to which the notification pertains
    let owner: String

    /// ID of the funding source to which the notification pertains
    let fundingSourceId: String

    /// type of the funding source to which the notification pertains
    let fundingSourceType: FundingSourceType

    /// Last 4 digits of the funding source
    let last4: String

    /// State of the funding source
    let state: FundingSourceState

    /// Flags associated with the funding source
    let flags: [FundingSourceFlags]

    /// Milliseconds since epoch when the funding source to which the notification pertains was updated
    let updatedAtEpochMs: Int

}
