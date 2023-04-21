//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoApiClient
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
    /// Failed to refresh the funding source.
    case refreshFailed
    /// Failed to cancel.
    case cancelFailed
    /// Failed to update.
    case updateFailed
    /// Failed to retrieve.
    case getFailed
    /// Algorithm is unrecognized.
    case unrecognizedAlgorithm(_ algorithm: String)
    /// Funding source type is unrecognized - check you have the latest version of the SDK
    case unrecognizedFundingSourceType(_ fundingSourceType: String)

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
    case provisionalFundingSourceNotFound
    /// The supplied fundingSourceId does not match any recorded funding source.
    case fundingSourceNotFound
    /// The funding source is not currently active and therefore unavailable to be used.
    case fundingSourceNotActive
    /// A new funding source was requested to be created but it is using the same credit card
    /// (same card number) as an existing active funding source.
    case duplicateFundingSource
    /// Currency provided is not supported.
    case unsupportedCurrency
    /// The funding source cannot be completed as its setup has not completed successfully.
    case fundingSourceNotSetup
    /// The funding source completion data is invalid.
    /// This can occur when there is a mismatch between the completion data and the recorded setup data.
    case fundingSourceCompletionDataInvalid
    /// The funding source or provisional funding source is in an invalid state for the requested operation
    case fundingSourceStateError
    /// The funding source failed attempts to validate e.g. as determined when making an initial
    /// authorization. Reasons for being unacceptable include insufficient funds if a preauthorization is
    /// performed, the funding source is high risk and other reasons.
    case unacceptableFundingSource

    /// Returned on funding source completion when further user interaction is required to complete the funding source setup
    case fundingSourceRequiresUserInteraction(_ interactionData: FundingSourceInteractionData)

    /// Indicates the requested operation failed because the user account is locked.
    case accountLocked

    /// Indicates that the request operation failed due to authorization error. This maybe due to the authentication
    /// token being invalid or other security controls that prevent the user from accessing the API.
    case notAuthorized

    /// Indicates API call  failed due to it exceeding some limits imposed for the API. For example, this error
    /// can occur if the vault size was too big.
    case limitExceeded

    /// Indicates that the user does not have sufficient entitlements to perform the requested operation.
    case insufficientEntitlements

    /// Indicates the version of the vault that is getting updated does not match the current version of the vault stored
    /// in the backend. The caller should retrieve the current version of the vault and reconcile the difference.
    case versionMismatch

    /// Indicates that an internal server error caused the operation to fail. The error is possibly transient and
    /// retrying at a later time may cause the operation to complete successfully
    case serviceError

    /// Indicates that there were too many attempts at sending API requests within a short period of time.
    case rateLimitExceeded

    /// Operation failed due to an invalid request. This maybe due to the version mismatch between the
    /// client and the backend.
    case invalidRequest

    /// Indicates that the request failed due to connectivity, availability or access error.
    case requestFailed(response: HTTPURLResponse?, cause: Error?)

    /// Indicates that a GraphQL error was returned by the backend.
    case graphQLError(description: String)

    /// Indicates that a fatal error occurred. This could be due to coding error, out-of-memory condition or other
    /// conditions that is beyond control of `SudoIdentityVerificationClient` implementation.
    case fatalError(description: String)

    /// Backend environment error occurred.
    case environmentError

    /// Returned when JSON web tokens submitted are rejected because they:
    ///     1. fail signature verification
    ///     2. is not an appropriate token for the invoker user to be submitting (e.g. user id doesn't match)
    ///     3. is a resource reference token for resource type unrecognized by the service
    ///        to which the token has been submitted
    case invalidToken

    /// Returned when an operation fails because the user's level of identity verification is insufficient.
    case identityInsufficient

    /// Returned when an operation fails due to lack of verification.
    case identityNotVerified

    /// Returned if specified time zone is not recognized.
    case unknownTimezone

    /// Returned when the user has no entitlements associated with them
    case noEntitlements

    /// An internal error has occurred and will need to be resolved by Anonyome.
    case internalError(_ cause: String?)

    /// Returned if an API argument is not valid or inconsistent with other arguments.
    case invalidArgument(_ msg: String?)

    /// Returned when the input was not in the expected format.
    case decodingError

    // MARK: - Lifecycle

    /// Initialize a `SudoVirtualCardsError` from a `GraphQLError`.
    ///
    /// If the GraphQLError is unsupported, `nil` will be returned instead.
    init(graphQLError error: GraphQLError) { // swiftlint:disable:this cyclomatic_complexity
        guard let errorType = error["errorType"] as? String else {
            self = .internalError(error.message)
            return
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
            self = .insufficientEntitlements
        case "sudoplatform.virtual-cards.ProvisionalFundingSourceNotFoundError":
            self = .provisionalFundingSourceNotFound
        case "sudoplatform.virtual-cards.FundingSourceNotFoundError":
            self = .fundingSourceNotFound
        case "sudoplatform.virtual-cards.FundingSourceNotActiveError":
            self = .fundingSourceNotActive
        case "sudoplatform.virtual-cards.DuplicateFundingSourceError":
            self = .duplicateFundingSource
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
        case "sudoplatform.virtual-cards.FundingSourceRequiresUserInteractionError":
            let result = decodeProvisionalFundingSourceInteractionData(error["errorInfo"])
            switch result {
            case .success(let interactionData):
                self = .fundingSourceRequiresUserInteraction(interactionData)
            case .failure(let error):
                self = error
            }
        case "sudoplatform.AccountLockedError":
            self = .accountLocked
        case "sudoplatform.DecodingError":
            self = .decodingError
        case "sudoplatform.EnvironmentError":
            self = .environmentError
        case "sudoplatform.IdentityVerificationInsufficientError":
            self = .identityInsufficient
        case "sudoplatform.IdentityVerificationNotVerifiedError":
            self = .identityNotVerified
        case "sudoplatform.InsufficientEntitlementsError":
            self = .insufficientEntitlements
        case "sudoplatform.InvalidArgumentError":
            let msg = error.message.isEmpty ? nil : error.message
            self = .invalidArgument(msg)
        case "sudoplatform.InvalidTokenError":
            self = .invalidToken
        case "sudoplatform.NoEntitlementsError":
            self = .noEntitlements
        case "sudoplatform.ServiceError":
            self = .serviceError
        case "sudoplatform.UnknownTimezoneError":
            self = .unknownTimezone
        default:
            self = .internalError("\(errorType) - \(error.message)")
        }
    }

    // MARK: - Conformance: Equatable

    public static func == (lhs: SudoVirtualCardsError, rhs: SudoVirtualCardsError) -> Bool {
        switch (lhs, rhs) {
        case (.requestFailed(let lhsResponse, let lhsCause), requestFailed(let rhsResponse, let rhsCause)):
            if let lhsResponse = lhsResponse, let rhsResponse = rhsResponse {
                return lhsResponse.statusCode == rhsResponse.statusCode
            }
            return type(of: lhsCause) == type(of: rhsCause)
        case (.accountLocked, .accountLocked),
             (.cancelFailed, .cancelFailed),
             (.cardNotFound, .cardNotFound),
             (.cardStateError, .cardStateError),
             (.completionFailed, .completionFailed),
             (.currencyMismatch, .currencyMismatch),
             (.duplicateFundingSource, .duplicateFundingSource),
             (.environmentError, .environmentError),
             (.fatalError, .fatalError),
             (.fundingSourceCompletionDataInvalid, .fundingSourceCompletionDataInvalid),
             (.fundingSourceCreationFailed, .fundingSourceCreationFailed),
             (.fundingSourceNotActive, .fundingSourceNotActive),
             (.fundingSourceNotFound, .fundingSourceNotFound),
             (.fundingSourceNotSetup, .fundingSourceNotSetup),
             (.fundingSourceRequiresUserInteraction, .fundingSourceRequiresUserInteraction),
             (.fundingSourceStateError, .fundingSourceStateError),
             (.getFailed, .getFailed),
             (.graphQLError, .graphQLError),
             (.identityInsufficient, .identityInsufficient),
             (.identityNotVerified, .identityNotVerified),
             (.insufficientEntitlements, .insufficientEntitlements),
             (.internalError, internalError),
             (.invalidArgument, .invalidArgument),
             (.invalidConfig, .invalidConfig),
             (.invalidRequest, .invalidRequest),
             (.invalidToken, .invalidToken),
             (.limitExceeded, .limitExceeded),
             (.localKeyPairFailure, .localKeyPairFailure),
             (.noEntitlements, .noEntitlements),
             (.noOwnershipProofAvailable, .noOwnershipProofAvailable),
             (.notAuthorized, .notAuthorized),
             (.notSignedIn, .notSignedIn),
             (.provisionalFundingSourceNotFound, .provisionalFundingSourceNotFound),
             (.provisionFailed, .provisionFailed),
             (.rateLimitExceeded, .rateLimitExceeded),
             (.serviceError, .serviceError),
             (.setupFailed, .setupFailed),
             (.transactionNotFound, .transactionNotFound),
             (.unacceptableFundingSource, .unacceptableFundingSource),
             (.unknownTimezone, .unknownTimezone),
             (.unsupportedCurrency, .unsupportedCurrency),
             (.updateFailed, .updateFailed),
             (.velocityExceeded, .velocityExceeded),
             (.versionMismatch, .versionMismatch):
            return true
        default:
            return false
        }
    }

    // MARK: - Conformance: LocalizedError

    public var errorDescription: String? {
        switch self {
        case .accountLocked:
            return L10n.VirtualCards.Errors.accountLockedError
        case .cancelFailed:
            return L10n.VirtualCards.Errors.cancelFailed
        case .cardNotFound:
            return L10n.VirtualCards.Errors.cardNotFound
        case .cardStateError:
            return L10n.VirtualCards.Errors.cardStateError
        case .completionFailed:
            return L10n.VirtualCards.Errors.completionFailed
        case .currencyMismatch:
            return L10n.VirtualCards.Errors.currencyMismatch
        case .duplicateFundingSource:
            return L10n.VirtualCards.Errors.duplicateFundingSource
        case .environmentError:
            return L10n.VirtualCards.Errors.environmentError
        case .fundingSourceCompletionDataInvalid:
            return L10n.VirtualCards.Errors.fundingSourceCompletionDataInvalid
        case .fundingSourceCreationFailed:
            return L10n.VirtualCards.Errors.fundingSourceCreationFailed
        case .fundingSourceNotActive:
            return L10n.VirtualCards.Errors.fundingSourceNotActive
        case .fundingSourceNotFound:
            return L10n.VirtualCards.Errors.fundingSourceNotFound
        case .fundingSourceNotSetup:
            return L10n.VirtualCards.Errors.fundingSourceNotSetup
        case .fundingSourceRequiresUserInteraction:
            return L10n.VirtualCards.Errors.fundingSourceRequiresUserInteraction
        case .fundingSourceStateError:
            return L10n.VirtualCards.Errors.fundingSourceStateError
        case .getFailed:
            return L10n.VirtualCards.Errors.getFailed
        case .invalidConfig:
            return L10n.VirtualCards.Errors.invalidConfig
        case .invalidRequest:
            return L10n.VirtualCards.Errors.invalidRequest
        case .localKeyPairFailure:
            return L10n.VirtualCards.Errors.localKeyPairFailure
        case .noOwnershipProofAvailable:
            return L10n.VirtualCards.Errors.noOwnershipProofAvailable
        case .notSignedIn:
            return L10n.VirtualCards.Errors.notSignedIn
        case .provisionFailed:
            return L10n.VirtualCards.Errors.provisionFailed
        case .provisionalFundingSourceNotFound:
            return L10n.VirtualCards.Errors.provisionalFundingSourceNotFound
        case .refreshFailed:
            return L10n.VirtualCards.Errors.refreshFailed
        case .setupFailed:
            return L10n.VirtualCards.Errors.setupFailed
        case .transactionNotFound:
            return L10n.VirtualCards.Errors.transactionNotFound
        case .unsupportedCurrency:
            return L10n.VirtualCards.Errors.unsupportedCurrency
        case .updateFailed:
            return L10n.VirtualCards.Errors.updateFailed
        case .velocityExceeded:
            return L10n.VirtualCards.Errors.velocityExceeded
        case .unacceptableFundingSource:
            return L10n.VirtualCards.Errors.unacceptableFundingSource
        case .serviceError:
            return L10n.VirtualCards.Errors.serviceError
        case .invalidToken:
            return L10n.VirtualCards.Errors.invalidTokenError
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
        case .unrecognizedAlgorithm(let algorithm):
            return "\(String(describing: self)): \(algorithm)"
        case .unrecognizedFundingSourceType(let fundingSourceType):
            return"\(String(describing: self)): \(fundingSourceType)"
        case .notAuthorized:
            return L10n.VirtualCards.Errors.notAuthorized
        case .limitExceeded:
            return L10n.VirtualCards.Errors.limitExceeded
        case .versionMismatch:
            return L10n.VirtualCards.Errors.versionMismatch
        case .requestFailed:
            return L10n.VirtualCards.Errors.requestFailed
        case .rateLimitExceeded:
            return L10n.VirtualCards.Errors.rateLimitExceeded
        case .graphQLError:
            return L10n.VirtualCards.Errors.graphQLError
        case .fatalError(let msg):
            return "\(L10n.VirtualCards.Errors.fatalError): \(msg)"
        case .decodingError:
            return L10n.VirtualCards.Errors.decodingError
        }
    }
}

extension SudoVirtualCardsError {

    struct Constants {
        static let errorType = "errorType"
    }

    static func fromApiOperationError(error: Error) -> SudoVirtualCardsError {
        switch error {
        case ApiOperationError.accountLocked:
            return .accountLocked
        case ApiOperationError.invalidRequest:
            return .invalidRequest
        case ApiOperationError.notSignedIn:
            return .notSignedIn
        case ApiOperationError.notAuthorized:
            return .notAuthorized
        case ApiOperationError.limitExceeded:
            return .limitExceeded
        case ApiOperationError.insufficientEntitlements:
            return .insufficientEntitlements
        case ApiOperationError.serviceError:
            return .serviceError
        case ApiOperationError.versionMismatch:
            return .versionMismatch
        case ApiOperationError.rateLimitExceeded:
            return .rateLimitExceeded
        case ApiOperationError.graphQLError(let cause):
            return .graphQLError(description: "Unexpected GraphQL error: \(cause)")
        case ApiOperationError.requestFailed(let response, let cause):
            return .requestFailed(response: response, cause: cause)
        default:
            return .fatalError(description: "Unexpected API operation error: \(error)")
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

/// Decode errorInfo from GraphQL error as provisional funding source interaction data
func decodeProvisionalFundingSourceInteractionData(_ errorInfo: Any?) -> Swift.Result<FundingSourceInteractionData, SudoVirtualCardsError> {

    let msg = "Error info cannot be decoded as funding source interaction data"
    guard let errorInfo = errorInfo as? JSONObject else {
        return .failure(SudoVirtualCardsError.internalError("\(msg): \(String(describing: errorInfo)) is not a JSONObject"))
    }

    let base64ProvisioningData = errorInfo["provisioningData"]
    guard let base64ProvisioningData = base64ProvisioningData as? String else {
        return .failure(SudoVirtualCardsError.internalError("\(msg): \(String(describing: base64ProvisioningData)) is not a String"))
    }

    guard let encodedProvisioningData = Data(base64Encoded: base64ProvisioningData) else {
        return .failure(SudoVirtualCardsError.internalError("\(msg): \(String(describing: base64ProvisioningData)) is not Base64 encoded"))
    }

    do {
        let decoder: JSONDecoder = JSONDecoder()
        let baseProvisioningData = try decoder.decode(BaseProvisioningData.self, from: encodedProvisioningData)

        let interactionData: FundingSourceInteractionData
        if baseProvisioningData.provider == "checkout" && baseProvisioningData.type == .creditCard && baseProvisioningData.version == 1 {
            let data = try decoder.decode(CheckoutCardInteractionData.self, from: encodedProvisioningData)

            interactionData = .checkoutCard(data)
        } else if baseProvisioningData.provider == "checkout" && baseProvisioningData.type == .bankAccount && baseProvisioningData.version == 1 {
            let data = try decoder.decode(CheckoutBankAccountRefreshInteractionData.self, from: encodedProvisioningData)

            interactionData = .checkoutBankAccount(data)
        } else {
            interactionData = .unknown(baseProvisioningData)
        }
        return .success(interactionData)
    } catch let error {
        let data = String(decoding: encodedProvisioningData, as: UTF8.self)
        return .failure(
            SudoVirtualCardsError.internalError(
                "\(msg): \(data) is not expected format for FundingSourceInteractionData: \(String(describing: error))"))

    }
}
