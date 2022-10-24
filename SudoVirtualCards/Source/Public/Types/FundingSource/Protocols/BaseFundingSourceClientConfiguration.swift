//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public protocol BaseFundingSourceClientConfiguration {
    var type: String { get }
    var fundingSourceType: FundingSourceType { get }
    var version: Int { get }
}
