//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Input required to filter lists by id.
public enum IDFilterInput: Equatable {
    /// Filter by equality of `String`.
    case equals(String)
    /// Filter by non-equality of `String`.
    case notEquals(String)
    /// Filter by less than or equal to `String`
    case lessThanEquals(String)
    /// Filter by less than `String`
    case lessThan(String)
    /// Filter by greater than or equal to `String`
    case greaterThanEquals(String)
    /// Filter by greater than `String`
    case greaterThan(String)
    /// Filter by contains `String`
    case contains(String)
    /// Filter by not contains `String`
    case notContains(String)
    /// Filter items between `String`
    case between([String])
    /// Filter by searching for match that begins with `String`.
    case beginsWith(String)

    func toGraphQL() -> GraphQL.IDFilterInput {
        switch self {
        case let .equals(string):
            return GraphQL.IDFilterInput(eq: string)
        case let .notEquals(string):
            return GraphQL.IDFilterInput(ne: string)
        case let .lessThanEquals(string):
            return GraphQL.IDFilterInput(le: string)
        case let .lessThan(string):
            return GraphQL.IDFilterInput(lt: string)
        case let .greaterThanEquals(string):
            return GraphQL.IDFilterInput(ge: string)
        case let .greaterThan(string):
            return GraphQL.IDFilterInput(gt: string)
        case let .contains(string):
            return GraphQL.IDFilterInput(contains: string)
        case let .notContains(string):
            return GraphQL.IDFilterInput(notContains: string)
        case let .between(strings):
            return GraphQL.IDFilterInput(between: strings)
        case let .beginsWith(string):
            return GraphQL.IDFilterInput(beginsWith: string)
        }
    }
}
