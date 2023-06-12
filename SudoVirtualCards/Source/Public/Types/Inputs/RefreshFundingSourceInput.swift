//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Input for the refresh data of SudoVirtualCardsClient.refreshFundingSource(withInput:).
public struct CheckoutBankAccountRefreshDataInput: FundingSourceProviderData, Hashable {

    // MARK: - Properties

    /// Identifier of the accountId associated with this funding source
    public let accountId: String?

    /// Authorization text that the user has agreed to for this funding source
    public let authorizationText: AuthorizationText?

    /// Provider used to save the funding source information.
    public let provider: String = "checkout"

    /// Opaque data version
    public let version: Int = 1

    /// Funding source type for which this is the refresh data input; always BANK_ACCOUNT
    public let type: FundingSourceType = .bankAccount

    // MARK: - Lifecycle

    /// Construct a CheckoutBankAccountRefreshDataInput
    ///  - Parameters
    ///   - accountId: The account identifier associated with the funding source being refreshed
    ///   - authorizationText: The authorization text that the user has agreed to as part of the refresh operation
    public init(accountId: String?, authorizationText: AuthorizationText?) {
        self.accountId = accountId
        self.authorizationText = authorizationText
    }
}
/// Provider-agnostic enum for the refresh data of SudoVirtualCardsClient.refreshFundingSource(withInput:).
public enum RefreshDataInput: FundingSourceProviderData, Hashable {
    case checkoutBankAccount(CheckoutBankAccountRefreshDataInput)

    // MARK: - Properties

    public var provider: String {
        switch self {
        case .checkoutBankAccount(let input): return input.provider
        }
    }

    public var type: FundingSourceType {
        switch self {
        case .checkoutBankAccount(let input): return input.type
        }
    }

    public var version: Int {
        switch self {
        case .checkoutBankAccount(let input): return input.version
        }
    }
}

/// Input for SudoVirtualCardsClient.refreshFundingSource(withInput:).
public struct RefreshFundingSourceInput: Equatable {

    // MARK: - Properties

    /// Identifier of the provisional funding source to be refreshed
    public let id: String

    /// The data representation of the refresh data to be passed back to the service.
    public let refreshData: RefreshDataInput

    /// Data about the application used to reference configuration information at the service.
    public let applicationData: ClientApplicationData

    /// Preferred user language for the authorization text display
    public let language: String?

    // MARK: - Lifecycle

    /// Construct a RefreshFundingSourceInput
    ///  - Parameters
    ///   - id: Identifier of the provisional funding source to be completed and provisioned.
    ///   - refreshData: The data representation of the refresh data to be passed back to the service.
    ///   - applicationData: Data about the application used to reference configuration information at the service.
    ///   - language: Preferred user language for the authorization text display
    public init(id: String, refreshData: RefreshDataInput, applicationData: ClientApplicationData, language: String?) {
        self.id = id
        self.refreshData = refreshData
        self.applicationData = applicationData
        self.language = language
    }
}
