//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Information about the calling client application which equates to service-side configuration
public struct ClientApplicationData: Equatable {

    // MARK: - Properties

    /// Unique application name. Verify with service providers.
    public let applicationName: String

    // MARK: - Lifecycle

    /// Initialize an instance.
    public init(applicationName: String) {
        self.applicationName = applicationName
    }
}
