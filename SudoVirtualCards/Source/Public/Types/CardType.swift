//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

///  Representation of an enumeration depicting the card type of a [CreditCardFundingSource], in the Sudo
///  Platform Virtual Cards SDK.
///
public enum CardType: Hashable {
    /// Credit Card funding source
    case CREDIT
    /// Debit Card funding source
    case DEBIT
    /// Prepaid card funding source
    case PREPAID
    /// Other card funding source type
    case OTHER

    /// Backwards compatibility guard for catching new enum values added by the service - check you have the latest version of the SDK
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
        case .other:
            self = .OTHER
        case let .unknown(cardType):
            self = .UNKNOWN(cardType)
        }
    }
}
