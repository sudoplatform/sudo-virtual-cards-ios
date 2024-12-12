//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoNotificationExtension

extension VirtualCardsServiceNotification {

    /// Convert the raw representation of a virtual cards service notification to its public form
    func toSudoNotification() -> any SudoNotification {
        switch self {
        case .fundingSourceChanged(let decoded):
            return VirtualCardsFundingSourceChangedNotification(
                owner: decoded.owner,
                fundingSourceId: decoded.fundingSourceId,
                fundingSourceType: decoded.fundingSourceType,
                last4: decoded.last4,
                state: decoded.state,
                flags: decoded.flags,
                updatedAt: Date(timeIntervalSince1970: TimeInterval(decoded.updatedAtEpochMs / 1000)))

        case .unknown(let type):
            return VirtualCardsUnknownNotification(type: type)
        }
    }
}
