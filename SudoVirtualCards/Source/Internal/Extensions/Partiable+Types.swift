//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

extension GraphQL.UpdateVirtualCardMutation.Data.UpdateCard: Partiable {
    var sortDateEpochMs: Double? {
        get {
            return nil
        }
        // swiftlint:disable:next unused_setter_value
        set {
            return
        }
    }

}

extension GraphQL.CancelVirtualCardMutation.Data.CancelCard: Partiable {
    var sortDateEpochMs: Double? {
        get {
            return nil
        }
        // swiftlint:disable:next unused_setter_value
        set {
            return
        }
    }

}
