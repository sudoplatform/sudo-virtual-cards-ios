//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoNotification

public class DefaultSudoVirtualCardsNotificationFilterClient: SudoNotificationFilterClient {

    public let serviceName = Constants.serviceName

    static let schema = NotificationMetaData(serviceName: Constants.serviceName, schema: [
        NotificationSchemaEntry(
            description: "Type of notification message",
            fieldName: "meta.type",
            type: "string"
        ),
        NotificationSchemaEntry(
            description: "ID of funding source to match",
            fieldName: "meta.fundingSourceId",
            type: "string"
        ),
        NotificationSchemaEntry(
            description: "Type of funding source to match",
            fieldName: "meta.fundingSourceType",
            type: "string"
        )
    ])

    public init() {}

    public func getSchema() -> NotificationMetaData { return DefaultSudoVirtualCardsNotificationFilterClient.schema }
}
