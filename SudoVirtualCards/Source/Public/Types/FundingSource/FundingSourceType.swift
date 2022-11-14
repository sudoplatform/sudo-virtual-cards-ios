//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public enum FundingSourceType: Encodable, Hashable {
    /// Credit or debit card based funding source
    case creditCard
    /// Bank account based funding source
    case bankAccount
    case unknown(String)

    enum CodingKeys: String, CodingKey {
        case creditCard = "CREDIT_CARD"
        case bankAccount = "BANK_ACCOUNT"
    }

    /// Initialize an instance of `FundingSourceType from GraphQL type
    init(_ type: GraphQL.FundingSourceType) {
        switch type {
        case .creditCard:
            self = .creditCard
        case .bankAccount:
            self = .bankAccount
        case let .unknown(type):
            self = .unknown(type)
        }
    }

    /// Initialize an instance of `FundingSourceType from String
    init(_ type: String) {
        switch type {
        case "CREDIT_CARD":
            self = .creditCard
        case "BANK_ACCOUNT":
            self = .bankAccount

        /// Backwards compatibility guard for catching new enum values added by the service - check you have the latest version of the SDK
        default:
            self = .unknown(type)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .creditCard:
            try container.encode("CREDIT_CARD")
        case .bankAccount:
            try container.encode("BANK_ACCOUNT")
        case .unknown(let type):
            try container.encode(type)
        }
    }
}
