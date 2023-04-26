//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

extension ListAPIResult {

    /// Returns an empty success `ListAPIResult`.
    static var empty: Self {
        return Self.success(.init(items: []))
    }
}
