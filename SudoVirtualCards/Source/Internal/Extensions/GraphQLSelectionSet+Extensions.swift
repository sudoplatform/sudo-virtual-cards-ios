//
// Copyright © 2025 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Amplify
import Foundation
import SudoApiClient

/// Note: there is a bug with the Amplify codegen types where enum properties cannot be accessed directly or it will cause a crash.
/// These extension methods have been added to provide an alternate way to fetch the enum properties in the short term
/// until the bug is fixed.
/// https://github.com/aws-amplify/amplify-swift/issues/3953
extension GraphQLSelectionSet {

    func getEnumValue<T: GraphQLEnum>(_ type: T.Type) -> T {
        guard let rawValue = snapshot[type.key] as? T.RawValue else {
            return type.getDefaultValue(from: nil)
        }
        return T(rawValue: rawValue) ?? type.getDefaultValue(from: rawValue)
    }

    func getOptionalEnumValue<T: GraphQLEnum>(_ type: T.Type) -> T? {
        guard let rawValue = snapshot[type.key] as? T.RawValue else {
            return nil
        }
        guard let value = T(rawValue: rawValue) else {
            return type.getDefaultValue(from: rawValue)
        }
        return value
    }

    func getEnumArrayValue<T: GraphQLEnum>(_ type: T.Type) -> [T] {
        guard let rawValues = snapshot[type.key] as? [T.RawValue] else {
            return []
        }
        return rawValues.map { T(rawValue: $0) ?? type.getDefaultValue(from: $0) }
    }

    func getKeyFormat() -> GraphQL.KeyFormat {
        getEnumValue(GraphQL.KeyFormat.self)
    }

    func getCardState() -> GraphQL.CardState {
        getEnumValue(GraphQL.CardState.self)
    }

    func getCardType() -> GraphQL.CardType {
        getEnumValue(GraphQL.CardType.self)
    }

    func getFundingSourceType() -> GraphQL.FundingSourceType {
        getEnumValue(GraphQL.FundingSourceType.self)
    }

    func getFundingSourceState() -> GraphQL.FundingSourceState {
        getEnumValue(GraphQL.FundingSourceState.self)
    }

    func getProvisionalFundingSourceState() -> GraphQL.ProvisionalFundingSourceState {
        getEnumValue(GraphQL.ProvisionalFundingSourceState.self)
    }

    func getFundingSourceFlags() -> [GraphQL.FundingSourceFlags] {
        getEnumArrayValue(GraphQL.FundingSourceFlags.self)
    }

    func getCreditCardNetwork() -> GraphQL.CreditCardNetwork {
        getEnumValue(GraphQL.CreditCardNetwork.self)
    }

    func getProvisioningState() -> GraphQL.ProvisioningState {
        getEnumValue(GraphQL.ProvisioningState.self)
    }

    func getTransactionType() -> GraphQL.TransactionType {
        getEnumValue(GraphQL.TransactionType.self)
    }
}

protocol GraphQLEnum: RawRepresentable {
    static var key: String { get }
    static func getDefaultValue(from rawValue: Self.RawValue?) -> Self
}

extension GraphQL.KeyFormat: GraphQLEnum {
    static var key: String { "keyFormat" }
    static func getDefaultValue(from rawValue: Self.RawValue?) -> Self {
        .unknown(rawValue ?? "")
    }
}

extension GraphQL.CardState: GraphQLEnum {
    static var key: String { "state" }
    static func getDefaultValue(from rawValue: Self.RawValue?) -> Self {
        .unknown(rawValue ?? "")
    }
}

extension GraphQL.CardType: GraphQLEnum {
    static var key: String { "cardType" }
    static func getDefaultValue(from rawValue: Self.RawValue?) -> Self {
        .unknown(rawValue ?? "")
    }
}

extension GraphQL.FundingSourceType: GraphQLEnum {
    static var key: String { "type" }
    static func getDefaultValue(from rawValue: Self.RawValue?) -> Self {
        .unknown(rawValue ?? "")
    }
}

extension GraphQL.ProvisionalFundingSourceState: GraphQLEnum {
    static var key: String { "state" }
    static func getDefaultValue(from rawValue: Self.RawValue?) -> Self {
        .unknown(rawValue ?? "")
    }
}

extension GraphQL.FundingSourceState: GraphQLEnum {
    static var key: String { "state" }
    static func getDefaultValue(from rawValue: Self.RawValue?) -> Self {
        .unknown(rawValue ?? "")
    }
}

extension GraphQL.FundingSourceFlags: GraphQLEnum {
    static var key: String { "flags" }
    static func getDefaultValue(from rawValue: Self.RawValue?) -> Self {
        .unknown(rawValue ?? "")
    }
}

extension GraphQL.CreditCardNetwork: GraphQLEnum {
    static var key: String { "network" }
    static func getDefaultValue(from rawValue: Self.RawValue?) -> Self {
        .unknown(rawValue ?? "")
    }
}

extension GraphQL.ProvisioningState: GraphQLEnum {
    static var key: String { "provisioningState" }
    static func getDefaultValue(from rawValue: Self.RawValue?) -> Self {
        .unknown(rawValue ?? "")
    }
}

extension GraphQL.TransactionType: GraphQLEnum {
    static var key: String { "type" }
    static func getDefaultValue(from rawValue: Self.RawValue?) -> Self {
        .unknown(rawValue ?? "")
    }
}
