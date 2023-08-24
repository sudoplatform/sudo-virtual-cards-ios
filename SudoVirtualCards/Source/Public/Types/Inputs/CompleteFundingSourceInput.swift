//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Input for the completion data of SudoVirtualCardsClient.completeFundingSource(withInput:).
public struct StripeCardCompletionDataInput: Hashable, FundingSourceProviderData {

    // MARK: - Properties

    /// Identifier of the Payment Method used.
    public let paymentMethodId: String

    /// Provider used to save the funding source information.
    public let provider: String = "stripe"

    public let version: Int = 1

    public let type: FundingSourceType = .creditCard

    // MARK: - Lifecycle

    public init(paymentMethodId: String) {
        self.paymentMethodId = paymentMethodId
    }
}

typealias StripeCompletionDataInput = StripeCardCompletionDataInput

/// Input for the completion data of SudoVirtualCardsClient.completeFundingSource(withInput:).
public struct CheckoutCardCompletionDataInput: Hashable, FundingSourceProviderData {

    // MARK: - Properties

    /// Specifies payment token being setup or nil if calling back after completing
    /// required user interaction
    public let paymentToken: String?

    /// Provider used to save the funding source information.
    public let provider: String = "checkout"

    public let version: Int = 1

    public let type: FundingSourceType = .creditCard

    // MARK: - Lifecycle

    public init(paymentToken: String?) {
        self.paymentToken = paymentToken
    }
}

/// Input for the completion data of SudoVirtualCardsClient.completeFundingSource(withInput:).
public struct CheckoutBankAccountCompletionDataInput: Hashable, FundingSourceProviderData {

    // MARK: - Properties

    /// Token to be exchanged in order to perform bank account operations.
    public let publicToken: String
    /// Identifier of the bank account to be used.
    public let accountId: String
    /// Identifier of the institution at which account to be used is held.
    public let institutionId: String
    /// Authorization text presented to and agreed to by the user.
    public let authorizationText: AuthorizationText

    /// Provider used to save the funding source information.
    public let provider: String = "checkout"

    public let version: Int = 1

    public let type: FundingSourceType = .bankAccount

    // MARK: - Lifecycle

    public init(publicToken: String, accountId: String, institutionId: String, authorizationText: AuthorizationText) {
        self.publicToken = publicToken
        self.accountId = accountId
        self.institutionId = institutionId
        self.authorizationText = authorizationText
    }
}

public enum CompletionDataInput: Hashable, FundingSourceProviderData {
    case stripeCard(StripeCardCompletionDataInput)
    case checkoutCard(CheckoutCardCompletionDataInput)
    case checkoutBankAccount(CheckoutBankAccountCompletionDataInput)

    // MARK: - Properties

    public var provider: String {
        switch self {
        case .stripeCard(let input): return input.provider
        case .checkoutCard(let input): return input.provider
        case .checkoutBankAccount(let input): return input.provider
        }
    }

    public var type: FundingSourceType {
        switch self {
        case .stripeCard(let input): return input.type
        case .checkoutCard(let input): return input.type
        case .checkoutBankAccount(let input): return input.type
        }
    }

    public var version: Int {
        switch self {
        case .stripeCard(let input): return input.version
        case .checkoutCard(let input): return input.version
        case .checkoutBankAccount(let input): return input.version
        }
    }
}

/// Input for SudoVirtualCardsClient.completeFundingSource(withInput:).
public struct CompleteFundingSourceInput: Equatable {

    // MARK: - Properties

    /// Identifier of the provisional funding source to be completed and provisioned.
    public let id: String

    /// JSON string of the completion data to be passed back to the service.
    public let completionData: CompletionDataInput

    // MARK: - Lifecycle

    public init(id: String, completionData: CompletionDataInput) {
        self.id = id
        self.completionData = completionData
    }
}
