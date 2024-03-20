//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSAppSync
import Foundation
import SudoApiClient
import SudoLogging

/// Abstraction of the SDKs capabilities surrounding `FundingSource` access/manipulation with virtual cards service.
class FundingSourceService {

    /// Constants used in `FundingSourceService`.
    enum Constants {
        static let signatureAlgorithm = "RSASignatureSSAPKCS15SHA256"
    }

    // MARK: - Properties

    /// Used to make GraphQL requests to AWS. Injected into operations to delegate the calls.
    private unowned var graphQLClient: SudoApiClient

    /// Used to unseal incoming bank account institution attributes.
    private unowned let unsealer: Unsealer

    /// Used to sign authorization texts
    private unowned let platformKeyManager: PlatformKeyManager

    /// Logs errors and diagnostic information.
    private let logger: Logger

    /// Used to decode JSON data.
    var decoder: JSONDecoder = JSONDecoder()

    /// Used to encode JSON data.
    var encoder: JSONEncoder = JSONEncoder()

    // MARK: - Lifecycle

    /// Initialize an instance of `FundingSourceService`.
    init(
        graphQLClient: SudoApiClient,
        unsealer: Unsealer,
        platformKeyManager: PlatformKeyManager,
        logger: Logger
    ) {
        self.graphQLClient = graphQLClient
        self.unsealer = unsealer
        self.platformKeyManager = platformKeyManager
        self.logger = logger
    }

    // MARK: - FundingSourceService

    /// Setup a funding source.
    ///
    /// - Parameters:
    ///   - input: Input sent to the virtual cards service.
    /// - Returns: Setup/Provisional information from the service.
    ///
    func setup(input: SetupFundingSourceInput) async throws -> ProvisionalFundingSource {
        let setupData = FundingSourceSetupData(applicationName: input.applicationData.applicationName)
        let encodedSetupData = try encoder.encode(setupData)
        var request = GraphQL.SetupFundingSourceRequest(
            currency: input.currency,
            setupData: encodedSetupData.base64EncodedString(),
            type: input.type.fundingSourceType
        )
        if input.supportedProviders?.isEmpty == false {
            request.supportedProviders = input.supportedProviders
        }
        let mutation = GraphQL.SetupFundingSourceMutation(input: request)
        let data = try await GraphQLHelper.performMutation(
            graphQLClient: graphQLClient,
            serviceErrorTransformations: [SudoVirtualCardsError.init(graphQLError:)],
            mutation: mutation,
            logger: logger
        )
        guard let encodedProvisioningData = Data(base64Encoded: data.setupFundingSource.provisioningData) else {
            logger.error("Data received for setupFundingSource is not base64 encoded")
            throw SudoVirtualCardsError.internalError("Data received for setupFundingSource is not base64 encoded")
        }

        let baseProvisioningData = try self.decoder.decode(BaseProvisioningData.self, from: encodedProvisioningData)

        let provisioningData: ProvisioningData
        if baseProvisioningData.provider == "stripe" && baseProvisioningData.type == .creditCard && baseProvisioningData.version == 1 {
            let data = try self.decoder.decode(StripeCardProvisioningData.self, from: encodedProvisioningData)

            provisioningData = .stripeCard(data)
        } else if baseProvisioningData.provider == "checkout" && baseProvisioningData.type == .creditCard && baseProvisioningData.version == 1 {
            let checkoutCardData = try self.decoder.decode(CheckoutCardProvisioningData.self, from: encodedProvisioningData)

            provisioningData = .checkoutCard(checkoutCardData)
        } else if baseProvisioningData.provider == "checkout" && baseProvisioningData.type == .bankAccount &&
            baseProvisioningData.version == 1 {
            let checkoutBankAccountData = try self.decoder.decode(CheckoutBankAccountProvisioningData.self, from:
                encodedProvisioningData)

            provisioningData = .checkoutBankAccount(checkoutBankAccountData)
        } else {
            provisioningData = .unknown(baseProvisioningData)
        }

        return ProvisionalFundingSource(
            id: data.setupFundingSource.id,
            owner: data.setupFundingSource.owner,
            version: data.setupFundingSource.version,
            createdAt: Date(millisecondsSince1970: data.setupFundingSource.createdAtEpochMs),
            updatedAt: Date(millisecondsSince1970: data.setupFundingSource.updatedAtEpochMs),
            provisioningData: provisioningData
        )
    }

    /// Complete a provisional funding source.
    ///
    /// - Parameters:
    ///   - clientId: ID generated when calling `setup`.
    ///   - completionData: provider-specific data required to complete the funding source setup operation.
    /// - Returns: Provisioned funding source, ready to be used.
    ///
    func complete(clientId: String, completionData: FundingSourceCompletionData) async throws -> FundingSource {
        let encodedCompletionString: String
        switch completionData {
        case .stripeCard, .checkoutCard:
            do {
                let data = try encoder.encode(completionData)
                encodedCompletionString = data.base64EncodedString()
            } catch {
                throw SudoVirtualCardsError.completionFailed
            }
        case .checkoutBankAccount(let completionData):
            guard let currentKeys = try platformKeyManager.getCurrentKeyPair() else {
                throw SudoVirtualCardsError.localKeyPairFailure
            }
            do {
                let authorizationTextSignature = try signAuthorizationText(
                    keyId: currentKeys.keyId,
                    accountId: completionData.accountId,
                    authorizationText: completionData.authorizationText
                )

                let bankAccountCompletionData = SerializedCheckoutBankAccountCompletionData(
                    keyId: currentKeys.keyId,
                    publicToken: completionData.publicToken,
                    accountId: completionData.accountId,
                    institutionId: completionData.institutionId,
                    authorizationTextSignature: authorizationTextSignature
                )

                let data = try encoder.encode(bankAccountCompletionData)
                encodedCompletionString = data.base64EncodedString()
            } catch {
                throw SudoVirtualCardsError.completionFailed
            }
        }

        let input = GraphQL.CompleteFundingSourceRequest(completionData: encodedCompletionString, id: clientId)
        let mutation = GraphQL.CompleteFundingSourceMutation(input: input)
        let data = try await GraphQLHelper.performMutation(
            graphQLClient: graphQLClient,
            serviceErrorTransformations: [SudoVirtualCardsError.init(graphQLError:)],
            mutation: mutation,
            logger: logger
        )
        if data.completeFundingSource.__typename == CreditCardFundingSource.Constants.TypeName {
            guard let fundingSource = data.completeFundingSource.asCreditCardFundingSource else {
                logger.error("No data received for completeFundingSource credit card response")
                throw SudoVirtualCardsError.internalError("No data received for completeFundingSource credit card response")
            }
            let creditCardFundingSource = CreditCardFundingSource(fragment: fundingSource.fragments.creditCardFundingSource)
            return FundingSource.creditCardFundingSource(creditCardFundingSource)
        }
        if data.completeFundingSource.__typename == BankAccountFundingSource.Constants.TypeName {
            guard let fundingSource = data.completeFundingSource.asBankAccountFundingSource else {
                logger.error("No data received for completeFundingSource bank account response")
                throw SudoVirtualCardsError.internalError("No data received for completeFundingSource bank account response")
            }
            let bankAccountFundingSource = try unsealer.unseal(fundingSource.fragments.bankAccountFundingSource)
            return FundingSource.bankAccountFundingSource(bankAccountFundingSource)
        }
        throw SudoVirtualCardsError.unrecognizedFundingSourceType(data.completeFundingSource.__typename)
    }

    /// Refresh a funding source.
    ///
    /// - Parameters:
    ///   - clientId: identifier of the funding source.
    ///   - refreshData: provider-specific data required to perform the funding source refresh operation
    ///   - applicationData: client application data to enable configuraiton lookup at the service
    ///   - language: user's optional preferred language used for authorization display text generation
    /// - Returns: Refreshed funding source.
    ///
    func refresh(
        clientId: String,
        refreshData: RefreshDataInput,
        applicationData: ClientApplicationData,
        language: String?
    ) async throws -> FundingSource {
        let encodedRefreshString: String
        switch refreshData {
        case let .checkoutBankAccount(refreshData):
            guard let currentKeys = try platformKeyManager.getCurrentKeyPair() else {
                throw SudoVirtualCardsError.localKeyPairFailure
            }
            do {
                // The authorization text signature is optional to the refresh operation. For bank accounts, refresh is a
                // two-stage operation; the first just initiates the refresh and thus no authorization is required. While
                // the second operation does require the authorization text signature in order to succeed, we can't mandate
                // it via the protocol so just need to handle the error response if it is not supplied.
                var authorizationTextSignature: AuthorizationTextSignature?
                if let authorizationText = refreshData.authorizationText,
                   let accountId = refreshData.accountId {
                    authorizationTextSignature = try signAuthorizationText(
                        keyId: currentKeys.keyId,
                        accountId: accountId,
                        authorizationText: authorizationText
                    )
                }

                let bankAccountRefreshData = FundingSourceRefreshData.checkoutBankAccount(CheckoutBankAccountRefreshData(
                    applicationName: applicationData.applicationName,
                    keyId: currentKeys.keyId,
                    authorizationTextSignature: authorizationTextSignature
                ))

                let data = try encoder.encode(bankAccountRefreshData)
                encodedRefreshString = data.base64EncodedString()
            } catch {
                throw SudoVirtualCardsError.refreshFailed
            }
        }

        let input = GraphQL.RefreshFundingSourceRequest(id: clientId, language: language, refreshData: encodedRefreshString)
        let mutation = GraphQL.RefreshFundingSourceMutation(input: input)
        let data = try await GraphQLHelper.performMutation(
            graphQLClient: graphQLClient,
            serviceErrorTransformations: [SudoVirtualCardsError.init(graphQLError:)],
            mutation: mutation,
            logger: logger
        )
        if data.refreshFundingSource.__typename == CreditCardFundingSource.Constants.TypeName {
            guard let fundingSource = data.refreshFundingSource.asCreditCardFundingSource else {
                logger.error("No data received for refreshFundingSource credit card response")
                throw SudoVirtualCardsError.internalError("No data received for refreshFundingSource credit card response")
            }
            let creditCardFundingSource = CreditCardFundingSource(fragment: fundingSource.fragments.creditCardFundingSource)
            return FundingSource.creditCardFundingSource(creditCardFundingSource)
        }
        if data.refreshFundingSource.__typename == BankAccountFundingSource.Constants.TypeName {
            guard let fundingSource = data.refreshFundingSource.asBankAccountFundingSource else {
                logger.error("No data received for refreshFundingSource bank account response")
                throw SudoVirtualCardsError.internalError("No data received for refreshFundingSource bank account response")
            }
            let bankAccountFundingSource = try unsealer.unseal(fundingSource.fragments.bankAccountFundingSource)
            return FundingSource.bankAccountFundingSource(bankAccountFundingSource)
        }
        throw SudoVirtualCardsError.unrecognizedFundingSourceType(data.refreshFundingSource.__typename)
    }

    /// Get the client configuration for interacting with 3rd party partner payment processors.
    ///
    /// - Parameters:
    ///   - cachePolicy: Cache policy on how to access the configuration.
    /// - Returns: Client Configurations for supported payment providers
    ///
    func getConfig(cachePolicy: CachePolicy) async throws -> ClientConfigurations {
        let query = GraphQL.GetFundingSourceClientConfigurationQuery()
        let data = try await GraphQLHelper.performQuery(
            graphQLClient: graphQLClient,
            query: query,
            cachePolicy: cachePolicy,
            logger: logger
        )
        guard
            let encodedDataString = data?.getFundingSourceClientConfiguration.data,
            let encodedData = Data(base64Encoded: encodedDataString)
        else {
            throw SudoVirtualCardsError.getFailed
        }
        do {
            return try self.decoder.decode(ClientConfigurations.self, from: encodedData)
        } catch {
            logger.error("Error occurred while decoding data: \(error.localizedDescription)")
            throw SudoVirtualCardsError.getFailed
        }
    }

    /// Cancel a funding source.
    ///
    /// - Parameters:
    ///   - id: identifier of the funding source.
    /// - Returns: Cancelled funding source.
    ///
    func cancel(id: String) async throws -> FundingSource {
        let mutationInput = GraphQL.IdInput(id: id)
        let mutation = GraphQL.CancelFundingSourceMutation(input: mutationInput)
        let data = try await GraphQLHelper.performMutation(
            graphQLClient: graphQLClient,
            serviceErrorTransformations: [SudoVirtualCardsError.init(graphQLError:)],
            mutation: mutation,
            logger: logger
        )
        if data.cancelFundingSource.__typename == CreditCardFundingSource.Constants.TypeName {
            guard let fundingSource = data.cancelFundingSource.asCreditCardFundingSource else {
                logger.error("No data received for cancelFundingSource credit card response")
                throw SudoVirtualCardsError.internalError("No data received for cancelFundingSource credit card response")
            }
            let creditCardFundingSource = CreditCardFundingSource(fragment: fundingSource.fragments.creditCardFundingSource)
            return FundingSource.creditCardFundingSource(creditCardFundingSource)
        }
        if data.cancelFundingSource.__typename == BankAccountFundingSource.Constants.TypeName {
            guard let fundingSource = data.cancelFundingSource.asBankAccountFundingSource else {
                logger.error("No data received for cancelFundingSource bank account response")
                throw SudoVirtualCardsError.internalError("No data received for cancelFundingSource bank account response")
            }
            let bankAccountFundingSource = try unsealer.unseal(fundingSource.fragments.bankAccountFundingSource)
            return FundingSource.bankAccountFundingSource(bankAccountFundingSource)
        }
        throw SudoVirtualCardsError.unrecognizedFundingSourceType(data.cancelFundingSource.__typename)
    }

    /// Review an unfunded funding source.
    ///
    /// - Parameters:
    ///   - id: identifier of the funding source.
    /// - Returns: Reviewed funding source.
    ///
    func reviewUnfunded(id: String) async throws -> FundingSource {
        let mutationInput = GraphQL.IdInput(id: id)
        let mutation = GraphQL.ReviewUnfundedFundingSourceMutation(input: mutationInput)
        let data = try await GraphQLHelper.performMutation(
            graphQLClient: graphQLClient,
            serviceErrorTransformations: [SudoVirtualCardsError.init(graphQLError:)],
            mutation: mutation,
            logger: logger
        )
        if data.reviewUnfundedFundingSource.__typename == CreditCardFundingSource.Constants.TypeName {
            guard let fundingSource = data.reviewUnfundedFundingSource.asCreditCardFundingSource else {
                logger.error("No data received for reviewUnfundedFundingSource credit card response")
                throw SudoVirtualCardsError.internalError("No data received for reviewUnfundedFundingSource credit card response")
            }
            let creditCardFundingSource = CreditCardFundingSource(fragment: fundingSource.fragments.creditCardFundingSource)
            return FundingSource.creditCardFundingSource(creditCardFundingSource)
        }
        if data.reviewUnfundedFundingSource.__typename == BankAccountFundingSource.Constants.TypeName {
            guard let fundingSource = data.reviewUnfundedFundingSource.asBankAccountFundingSource else {
                logger.error("No data received for reviewUnfundedFundingSource bank account response")
                throw SudoVirtualCardsError.internalError("No data received for reviewUnfundedFundingSource bank account response")
            }
            let bankAccountFundingSource = try unsealer.unseal(fundingSource.fragments.bankAccountFundingSource)
            return FundingSource.bankAccountFundingSource(bankAccountFundingSource)
        }
        throw SudoVirtualCardsError.unrecognizedFundingSourceType(data.reviewUnfundedFundingSource.__typename)
    }

    private func signAuthorizationText(keyId: String, accountId: String, authorizationText: AuthorizationText) throws -> AuthorizationTextSignature {
        do {
            let signedAt = Date()
            let signatureData = AuthorizationTextSignatureData(
                hash: authorizationText.hash,
                hashAlgorithm: authorizationText.hashAlgorithm,
                signedAt: signedAt,
                account: accountId
            )
            let plaintextData = try encoder.encode(signatureData)
            let signed = try platformKeyManager.sign(withPrivateKeyId: keyId, data: plaintextData)
            let signature = signed.base64EncodedString()
            if let plaintext = String(data: plaintextData, encoding: .utf8) {
                return AuthorizationTextSignature(
                    data: plaintext,
                    algorithm: Constants.signatureAlgorithm,
                    keyId: keyId,
                    signature: signature
                )
            } else {
                throw SudoVirtualCardsError.completionFailed
            }
        } catch {
            throw SudoVirtualCardsError.completionFailed
        }
    }
}
