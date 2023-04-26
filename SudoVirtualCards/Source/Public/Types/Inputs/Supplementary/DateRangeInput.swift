//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Input for Date ranges.
public struct DateRangeInput: Hashable {

    // MARK: - Properties

    /// Date of which to start the date range.
    public let startDate: Date

    /// Date of which to end the date range.
    public let endDate: Date

    // MARK: - Lifecycle

    public init(startDate: Date, endDate: Date) {
        self.startDate = startDate
        self.endDate = endDate
    }

    // MARK: - Methods: Internal

    func toGraphQL() -> GraphQL.DateRangeInput {
        return .init(endDateEpochMs: endDate.millisecondsSince1970, startDateEpochMs: startDate.millisecondsSince1970)
    }

}
