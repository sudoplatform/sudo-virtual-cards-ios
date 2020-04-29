//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSAppSync

/// Enum containing the various types of filter available by the service.
public enum FilterInput<T: Equatable>: Equatable {
    /// Filter by equality of associated value.
    case equals(T)
    /// Filter by non-equality of associated value.
    case notEquals(T)
    /// Filter by less than or equal to associated value.
    case lessThanOrEquals(T)
    /// Filter by less than of associated value.
    case lessThan(T)
    /// Filter by greater than or equal to associated value.
    case greaterThanOrEquals(T)
    /// Filter by greater than of associated value.
    case greaterThan(T)
    /// Filter by searching for matches containing associated value.
    case contains(T)
    /// Filter by searching for matches that don't contain associated value.
    case notContains(T)
    /// Filter by searching between the two associated value.
    case between(low: T, high: T)
    /// Filter by searching for match that begins with associated value.
    case beginsWith(T)
}

extension FilterInput where T == String {

    // MARK: - GraphQL Translation

    /// Convert To the GraphQL format filter `IDFilterInput`.
    func toGraphQLFilter() -> IDFilterInput {
        switch self {
        case let .equals(val):
            return IDFilterInput(eq: val)
        case let .notEquals(val):
            return IDFilterInput(ne: val)
        case let .lessThanOrEquals(val):
            return IDFilterInput(le: val)
        case let .lessThan(val):
            return IDFilterInput(lt: val)
        case let .greaterThanOrEquals(val):
            return IDFilterInput(ge: val)
        case let .greaterThan(val):
            return IDFilterInput(gt: val)
        case let .contains(val):
            return IDFilterInput(contains: val)
        case let .notContains(val):
            return IDFilterInput(notContains: val)
        case let .between(low, high):
            return IDFilterInput(between: [low, high])
        case let .beginsWith(val):
            return IDFilterInput(beginsWith: val)
        }
    }

    /// Asserts whether the `input` matches the filters predicate.
    func matchesPredicate(_ input: String) -> Bool {
        switch self {
        case let .equals(value):
            return input == value
        case let .notEquals(value):
            return input != value
        case let .lessThanOrEquals(value):
            return input <= value
        case let .lessThan(value):
            return input < value
        case let .greaterThanOrEquals(value):
            return input >= value
        case let .greaterThan(value):
            return input > value
        case let .contains(value):
            return input.contains(value)
        case let .notContains(value):
            return !input.contains(value)
        case let .between(low, high):
            return input >= low && input <= high
        case let .beginsWith(value):
            return input.starts(with: value)
        }
    }
}

extension FilterInput where T == Card.State {

    // MARK: - GraphQL Translation

    /// Converts the `Card.State` `FilterInput` to a `String` `FilterInput`.
    ///
    /// This provides simpler conversion to GraphQL supported filters.
    func toStringFilter() -> FilterInput<String> {
        switch self {
        case let .equals(value):
            return FilterInput<String>.equals(value.description)
        case let .notEquals(value):
            return FilterInput<String>.notEquals(value.description)
        case let .lessThanOrEquals(value):
            return FilterInput<String>.lessThanOrEquals(value.description)
        case let .lessThan(value):
            return FilterInput<String>.lessThan(value.description)
        case let .greaterThanOrEquals(value):
            return FilterInput<String>.greaterThanOrEquals(value.description)
        case let .greaterThan(value):
            return FilterInput<String>.greaterThan(value.description)
        case let .contains(value):
            return FilterInput<String>.contains(value.description)
        case let .notContains(value):
            return FilterInput<String>.notContains(value.description)
        case let .between(low, high):
            return FilterInput<String>.between(low: low.description, high: high.description)
        case let .beginsWith(value):
            return FilterInput<String>.beginsWith(value.description)
        }
    }

    /// Convert To the GraphQL format filter `IDFilterInput`.
    func toGraphQLFilter() -> IDFilterInput {
        return toStringFilter().toGraphQLFilter()
    }

    /// Asserts whether the `input` matches the filters predicate.
    func matchesPredicate(_ input: String) -> Bool {
        return toStringFilter().matchesPredicate(input)
    }
}

// MARK: - Concrete Filter Inputs

/// Filter input for `SudoVirtualCardsClient.getProvisionalCardsWithFilter(_:`
public struct GetProvisionalCardsFilterInput: GraphQLFilterable, Equatable {

    // MARK: - Properties

    /// Filter input for the `clientRefId` property.
    public let clientRefId: FilterInput<String>?

    // MARK: - Lifecycle

    /// Initialize an instance of `GetProvisionalCardsFilterInput`.
    public init(clientRefId: FilterInput<String>? = nil) {
        self.clientRefId = clientRefId
    }

    // MARK: - Conformance: GraphQLFilterable

    func toGraphQLFilter() -> ProvisionalCardFilterInput? {
        // Circumvents VTL bug where defined filter with no values fails.
        if clientRefId == nil {
            return nil
        }
        let clientRefId: IDFilterInput?? = self.clientRefId?.toGraphQLFilter() ?? Optional(nil)
        return ProvisionalCardFilterInput(clientRefId: clientRefId)
    }
}

/// Kept for future use.
/// Filter input for `SudoVirtualCardsClient.getCardsWithFilter(_:`
public struct GetCardsFilterInput: GraphQLFilterable, Equatable {

    // MARK: - Properties

    /// Filter input for the `state` property.
    public let state: FilterInput<Card.State>?

    // MARK: - Lifecycle

    /// Initialize an instance of `GetCardsFilterInput`.
    public init(state: FilterInput<Card.State>? = nil) {
        self.state = state
    }

    // MARK: - Conformance: GraphQLFilterable

    func toGraphQLFilter() -> CardFilterInput? {
        // Circumvents VTL bug where defined filter with no values fails.
        if state == nil {
            return nil
        }
        // Deals with the weird null vs undefined of js.
        let state: IDFilterInput?? = self.state?.toGraphQLFilter() ?? Optional(nil)

        return CardFilterInput(state: state)
    }
}

/// Filter input for `SudoVirtualCardsClient.getTransactionsWithFilter(_:`
public struct GetTransactionsFilterInput: GraphQLFilterable, Equatable {

    // MARK: - Properties

    /// Filter input for the `cardId` property.
    public let cardId: FilterInput<String>?

    /// Filter input for the `sequenceId` property.
    public let sequenceId: FilterInput<String>?

    // MARK: - Lifecycle

    /// Initialize an instance of `GetTransactionsFilterInput`.
    public init(cardId: FilterInput<String>? = nil, sequenceId: FilterInput<String>? = nil) {
        self.cardId = cardId
        self.sequenceId = sequenceId
    }

    // MARK: - Conformance: GraphQLFilterable

    func toGraphQLFilter() -> TransactionFilterInput? {
        // Circumvents VTL bug where defined filter with no values fails.
        if cardId == nil && sequenceId == nil {
            return nil
        }
        if let cardId = self.cardId?.toGraphQLFilter() {
            return TransactionFilterInput(cardId: cardId)
        }
        return nil
    }
}
