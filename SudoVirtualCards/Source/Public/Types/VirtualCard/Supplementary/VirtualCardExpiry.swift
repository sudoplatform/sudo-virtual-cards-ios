//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Expiry of the card.
public struct VirtualCardExpiry: Hashable {

    // MARK: - Properties

    /// Month specifier, in format MM. e.g. (7 == July).
    public let mm: Int

    /// Year specifier, in format YYYY. e.g. (2020 == Year 2020).
    public let yyyy: Int

    // MARK: - Lifecycle

    /// Initialize an instance of `Expiry`.
    public init(mm: Int, yyyy: Int) {
        self.mm = mm
        self.yyyy = yyyy
    }
}
