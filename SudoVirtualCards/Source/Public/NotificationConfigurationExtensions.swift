//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoNotification

// JSON logic rule matching virtual cards service notification types we do not know how to handle
// This string is compared across platforms and must match across them all.
let defaultFirstRuleString = """
{"!=":[{"var":"meta.type"},"\(VirtualCardsServiceNotificationType.fundingSourceChanged.rawValue)"]}
"""

// Notification filter rule excluding virtual cards service notification types we do not know how to handle
let defaultFirstRule = NotificationFilterItem(
    name: Constants.serviceName,
    status: false,
    rules: defaultFirstRuleString
)

// JSON logic rule that always evaluates to true
let defaultLastRuleString = """
{"==":[1,1]}
"""

// Notification filter defaulting to enable
let defaultLastRule = NotificationFilterItem(
    name: Constants.serviceName,
    status: true,
    rules: defaultLastRuleString
)

public extension NotificationConfiguration {

    // MARK: - Extensions

    ///
    /// Extension function to ensure a [NotificationConfiguration] is initialized for
    /// receipt of virtual cards service notifications.
    ///
    /// - Returns: New NotificationConfiguration with updated rules
    ///
    func initVirtualCardsNotifications() -> NotificationConfiguration {
        var newConfigs = configs.filter { $0.name != Constants.serviceName }

        let vcServiceConfigs = configs
            .filter { $0.name == Constants.serviceName }
            // Filter out any current or historic default rules.
            // We'll add current default rules back in
            .filter { $0.rules != defaultFirstRuleString && $0.rules != defaultLastRuleString }

        newConfigs.append(defaultFirstRule)
        newConfigs.append(contentsOf: vcServiceConfigs)
        newConfigs.append(defaultLastRule)

        return NotificationConfiguration(configs: newConfigs)
    }

    ///
    /// Extension function to add rules to a [NotificationConfiguration] for enabling
    /// or disabling notifications for a particular funding source ID.
    ///
    /// Once all notification configurations across all Sudo platform SDKs have
    /// been performed, call the
    /// `SudoNotificationClient.setNotificationConfiguration`
    /// to set the full notification configuration for your application.
    ///
    /// - Parameters:
    ///   - fundingSourceId: ID of funding source to set notification enablement for
    ///   - enabled: Whether or not notifications are to be enabled or disabled for the
    ///     funding source with the specified ID.
    ///
    /// - Returns: New NotificationConfiguration with updated rules

    func setVirtualCardsNotificationsForFundingSource(fundingSourceId: String, enabled: Bool) -> NotificationConfiguration {
        return setVirtualCardsNotificationsForSingleMeta(metaName: "fundingSourceId", metaValue: fundingSourceId, enabled: enabled)
    }
    ///
    /// Extension function to add rules to a [NotificationConfiguration] for enabling
    /// or disabling notifications for a particular funding source type.
    ///
    /// Once all notification configurations across all Sudo platform SDKs have
    /// been performed, call the
    /// `SudoNotificationClient.setNotificationConfiguration`
    /// to set the full notification configuration for your application.
    ///
    /// - Parameters:
    ///   - fundingSourceType: Type of funding source to set notification enablement for
    ///   - enabled: Whether or not notifications are to be enabled or disabled for the
    ///     funding source with the specified ID.
    ///
    /// - Returns: New NotificationConfiguration with updated rules
    ///
    func setVirtualCardsNotificationsForFundingSourceType(fundingSourceType: FundingSourceType, enabled: Bool) -> NotificationConfiguration {
        return setVirtualCardsNotificationsForSingleMeta(
            metaName: "fundingSourceType",
            metaValue: fundingSourceTypeAsString(fundingSourceType: fundingSourceType),
            enabled: enabled)
    }

    ///
    /// Determine whether or not notifications for a particular funding source are enabled
    ///
    /// - Parameters:
    ///   - forFundingSourceWithId: ID of funding source to determine notification enablement status for
    ///
    /// - Returns: Whether or not notifications are enabled for the particular funding source with given iD
    ///
    func areNotificationsEnabled(forFundingSourceWithId fundingSourceId: String) -> Bool {
        let disablingRule = configs.first {
            $0.name == Constants.serviceName &&
            $0.status == NotificationConfiguration.disabledStatus &&
            isRuleMatchingFundingSourceId(rule: $0.rules, fundingSourceId: fundingSourceId)
        }

        return disablingRule == nil
    }

    ///
    /// Determine whether or not notifications for a particular funding source type are enabled
    ///
    /// - Parameters:
    ///   - forFundingSourceType: Type of funding source to determine notification enablement status for
    ///
    /// - Returns: Whether or not notifications are enabled for the particular funding source type
    ///
    func areNotificationsEnabled(forFundingSourceType fundingSourceType: FundingSourceType) -> Bool {
        let disablingRule = configs.first {
            $0.name == Constants.serviceName &&
            $0.status == NotificationConfiguration.disabledStatus &&
            isRuleMatchingFundingSourceType(rule: $0.rules, fundingSourceType: fundingSourceType)
        }

        return disablingRule == nil
    }

    // MARK: - Helpers

    internal func isRuleMatchingFundingSourceId(rule: String?, fundingSourceId: String) -> Bool {
        return isRuleMatchingSingleMeta(rule: rule, metaName: "fundingSourceId", metaValue: fundingSourceId)
    }

    internal func isRuleMatchingFundingSourceType(rule: String?, fundingSourceType: FundingSourceType) -> Bool {
        return isRuleMatchingSingleMeta(rule: rule, metaName: "fundingSourceType", metaValue: fundingSourceTypeAsString(fundingSourceType: fundingSourceType))
    }

    internal func fundingSourceTypeAsString(fundingSourceType: FundingSourceType) -> String {
        let encoder = JSONEncoder()
        guard let encoded = try? encoder.encode(fundingSourceType) else {
            return "INVALID_FUNDING_SOURCE_TYPE"
        }
        return String(decoding: encoded, as: UTF8.self)
    }

    internal func setVirtualCardsNotificationsForSingleMeta(metaName: String, metaValue: String, enabled: Bool) -> NotificationConfiguration {
        // Start with any rules for other services
        var newRules = configs
            .filter { $0.name != Constants.serviceName }

        // Then find all the virtual cards service rules except our defaults and
        // any existing rule matching this funding source ID.
        let newVcServiceRules = configs
            .filter { $0.name == Constants.serviceName }
            // Filter out any current or historic default rules.
            // We'll add current default rules back in
            .filter { $0.rules != defaultFirstRuleString && $0.rules != defaultLastRuleString }
            // Filter out any rule specific to our fundingSourceId
            .filter { !isRuleMatchingSingleMeta(rule: $0.rules, metaName: metaName, metaValue: metaValue) }

        // Re-add DEFAULT_FIRST_RULE
        newRules.append(defaultFirstRule)

        // Re-add virtual cards service rules for other addresses
        newRules.append(contentsOf: newVcServiceRules)

        // If we're disabling notifications for this funding source then
        // add an explicit rule for that
        if !enabled {
            let newJsonRule = """
                {"==":[{"var":"meta.\(metaName)"},"\(metaValue)"]}
                """
            newRules.append(
                NotificationFilterItem(
                    name: Constants.serviceName,
                    status: false,
                    rules: newJsonRule
                )
            )
        }

        // Re-add the default catch all enabling rule
        newRules.append(defaultLastRule)

        return NotificationConfiguration(configs: newRules)
    }
    
    internal func isRuleMatchingSingleMeta(rule: String?, metaName: String, metaValue: String) -> Bool {
        guard let rule = rule?.data(using: .utf8) else {
            return false
        }

        guard let json = try? JSONSerialization.jsonObject(with: rule, options: []) as? [String: Any] else {
            return false
        }

        let equality = json["=="]
        guard let array = equality as? [Any], array.count == 2 else {
            return false
        }

        let lhs = array[0]
        let rhs = array[1]

        // "var meta.fundingSourceId == fundingSourceId"
        if lhs is [String: Any] && rhs is String {
            guard let lhs = lhs as? [String: Any],
                  let rhs = rhs as? String,
                  let v = lhs["var"] as? String else {
                return false
            }
            if v == "meta.\(metaName)" && rhs == metaValue {
                return true
            }
        }

        // "fundingSourceId == var meta.fundingSourceId"
        else if rhs is [String: Any] && lhs is String {
            guard let lhs = lhs as? String,
                  let rhs = rhs as? [String: Any],
                  let v = rhs["var"] as? String else {
                return false
            }
            if v == "meta.\(metaName)" && lhs == metaValue {
                return true
            }
        }

        return false
    }

}
