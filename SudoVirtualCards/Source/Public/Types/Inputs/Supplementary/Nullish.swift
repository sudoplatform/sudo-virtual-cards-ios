//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Wrapped enum for types that can be null, undefined, or defined.
public enum Nullish<Wrapped>: ExpressibleByNilLiteral {
    /// Object is semantically null.
    case null
    /// Object is semantically undefined (same as `nil`).
    case undefined
    /// Object is defined.
    case defined(Wrapped)

    public init(nilLiteral: ()) {
        self = .undefined
    }

}

extension Nullish: Equatable where Wrapped: Equatable {}
