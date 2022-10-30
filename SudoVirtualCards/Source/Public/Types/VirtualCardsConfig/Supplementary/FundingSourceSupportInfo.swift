//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of a Funding Source's Info
public struct FundingSourceSupportInfo: Equatable {
    
    // MARK: - Properties
    
    /// The provider type of the Funding Source
    public var providerType: String
    
    /// The funding source type
    public var fundingSourceType: String
    
    /// The network type of the funding source
    public var network: String
    
    /// The details of the funding source
    public var detail: [FundingSourceSupportDetail]
    
    // MARK: - Lifecycle
    
    /// Initialise an instance of `FundingSourceSupportInfo`.
    public init(
        providerType: String,
        fundingSourceType: String,
        network: String,
        detail: [FundingSourceSupportDetail]
    ) {
        self.providerType = providerType
        self.fundingSourceType = fundingSourceType
        self.network = network
        self.detail = detail
    }
}
