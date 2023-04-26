//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SudoLogging

extension Logger {

    /// Logger used internally in the SudoVirtualCards.
    static let platformUtilitySDK = Logger(identifier: "PlatformUtilitySDK", driver: NSLogDriver(level: .debug))
}
