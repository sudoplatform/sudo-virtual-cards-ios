//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoLogging
import SudoNotificationExtension

/// SudoNoitifiableClient implementation for decoding Sudo Platform VirtualCards service push notifications in a Notification Service Extension
public class DefaultSudoVirtualCardsNotifiableClient: SudoNotifiableClient {

    // MARK: - Properties

    private let logger: Logger
    private let decoder: JSONDecoder


    // MARK: - Lifecycle

    /// Construct a new DefaultSudoVirtualCardsNotifiableClient
    ///
    public convenience init() {

        let defaultLogger = Logger.virtualCardsSDKLogger

        self.init(logger: defaultLogger)
    }

    /// Internal constructor to allow for provision of non-default properties for testing
    init(logger: Logger) {
        self.decoder = JSONDecoder()
        self.logger = logger
    }

    // MARK: - Conformance: SudoNotifiableClient

    public let serviceName = Constants.serviceName

    /// Decrypt and decode a Sudo Platform VirtualCards service push notification
    ///
    /// - Parameters:
    ///   - data: The payload as returned by DefaultSudoNotificationClient's extractData method
    ///
    public func decode(data: String) -> any SudoNotification {
        guard let virtualCardsServiceNotification = try? decoder.decode(VirtualCardsServiceNotification.self, from: data.data(using: .utf8)!) else {
            logger.error("Unable to decode notification data \(data)")
            return VirtualCardsUnknownNotification(type: Constants.serviceName)
        }

        return virtualCardsServiceNotification.toSudoNotification()
    }
}
