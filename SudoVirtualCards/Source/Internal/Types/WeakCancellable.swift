//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSAppSync

/// Wrapper around a `Cancellable` to allow the ability to keep a collection of weak references to a `Cancellable`.
struct WeakCancellable {
    /// Weak reference to `Cancellable` If `nil` ARC has cleaned up its reference.
    weak var value: Cancellable?
}
