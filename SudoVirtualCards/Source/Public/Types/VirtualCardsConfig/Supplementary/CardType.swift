//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

///  Representation of an enumeration depicting the type of [FundingSource], in the Sudo
///  Platform Virtual Cards SDK.
///
public enum CardType: Equatable {
    /// Credit Card funding source
    case CREDIT
    /// Debit Card funding source
    case DEBIT
    /// Prepaid card funding source
    case PREPAID
    /// Unknown funding source type
    case UNKNOWN(String)
    
    // MARK: - Lifecycle
    
    /// Initialise an instance of `CardType`.
    init(_ cardType: GraphQL.CardType) {
        switch cardType {
        case .credit:
            self = .CREDIT
        case .debit:
            self = .DEBIT
        case .prepaid:
            self = .PREPAID
        case let .unknown(cardType):
            self = .UNKNOWN(cardType)
        }
    }
}
