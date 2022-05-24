//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Sort order input.
public enum SortOrderInput {
    /// Ascending order.
    case ascending
    /// Descending order.
    case descending

    // MARK: - Methods: Internal

    func toGraphQL() -> GraphQL.SortOrder {
        switch self {
        case .ascending:
            return .asc
        case .descending:
            return .desc
        }
    }
}
