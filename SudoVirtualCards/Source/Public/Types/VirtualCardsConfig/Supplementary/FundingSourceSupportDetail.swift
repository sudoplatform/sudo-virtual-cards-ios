//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of a Funding Source's details
public struct FundingSourceSupportDetail: Equatable {
    
    // MARK: - Properties
    
    /// The card type of the funding source
    public var cardType: CardType
    
    // MARK: - Lifecycle
    
    /// Initialise an instance of `FundingSourceSupportDetail`.
    public init(
        cardType: CardType
    ) {
        self.cardType = cardType
    }
}
