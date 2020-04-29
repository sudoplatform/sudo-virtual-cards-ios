//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSAppSync

public enum SudoVirtualCardsError: Error, Equatable {
    case notSignedIn
    case invalidConfig
    case unsupportedCurrency
    case cardNotFound
    case cardStateError
    case transactionNotFound
    case currencyMismatch
    case velocityExceeded
    case entitlementExceeded
    case fundingSourceCreationFailed

    init?(_ error: GraphQLError) {
        guard let errorType = error["errorType"] as? String else {
            return nil
        }
        switch errorType {
        case "sudoplatform.virtual-cards.CardNotFoundError":
            self = .cardNotFound
        case "sudoplatform.virtual-cards.CardStateError":
            self = .cardStateError
        case "sudoplatform.virtual-cards.TransactionNotFoundError":
            self = .transactionNotFound
        case "sudoplatform.virtual-cards.CurrencyMismatchError":
            self = .currencyMismatch
        case "sudoplatform.virtual-cards.VelocityExceededError":
            self = .velocityExceeded
        case "sudoplatform.virtual-cards.EntitlementExceededError":
            self = .entitlementExceeded
        default:
            return nil
        }
    }
}

/// Errors associated with the failure of a card provisioning event.
/// - fundingSourceNotFound: The supplied fundingSourceId does not match any recorded funding source.
/// - fundingSourceNotActive: The funding source is not currently active and therefore unavailable to be used.
/// - provisionFailed: Failed to provision a card.
public enum CardProvisionError: Error, Equatable {
    case localKeyPairFailure
    case noOwnershipProofAvailable
    case fundingSourceNotFound
    case fundingSourceNotActive
    case provisionFailed

    init?(_ error: GraphQLError) {
        guard let errorType = error["errorType"] as? String else {
            return nil
        }
        switch errorType {
        case "sudoplatform.virtual-cards.FundingSourceNotFoundError":
            self = .fundingSourceNotFound
        case "sudoplatform.virtual-cards.FundingSourceNotActiveError":
            self = .fundingSourceNotActive
        default:
            return nil
        }
    }
}

/// Errors associated with the failure of a Funding Source provision event.
/// - setupFailed: Failed to setup a funding source.
/// - completionFailed: Failed to complete the funding source process.
/// - cancelFailed: Failed to cancel the funding source.
/// - unsupportedCurrency: Currency provided is not supported.
/// - provisionalFundingSourceNotFound: The provisional funding created during
///     the setup funding source flow could not be found.
/// - fundingSourceNotSetup: The funding source cannot be completed as its setup has not completed successfully.
/// - fundingSourceCompletionDataInvalid: The funding source completion data is invalid.
///     This can occur when there is a mismatch between the completion data and the recorded setup data.
public enum FundingSourceError: Error, Equatable {
    case setupFailed
    case completionFailed
    case cancelFailed
    case unsupportedCurrency
    case provisionalFundingSourceNotFound
    case fundingSourceNotFound
    case fundingSourceNotSetup
    case fundingSourceCompletionDataInvalid

    init?(_ error: GraphQLError) {
        guard let errorType = error["errorType"] as? String else {
            return nil
        }
        switch errorType {
        case "sudoplatform.virtual-cards.UnsupportedCurrencyError":
            self = .unsupportedCurrency
        case "sudoplatform.virtual-cards.ProvisionalFundingSourceNotFoundError":
            self = .provisionalFundingSourceNotFound
        case "sudoplatform.virtual-cards.FundingSourceNotFoundError":
            self = .fundingSourceNotFound
        case "sudoplatform.virtual-cards.FundingSourceNotSetupErrorCode":
            self = .fundingSourceNotSetup
        case "sudoplatform.virtual-cards.FundingSourceCompletionDataInvalidError":
            self = .fundingSourceCompletionDataInvalid
        default:
            return nil
        }
    }
}

/// Errors associated with the update of a card.
public enum UpdateCardError: Error, Equatable {
    case updateFailed
}

/// Errors associated with the cancellationg of a card.
public enum CancelCardError: Error, Equatable {
    case cancelFailed
}

/// Errors associated with the retrieval of a card.
public enum GetCardError: Error, Equatable {
    case getFailed
}

/// Errors associated with the retrieval of Funding Source Client Configuration.
public enum GetFundingSourceClientConfigurationError: Error, Equatable {
    case getFailed
}

/// Errors associated with the retrieval of a transaction.
public enum TransactionError: Error, Equatable {
    case getFailed
}

/// Errors associated with the failure of Public Key Registration Lifecycle events.
/// - registerFailed: Failed to register the Public Key to virtualcards service.
/// - deleteFailed: Failed to delete the Public Key from virtualcards service.
/// - publicKeyNotFound: The id associated with the key could not be found.
/// - keyRingGetFailed: Operation to access a keyring from the serviced failed.
public enum PublicKeyError: Error, Equatable {
    case registerFailed
    case deleteFailed
    case publicKeyNotFound
    case keyRingGetFailed
}
