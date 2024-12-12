//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// JSON decodable representation of polymporphic notification as encrypted in the push notification payload
enum VirtualCardsServiceNotification: Decodable, Equatable {

    case fundingSourceChanged(FundingSourceChangedNotification)
    case unknown(_ type: String)

    enum CodingKeys: String, CodingKey {
        case type
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let type = try? values.decode(VirtualCardsServiceNotificationType.self, forKey: .type)
        
        switch type {
        case .fundingSourceChanged:
            let fundingSourceChangedNotification = try FundingSourceChangedNotification(from: decoder)
            self = .fundingSourceChanged(fundingSourceChangedNotification)
        case nil:
            let typeString: String? = try? values.decodeIfPresent(String.self, forKey: .type)
            let type: String = typeString ?? "unknown"
            self = .unknown(type)
        }
    }

    static func == (lhs: VirtualCardsServiceNotification, rhs: VirtualCardsServiceNotification) -> Bool {
        switch lhs {
        case .fundingSourceChanged(let lhs):
            switch rhs {
            case .fundingSourceChanged(let rhs):
                return lhs == rhs
            default:
                return false
            }
        case .unknown(let lhs):
            switch rhs {
            case .unknown(let rhs):
                return lhs == rhs
            default:
                return false
            }
        }
    }
}
