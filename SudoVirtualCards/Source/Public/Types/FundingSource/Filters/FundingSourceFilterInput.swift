//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public enum FundingSourceStateFilterInput {
    case equals(FundingSourceState)
    case notEquals(FundingSourceState)

    func toGraphQL() -> GraphQL.FundingSourceStateFilterInput {
        switch self {
        case let .equals(state):
            return GraphQL.FundingSourceStateFilterInput(eq: state.toGraphQL())
        case let .notEquals(state):
            return GraphQL.FundingSourceStateFilterInput(ne: state.toGraphQL())
        }
    }
}

/// Input required to filter a provisional funding source list.
public indirect enum FundingSourceFilterInput {
    /// Filter rule for `id` property.
    case id(IDFilterInput)
    /// Filter rule for `state` property.
    case state(FundingSourceStateFilterInput)
    /// Filter rule for logical AND compounding `FundingSourceFilterInput` filter rules.
    case and([FundingSourceFilterInput])
    /// Filter rule for logical OR compounding `FundingSourceFilterInput` filter rules.
    case or([FundingSourceFilterInput])
    /// Filter rule for negating a `FundingSourceFilterInput` filter rule.
    case not(FundingSourceFilterInput)

    // MARK: - Methods: Internal

    func toGraphQL() -> GraphQL.FundingSourceFilterInput {
        switch self {
        case let .id(idFilterInput):
            return GraphQL.FundingSourceFilterInput(id: idFilterInput.toGraphQL())
        case let .state(stateFilterInput):
            return GraphQL.FundingSourceFilterInput(state: stateFilterInput.toGraphQL())
        case let .and(filters):
            let filtersGraphQL = filters.map { $0.toGraphQL() }
            return GraphQL.FundingSourceFilterInput(and: filtersGraphQL)
        case let .or(filters):
            let filtersGraphQL = filters.map { $0.toGraphQL() }
            return GraphQL.FundingSourceFilterInput(or: filtersGraphQL)
        case let .not(filter):
            return GraphQL.FundingSourceFilterInput(not: filter.toGraphQL())
        }
    }
}
