//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

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
        do {
            let data = try await graphQLClient.perform(mutation: mutation)
            return ProvisionalFundingSource(
                id: data.setupFundingSource.id,
                owner: data.setupFundingSource.owner,
                version: data.setupFundingSource.version,
                state: ProvisionalFundingSourceState(data.setupFundingSource.getProvisionalFundingSourceState()),
                type: FundingSourceType(data.setupFundingSource.getFundingSourceType()),
                last4: data.setupFundingSource.last4 ?? "",
                createdAt: Date(millisecondsSince1970: data.setupFundingSource.createdAtEpochMs),
                updatedAt: Date(millisecondsSince1970: data.setupFundingSource.updatedAtEpochMs),
                provisioningData: try ProvisioningData(
                    encodedProvisioningData: data.setupFundingSource.provisioningData
                )
            )
        } catch {
            throw SudoVirtualCardsError.fromApiOperationError(error: error)
        }
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
        case .stripeCard:
            do {
                let data = try encoder.encode(completionData)
                encodedCompletionString = data.base64EncodedString()
            } catch {
                throw SudoVirtualCardsError.completionFailed
            }
        }

        let input = GraphQL.CompleteFundingSourceRequest(completionData: encodedCompletionString, id: clientId)
        let mutation = GraphQL.CompleteFundingSourceMutation(input: input)
        let data: GraphQL.CompleteFundingSourceMutation.Data
        do {
            data = try await graphQLClient.perform(mutation: mutation)
        } catch {
            throw SudoVirtualCardsError.fromApiOperationError(error: error)
        }
        if data.completeFundingSource.__typename == CreditCardFundingSource.Constants.TypeName {
            let creditCardFundingSource = CreditCardFundingSource(fragment: data.completeFundingSource.fragments.creditCardFundingSource)
            return FundingSource.creditCardFundingSource(creditCardFundingSource)
        }
        throw SudoVirtualCardsError.unrecognizedFundingSourceType(data.completeFundingSource.__typename)
    }

    /// Get the client configuration for interacting with 3rd party partner payment processors.
    /// - Returns: Client Configurations for supported payment providers
    func getConfig() async throws -> ClientConfigurations {
        let query = GraphQL.GetFundingSourceClientConfigurationQuery()
        let data: GraphQL.GetFundingSourceClientConfigurationQuery.Data
        do {
            data = try await graphQLClient.fetch(query: query)
        } catch {
            throw SudoVirtualCardsError.fromApiOperationError(error: error)
        }
        let encodedDataString = data.getFundingSourceClientConfiguration.data
        guard let encodedData = Data(base64Encoded: encodedDataString) else {
            throw SudoVirtualCardsError.getFailed
        }
        do {
            return try decoder.decode(ClientConfigurations.self, from: encodedData)
        } catch {
            logger.error("Error occurred while decoding data: \(error.localizedDescription)")
            throw SudoVirtualCardsError.getFailed
        }
    }
    /// Cancel a funding source.
    /// - Parameters:
    ///   - id: identifier of the funding source.
    /// - Returns: Cancelled funding source.
    func cancel(id: String) async throws -> FundingSource {
        let mutationInput = GraphQL.IdInput(id: id)
        let mutation = GraphQL.CancelFundingSourceMutation(input: mutationInput)
        let data: GraphQL.CancelFundingSourceMutation.Data
        do {
            data = try await graphQLClient.perform(mutation: mutation)
        } catch {
            throw SudoVirtualCardsError.fromApiOperationError(error: error)
        }
        if data.cancelFundingSource.__typename == CreditCardFundingSource.Constants.TypeName {
            let creditCardFundingSource = CreditCardFundingSource(fragment: data.cancelFundingSource.fragments.creditCardFundingSource)
            return FundingSource.creditCardFundingSource(creditCardFundingSource)
        }
        throw SudoVirtualCardsError.unrecognizedFundingSourceType(data.cancelFundingSource.__typename)
    }

}
