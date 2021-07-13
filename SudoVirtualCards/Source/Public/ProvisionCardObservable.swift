//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Observable to define behavior for Provision Card API events.
public protocol ProvisionCardObservable: AnyObject {

    /// Card Provision state has changed.
    func provisioningStateDidChange(_ state: ProvisionalCard.State, card: Card?)

    /// Error occurred while provisioning.
    func errorOccurred(_ error: Error)
}
