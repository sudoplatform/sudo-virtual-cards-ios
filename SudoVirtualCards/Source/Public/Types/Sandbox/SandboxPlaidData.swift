//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public struct SandboxPlaidData: Equatable {
    // MARK: - Properties

    /// Test accounts available for the test user specific to the sandboxGetPlaidData method
    public let accountMetadata: [PlaidAccountMetadata]

    /// Token for passing in completion data to completeFundingSource
    public let publicToken: String

    // MARK: - Lifecycle

    public init(accountMetadata: [PlaidAccountMetadata], publicToken: String) {
        self.accountMetadata = accountMetadata
        self.publicToken = publicToken
    }
}
