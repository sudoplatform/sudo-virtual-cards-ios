//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Input for the completion data of SudoVirtualCardsClient.completeFundingSource(withInput:).
public struct StripeCompletionDataInput: Equatable {

    // MARK: - Properties

    /// Identifier of the Payment Method used.
    public let paymentMethodId: String

    /// Provider used to save the funding source information.
    public let provider: String = "stripe"

    public let version: Int = 1

    // MARK: - Lifecycle

    public init(paymentMethodId: String) {
        self.paymentMethodId = paymentMethodId
    }
}

public typealias CompletionDataInput = StripeCompletionDataInput

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
