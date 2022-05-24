//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Partiables can be converted to a Partial Result.
protocol Partiable {
    var id: String { get set }
    var createdAtEpochMs: Double { get set }
    var updatedAtEpochMs: Double { get set }
    var sortDateEpochMs: Double? { get set }
}
