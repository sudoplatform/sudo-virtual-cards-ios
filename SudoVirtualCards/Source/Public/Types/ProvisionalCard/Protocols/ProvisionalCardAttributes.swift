//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public protocol ProvisionalCardAttributes {

    /// Identifier generated by the Virtual Cards Service.
    var id: String { get set }

    /// VirtualCards service timestamp to when the card entry was created.
    var createdAt: Date { get set }

    /// VirtualCards service timestamp to when the card entry was last updated.
    var updatedAt: Date { get set }

    /// Client Reference ID generated by the client.
    var clientRefId: String { get set }

    /// Current state of the cards status.
    var state: ProvisionalCardState { get set }

}
