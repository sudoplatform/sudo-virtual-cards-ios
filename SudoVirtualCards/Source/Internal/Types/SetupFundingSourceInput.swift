//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Input object a Funding Source Setup operation, using `SudoVirtualCardsClient`.
struct SetupFundingSourceInput: Equatable {

    // MARK: - Supplementary

    public enum SetupFundingSourceType: Equatable {
        case creditCard
        case unknown(String)

        init(_ type: FundingSourceType) {
            switch type {
            case .creditCard:
                self = .creditCard
            case let .unknown(type):
                self = .unknown(type)
            }
        }

        var fundingSourceType: FundingSourceType {
            switch self {
            case .creditCard:
                return .creditCard
            case let .unknown(type):
                return .unknown(type)
            }
        }
    }

    // MARK: - Properties

    public let type: SetupFundingSourceType
    public let currency: String

    // MARK: - Lifecycle

    public init(type: SetupFundingSourceType, currency: String) {
        self.type = type
        self.currency = currency
    }
}
