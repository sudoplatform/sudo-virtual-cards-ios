//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public protocol FundingSourceProviderData {

    /// Provider String.
    var provider: String { get }

    /// Type of funding source provider
    var type: FundingSourceType { get }

    /// Version of data structure
    var version: Int { get }
}
