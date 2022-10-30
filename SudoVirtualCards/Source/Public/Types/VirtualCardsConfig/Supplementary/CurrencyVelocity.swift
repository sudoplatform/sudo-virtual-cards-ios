//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of a Currency Velocity
public struct CurrencyVelocity: Equatable {
    
    // MARK: - Properties
    
    /// The type of currency
    public var currency: String
    
    /// The velocity of the currency
    public var velocity: [String]
    
    // MARK: - Lifecycle
    
    /// Initialises an instance of `CurrencyVelocity`.
    public init(
        currency: String,
        velocity: [String]
    ) {
        self.currency = currency
        self.velocity = velocity
    }
}
