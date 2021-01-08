//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoOperations
import AWSAppSync

/// Errors that occur in SudoVirtualCards.
public enum SudoVirtualCardsError: Error, Equatable, LocalizedError {
    // MARK: - Client

    /// Configuration supplied to `DefaultSudoVirtualCardsClient` is invalid.
    case invalidConfig
    /// User is not signed in.
    case notSignedIn
    /// Failed to create a funding source.
    case fundingSourceCreationFailed
    /// Local key pair failure.
    case localKeyPairFailure
    /// No ownership proof is available.
    case noOwnershipProofAvailable
    /// Failed to provision a card.
    case provisionFailed
    /// Failed to setup a funding source.
    case setupFailed
    /// Failed to complete the funding source process.
    case completionFailed
    /// Failed to cancel.
    case cancelFailed
    /// Failed to update.
    case updateFailed
    /// Failed to retrieve.
    case getFailed

    // MARK: - Service

    /// The card id supplied could not be found.
    case cardNotFound
    /// The card used is in a bad/unsupported state.
    case cardStateError
    /// The transaction id supplied could not be found.
    case transactionNotFound
    /// There is a currency mismatch between inputs.
    case currencyMismatch
    /// The velocity for the card is exceeded.
    case velocityExceeded
    /// The entitlement for the card is exceeded.
    case entitlementExceeded
    /// The provisional funding created during the setup funding source flow could not be found.
    case provisionalFundingSourceNotFound
    /// The supplied fundingSourceId does not match any recorded funding source.
    case fundingSourceNotFound
    /// The funding source is not currently active and therefore unavailable to be used.
    case fundingSourceNotActive
    /// Currency provided is not supported.
    case unsupportedCurrency
    /// The funding source cannot be completed as its setup has not completed successfully.
    case fundingSourceNotSetup
    /// The funding source completion data is invalid.
    ///
    /// This can occur when there is a mismatch between the completion data and the recorded setup data.
    case fundingSourceCompletionDataInvalid
    /// The funding source or provisional funding source is in an invalid state for the requested operation
    case fundingSourceStateError
    /// The funding source failed attempts to validate e.g. as determined when making an initial
    /// authorization. Reasons for being unacceptable include insufficient funds if a preauthorization is
    /// performed, the funding source is high risk and other reasons.
    case unacceptableFundingSource

    // MARK: - SudoPlatformError

    /**
      * This section contains wrapped erros from `SudoPlatformError`.
     */

    case serviceError
    case decodingError
    case environmentError
    case policyFailed
    case invalidTokenError
    case accountLockedError
    case identityInsufficient
    case identityNotVerified
    case unknownTimezone
    case insufficientEntitlements
    case noEntitlements
    case internalError(_ cause: String?)
    case invalidArgument(_ msg: String?)

    // MARK: - Lifecycle

    /// Initialize a `SudoVirtualCardsError` from a `GraphQLError`.
    ///
    /// If the GraphQLError is unsupported, `nil` will be returned instead.
    init?(graphQLError error: GraphQLError) {
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
        case "sudoplatform.virtual-cards.ProvisionalFundingSourceNotFoundError":
            self = .provisionalFundingSourceNotFound
        case "sudoplatform.virtual-cards.FundingSourceNotFoundError":
            self = .fundingSourceNotFound
        case "sudoplatform.virtual-cards.FundingSourceNotActiveError":
            self = .fundingSourceNotActive
        case "sudoplatform.virtual-cards.UnsupportedCurrencyError":
            self = .unsupportedCurrency
        /// Service is currently incorrectly generating this error with a Code suffix.
        /// Prepare for that to be fixed
        case "sudoplatform.virtual-cards.FundingSourceNotSetupError":
            self = .fundingSourceNotSetup
        case "sudoplatform.virtual-cards.FundingSourceNotSetupErrorCode":
            self = .fundingSourceNotSetup
        case "sudoplatform.virtual-cards.FundingSourceCompletionDataInvalidError":
            self = .fundingSourceCompletionDataInvalid
        case "sudoplatform.virtual-cards.FundingSourceStateError":
            self = .fundingSourceStateError
        case "sudoplatform.virtual-cards.UnacceptableFundingSourceError":
            self = .unacceptableFundingSource
        default:
            return nil
        }
    }

    /// Initialize a `SudoVirtualCardsError` from a `SudoPlatformError`.
    init(platformError error: SudoPlatformError) {
        switch error {
        case .serviceError:
            self = .serviceError
        case .decodingError:
            self = .decodingError
        case .environmentError:
            self = .environmentError
        case .policyFailed:
            self = .policyFailed
        case .invalidTokenError:
            self = .invalidTokenError
        case .accountLockedError:
            self = .accountLockedError
        case .identityInsufficient:
            self = .identityInsufficient
        case .identityNotVerified:
            self = .identityNotVerified
        case .unknownTimezone:
            self = .unknownTimezone
        case .insufficientEntitlementsError:
            self = .insufficientEntitlements
        case .noEntitlementsError:
            self = .noEntitlements
        case let .internalError(cause):
            self = .internalError(cause)
        case let .invalidArgument(msg):
            self = .invalidArgument(msg)
        }
    }

    // MARK: - Conformance: LocalizedError

    public var errorDescription: String? {
        switch self {
        case .invalidConfig:
            return L10n.VirtualCards.Errors.invalidConfig
        case .notSignedIn:
            return L10n.VirtualCards.Errors.notSignedIn
        case .fundingSourceCreationFailed:
            return L10n.VirtualCards.Errors.fundingSourceCreationFailed
        case .localKeyPairFailure:
            return L10n.VirtualCards.Errors.localKeyPairFailure
        case .noOwnershipProofAvailable:
            return L10n.VirtualCards.Errors.noOwnershipProofAvailable
        case .provisionFailed:
            return L10n.VirtualCards.Errors.provisionFailed
        case .setupFailed:
            return L10n.VirtualCards.Errors.setupFailed
        case .completionFailed:
            return L10n.VirtualCards.Errors.completionFailed
        case .cancelFailed:
            return L10n.VirtualCards.Errors.cancelFailed
        case .updateFailed:
            return L10n.VirtualCards.Errors.updateFailed
        case .getFailed:
            return L10n.VirtualCards.Errors.getFailed
        case .cardNotFound:
            return L10n.VirtualCards.Errors.cardNotFound
        case .cardStateError:
            return L10n.VirtualCards.Errors.cardStateError
        case .transactionNotFound:
            return L10n.VirtualCards.Errors.transactionNotFound
        case .currencyMismatch:
            return L10n.VirtualCards.Errors.currencyMismatch
        case .velocityExceeded:
            return L10n.VirtualCards.Errors.velocityExceeded
        case .entitlementExceeded:
            return L10n.VirtualCards.Errors.entitlementExceeded
        case .provisionalFundingSourceNotFound:
            return L10n.VirtualCards.Errors.provisionalFundingSourceNotFound
        case .fundingSourceNotFound:
            return L10n.VirtualCards.Errors.fundingSourceNotFound
        case .fundingSourceNotActive:
            return L10n.VirtualCards.Errors.fundingSourceNotActive
        case .unsupportedCurrency:
            return L10n.VirtualCards.Errors.unsupportedCurrency
        case .fundingSourceNotSetup:
            return L10n.VirtualCards.Errors.fundingSourceNotSetup
        case .fundingSourceCompletionDataInvalid:
            return L10n.VirtualCards.Errors.fundingSourceCompletionDataInvalid
        case .fundingSourceStateError:
            return L10n.VirtualCards.Errors.fundingSourceStateError
        case .unacceptableFundingSource:
            return L10n.VirtualCards.Errors.unacceptableFundingSource
        case .serviceError:
            return L10n.VirtualCards.Errors.serviceError
        case .decodingError:
            return L10n.VirtualCards.Errors.decodingError
        case .environmentError:
            return L10n.VirtualCards.Errors.environmentError
        case .policyFailed:
            return L10n.VirtualCards.Errors.policyFailed
        case .invalidTokenError:
            return L10n.VirtualCards.Errors.invalidTokenError
        case .accountLockedError:
            return L10n.VirtualCards.Errors.accountLockedError
        case .identityInsufficient:
            return L10n.VirtualCards.Errors.identityInsufficient
        case .identityNotVerified:
            return L10n.VirtualCards.Errors.identityNotVerified
        case .noEntitlements:
            return L10n.VirtualCards.Errors.noEntitlementsError
        case .insufficientEntitlements:
            return L10n.VirtualCards.Errors.insufficientEntitlementsError
        case let .internalError(cause):
            return cause ?? "Unknown error"
        case .unknownTimezone:
            return L10n.VirtualCards.Errors.unknownTimezone
        case let .invalidArgument(msg):
            return msg ?? L10n.VirtualCards.Errors.invalidArgument
        }
    }
}

/// Errors associated with the failure of Public Key Registration Lifecycle events.
public enum PublicKeyError: Error, Equatable {
    /// Failed to register the Public Key to virtualcards service.
    case registerFailed
    /// Failed to delete the Public Key from virtualcards service.
    case deleteFailed
    /// The id associated with the key could not be found.
    case publicKeyNotFound
    /// Operation to access a keyring from the serviced failed.
    case keyRingGetFailed
}
