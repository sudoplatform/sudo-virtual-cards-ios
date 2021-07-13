// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen
// Custom template in `swiftgen/strings/template.stencil`

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name

internal enum L10n {

    // MARK: - virtual_cards
    internal enum VirtualCards {
      // MARK: - errors
      internal enum Errors {
        internal static let accountLockedError = L10n.tr("Localizable", "virtual_cards.errors.accountLockedError")
        internal static let cancelFailed = L10n.tr("Localizable", "virtual_cards.errors.cancelFailed")
        internal static let cardNotFound = L10n.tr("Localizable", "virtual_cards.errors.cardNotFound")
        internal static let cardStateError = L10n.tr("Localizable", "virtual_cards.errors.cardStateError")
        internal static let completionFailed = L10n.tr("Localizable", "virtual_cards.errors.completionFailed")
        internal static let currencyMismatch = L10n.tr("Localizable", "virtual_cards.errors.currencyMismatch")
        internal static let decodingError = L10n.tr("Localizable", "virtual_cards.errors.decodingError")
        internal static let deleteFailed = L10n.tr("Localizable", "virtual_cards.errors.deleteFailed")
        internal static let entitlementExceeded = L10n.tr("Localizable", "virtual_cards.errors.entitlementExceeded")
        internal static let environmentError = L10n.tr("Localizable", "virtual_cards.errors.environmentError")
        internal static let fundingSourceCompletionDataInvalid = L10n.tr("Localizable", "virtual_cards.errors.fundingSourceCompletionDataInvalid")
        internal static let fundingSourceCreationFailed = L10n.tr("Localizable", "virtual_cards.errors.fundingSourceCreationFailed")
        internal static let fundingSourceNotActive = L10n.tr("Localizable", "virtual_cards.errors.fundingSourceNotActive")
        internal static let fundingSourceNotFound = L10n.tr("Localizable", "virtual_cards.errors.fundingSourceNotFound")
        internal static let fundingSourceNotSetup = L10n.tr("Localizable", "virtual_cards.errors.fundingSourceNotSetup")
        internal static let fundingSourceStateError = L10n.tr("Localizable", "virtual_cards.errors.fundingSourceStateError")
        internal static let getFailed = L10n.tr("Localizable", "virtual_cards.errors.getFailed")
        internal static let identityInsufficient = L10n.tr("Localizable", "virtual_cards.errors.identityInsufficient")
        internal static let identityNotVerified = L10n.tr("Localizable", "virtual_cards.errors.identityNotVerified")
        internal static let insufficientEntitlementsError = L10n.tr("Localizable", "virtual_cards.errors.insufficientEntitlementsError")
        internal static let invalidArgument = L10n.tr("Localizable", "virtual_cards.errors.invalidArgument")
        internal static let invalidConfig = L10n.tr("Localizable", "virtual_cards.errors.invalidConfig")
        internal static let invalidTokenError = L10n.tr("Localizable", "virtual_cards.errors.invalidTokenError")
        internal static let keyRingGetFailed = L10n.tr("Localizable", "virtual_cards.errors.keyRingGetFailed")
        internal static let localKeyPairFailure = L10n.tr("Localizable", "virtual_cards.errors.localKeyPairFailure")
        internal static let noEntitlementsError = L10n.tr("Localizable", "virtual_cards.errors.noEntitlementsError")
        internal static let noOwnershipProofAvailable = L10n.tr("Localizable", "virtual_cards.errors.noOwnershipProofAvailable")
        internal static let notSignedIn = L10n.tr("Localizable", "virtual_cards.errors.notSignedIn")
        internal static let policyFailed = L10n.tr("Localizable", "virtual_cards.errors.policyFailed")
        internal static let provisionalFundingSourceNotFound = L10n.tr("Localizable", "virtual_cards.errors.provisionalFundingSourceNotFound")
        internal static let provisionFailed = L10n.tr("Localizable", "virtual_cards.errors.provisionFailed")
        internal static let publicKeyNotFound = L10n.tr("Localizable", "virtual_cards.errors.publicKeyNotFound")
        internal static let registerFailed = L10n.tr("Localizable", "virtual_cards.errors.registerFailed")
        internal static let serviceError = L10n.tr("Localizable", "virtual_cards.errors.serviceError")
        internal static let setupFailed = L10n.tr("Localizable", "virtual_cards.errors.setupFailed")
        internal static let transactionNotFound = L10n.tr("Localizable", "virtual_cards.errors.transactionNotFound")
        internal static let unacceptableFundingSource = L10n.tr("Localizable", "virtual_cards.errors.unacceptableFundingSource")
        internal static let unknownTimezone = L10n.tr("Localizable", "virtual_cards.errors.unknownTimezone")
        internal static let unsupportedCurrency = L10n.tr("Localizable", "virtual_cards.errors.unsupportedCurrency")
        internal static let updateFailed = L10n.tr("Localizable", "virtual_cards.errors.updateFailed")
        internal static let velocityExceeded = L10n.tr("Localizable", "virtual_cards.errors.velocityExceeded")
        internal static let limitExceeded = L10n.tr("Localizable", "virtual_cards.errors.limitExceeded")
        internal static let notAuthorized = L10n.tr("Localizable", "virtual_cards.errors.notAuthorized")
        internal static let versionMismatch = L10n.tr("Localizable", "virtual_cards.errors.versionMismatch")
        internal static let requestFailed = L10n.tr("Localizable", "virtual_cards.errors.requestFailed")
        internal static let rateLimitExceeded = L10n.tr("Localizable", "virtual_cards.errors.rateLimitExceeded")
        internal static let graphQLError = L10n.tr("Localizable", "virtual_cards.errors.graphQLError")
        internal static let fatalError = L10n.tr("Localizable", "virtual_cards.errors.fatalError")
      }
    }
}

// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  fileprivate static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: .sdkBundle, comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}
