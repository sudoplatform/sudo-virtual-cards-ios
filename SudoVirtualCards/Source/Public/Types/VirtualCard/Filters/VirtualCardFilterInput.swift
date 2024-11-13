//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Input required to filter a virtual card source list.
public indirect enum VirtualCardFilterInput {
    /// Filter rule for `id` property.
    case id(IDFilterInput)
    /// Filter rule for `state` property.
    case state(IDFilterInput)
    /// Filter rule for logical AND compounding `VirtualCardFilterInput` filter rules.
    case and([VirtualCardFilterInput])
    /// Filter rule for logical OR compounding `VirtualCardFilterInput` filter rules.
    case or([VirtualCardFilterInput])
    /// Filter rule for negating a `VirtualCardFilterInput` filter rule.
    case not(VirtualCardFilterInput)

    // MARK: - Methods: Internal

    func toGraphQL() -> GraphQL.CardFilterInput {
        switch self {
        case let .id(idFilterInput):
            return GraphQL.CardFilterInput(id: idFilterInput.toGraphQL())
        case let .state(stateFilterInput):
            return GraphQL.CardFilterInput(state: stateFilterInput.toGraphQL())
        case let .and(filters):
            let filtersGraphQL = filters.map { $0.toGraphQL() }
            return GraphQL.CardFilterInput(and: filtersGraphQL)
        case let .or(filters):
            let filtersGraphQL = filters.map { $0.toGraphQL() }
            return GraphQL.CardFilterInput(or: filtersGraphQL)
        case let .not(filter):
            return GraphQL.CardFilterInput(not: filter.toGraphQL())
        }
    }
}
