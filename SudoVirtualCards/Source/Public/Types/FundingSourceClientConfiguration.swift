//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// The Sudo Platform SDK representation of the funding source client configuration.
public struct StripeFundingSourceClientConfiguration: Equatable {

    // MARK: - Properties

    /// Type of the configuration provider.
    public let type: String = "stripe"

    /// Configuration version.
    public let version: Int

    /// API Key for configuring calls to the provider.
    public let apiKey: String

    // MARK: - Lifecycle

    public init(version: Int, apiKey: String) {
        self.version = version
        self.apiKey = apiKey
    }

}

public typealias FundingSourceClientConfiguration = StripeFundingSourceClientConfiguration
