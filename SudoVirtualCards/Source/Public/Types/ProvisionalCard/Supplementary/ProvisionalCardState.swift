//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// State of the Provisional Card.
/// - provisioning: Card is in a provisioning state currently.
/// - completed: Card has finished completed which typically means the card should be accessible
///              by either a `getCard/s` API or via `ProvisionalCard.card` property.
/// - failed: Card is in a failed state and needs to be rectified.
/// - unknown: API Evolution - if this occurs, it may mean you need to update the library.
public enum ProvisionalCardState: Hashable {
    case provisioning
    case completed
    case failed
    case unknown(String)

    /// Initialize an instance of `ProvisionalCardState`.
    init(_ state: GraphQL.ProvisioningState) {
        switch state {
        case .provisioning:
            self = .provisioning
        case .completed:
            self = .completed
        case .failed:
            self = .failed
        case let .unknown(rawValue):
            self = .unknown(rawValue)
        }
    }
}
