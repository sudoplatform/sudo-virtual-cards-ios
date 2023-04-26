//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of an Owner object from the Virtual Cards Service.
///
/// This represents the relationship of a unique identifier (`id`) with the `issuer`.
public struct Owner: Hashable {

    // MARK: - Properties

    /// Unique Identifier of the owner.
    public let id: String

    /// Issuer of the owner.
    public let issuer: String

    // MARK: - Lifecycle

    /// Initialize an instance of `Owner`.
    public init(id: String, issuer: String) {
        self.id = id
        self.issuer = issuer
    }
}
