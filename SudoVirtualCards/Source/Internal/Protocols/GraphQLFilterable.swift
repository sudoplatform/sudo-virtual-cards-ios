//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSAppSync

/// Protocol that provides conformance for the ability to convert to a GraphQL Filter type.
protocol GraphQLFilterable {

    /// GraphQL type to convert to.
    associatedtype OutputType: GraphQLMapConvertible

    /// Converts a type to its GraphQL Filter type.
    ///
    /// - Returns: Converted GraphQL type, or nil if no suitable return object - this is
    ///     typically when all values are nil.
    func toGraphQLFilter() -> OutputType?
}
