//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Delegate class used in provisioning funding source.
///
/// This delegate is passed to a funding source creation method to ensure that further required authentication
/// can be served to the user.
public protocol FundingSourceAuthorizationDelegate: class {

    /// Optional return URL to provide to any supported web hooks so they can automatically handle UI flows via `openURL` etc.
    /// Sample: "<your-app>://some/url"
    var returnURL: String? { get }

    /// Will return the view controller to present any additional authorization requests from.
    func fundingSourceAuthorizationPresentingViewController() -> UIViewController
}
