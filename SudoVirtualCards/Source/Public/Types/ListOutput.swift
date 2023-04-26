//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Generic Type to wrap around an Output SudoVirtualCard type from a List result.
///
/// This is useful for pagination requests and can use its `nextToken` to call the next paginated results.
public struct ListOutput<T> {

    // MARK: - Properties

    /// Items returned by a List query output.
    public let items: [T]

    /// Next token to call next page of paginated results.
    public let nextToken: String?

    // MARK: - Lifecycle

    /// Returns an empty ListOutput.
    static var empty: Self {
        return Self.init(items: [])
    }

    /// Initialize an instance of ListOutput.
    public init(items: [T], nextToken: String? = nil) {
        self.items = items
        self.nextToken = nextToken
    }
}

/// Ensures that ListOutput conforms to Equatable if its item T type conforms.
extension ListOutput: Equatable where T: Equatable {}
