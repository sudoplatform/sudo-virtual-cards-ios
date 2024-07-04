//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public enum ProvisionalFundingSourceStateFilterInput {
    case equals(ProvisionalFundingSourceState)
    case notEquals(ProvisionalFundingSourceState)

    func toGraphQL() -> GraphQL.ProvisionalFundingSourceStateFilterInput {
        switch self {
        case let .equals(state):
            return GraphQL.ProvisionalFundingSourceStateFilterInput(eq: state.toGraphQL())
        case let .notEquals(state):
            return GraphQL.ProvisionalFundingSourceStateFilterInput(ne: state.toGraphQL())
        }
    }
}

/// Input required to filter a provisional funding source list.
public indirect enum ProvisionalFundingSourceFilterInput {
    /// Filter rule for `id` property.
    case id(IDFilterInput)
    /// Filter rule for `state` property.
    case state(ProvisionalFundingSourceStateFilterInput)
    /// Filter rule for logical AND compounding `ProvisionalFundingSourceFilterInput` filter rules.
    case and([ProvisionalFundingSourceFilterInput])
    /// Filter rule for logical OR compounding `ProvisionalFundingSourceFilterInput` filter rules.
    case or([ProvisionalFundingSourceFilterInput])
    /// Filter rule for negating a `ProvisionalFundingSourceFilterInput` filter rule.
    case not(ProvisionalFundingSourceFilterInput)

    // MARK: - Methods: Internal

    func toGraphQL() -> GraphQL.ProvisionalFundingSourceFilterInput {
        switch self {
        case let .id(idFilterInput):
            return GraphQL.ProvisionalFundingSourceFilterInput(id: idFilterInput.toGraphQL())
        case let .state(stateFilterInput):
            return GraphQL.ProvisionalFundingSourceFilterInput(state: stateFilterInput.toGraphQL())
        case let .and(filters):
            let filtersGraphQL = filters.map { $0.toGraphQL() }
            return GraphQL.ProvisionalFundingSourceFilterInput(and: filtersGraphQL)
        case let .or(filters):
            let filtersGraphQL = filters.map { $0.toGraphQL() }
            return GraphQL.ProvisionalFundingSourceFilterInput(or: filtersGraphQL)
        case let .not(filter):
            return GraphQL.ProvisionalFundingSourceFilterInput(not: filter.toGraphQL())
        }
    }
}
