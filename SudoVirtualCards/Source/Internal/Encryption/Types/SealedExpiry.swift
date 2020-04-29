//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Internal protocol for Sealed Expiries, used to allow for protocol conformance to GraphQL API.
internal protocol _SealedExpiry {

    /// Sealed Month specifier, in format MM. e.g. (07 == July).
    var mm: String { get set }

    /// Sealed Year specifier, in format YYYY. e.g. (2020 == Year 2020).
    var yyyy: String { get set }
}

/// Struct implementation of `_SealedExpiry`. All fields are encrypted.
public struct SealedExpiry: _SealedExpiry, Hashable {

    // MARK: - Properties
    public var mm: String
    public var yyyy: String

    // MARK: - Lifecycle

    /// Initialize a `SealedExpiry`.
    public init(mm: String, yyyy: String) {
        self.mm = mm
        self.yyyy = yyyy
    }

    /// Initialize a `SealedExpiry` using a GraphQL API conforming object.
    init(_ object: _SealedExpiry) {
        self.mm = object.mm
        self.yyyy = object.yyyy
    }
}
