//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoLogging
import AWSAppSync
import SudoApiClient

/// Abstraction of the SDKs capabilities surrounding `FundingSource` access/manipulation with virtual cards service.
class FundingSourceService {

    // MARK: - Properties

    /// Used to make GraphQL requests to AWS. Injected into operations to delegate the calls.
    unowned var graphQLClient: SudoApiClient

    /// Logs errors and diagnostic information.
    var logger: Logger

    /// Used to decode JSON data.
    var decoder: JSONDecoder = JSONDecoder()

    /// Used to encode JSON data.
    var encoder: JSONEncoder = JSONEncoder()

    // MARK: - Lifecycle

    /// Initialize an instance of `FundingSourceService`.
    init(graphQLClient: SudoApiClient, logger: Logger) {
        self.graphQLClient = graphQLClient
        self.logger = logger
    }

    // MARK: - FundingSourceService

    /// Setup a funding source.
    ///
    /// - Parameters:
    ///   - input: Input sent to the virtual cards service.
    /// - Returns:
    ///     - Success: Setup/Provisional information from the service.
    ///     - Failure: `Error` that occurred.
    func setup(input: SetupFundingSourceInput) async throws -> ProvisionalFundingSource {

        var request = GraphQL.SetupFundingSourceRequest(
            currency: input.currency,
            type: input.type.fundingSourceType)
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
            let data = try self.decoder.decode(StripeCardProvisioningData.Data.self, from: encodedProvisioningData)

            provisioningData = .stripeCard(StripeCardProvisioningData(data: data))
        } else if baseProvisioningData.provider == "checkout" && baseProvisioningData.type == .creditCard && baseProvisioningData.version == 1 {
            let stripeCardData = try self.decoder.decode(CheckoutCardProvisioningData.Data.self, from: encodedProvisioningData)

            provisioningData = .checkoutCard(CheckoutCardProvisioningData(data: stripeCardData))
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
    ///   - paymentMethodId: Payment Method ID from Stripe.
    /// - Returns:
    ///     - Success: Provisioned funding source, ready to be used.
    ///     - Failure: `Error` that occurred.
    func complete(clientId: String, completionData: FundingSourceCompletionData) async throws -> FundingSource {
        let encodedCompletionString: String
        do {
            let data = try encoder.encode(completionData)
            encodedCompletionString = data.base64EncodedString()
        } catch {
            throw SudoVirtualCardsError.completionFailed
        }
        let input = GraphQL.CompleteFundingSourceRequest(completionData: encodedCompletionString, id: clientId)
        let mutation = GraphQL.CompleteFundingSourceMutation(input: input)
        let data = try await GraphQLHelper.performMutation(
            graphQLClient: graphQLClient,
            serviceErrorTransformations: [SudoVirtualCardsError.init(graphQLError:)],
            mutation: mutation,
            logger: logger
        )
        return FundingSource(fragment: data.completeFundingSource.fragments.fundingSource)
    }

    /// Get the client configuration for interacting with 3rd party partner payment processors.
    ///
    /// - Parameters:
    ///   - cachePolicy: Cache policy on how to access the configuration.
    /// - Returns:
    ///     - Success: Configuration.
    ///     - Failure: `Error` that occurred.
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
            return try decoder.decode(ClientConfigurations.self, from: encodedData)
        } catch {
            logger.error("Error occurred while decoding data: \(error.localizedDescription)")
            throw SudoVirtualCardsError.getFailed
        }
    }

    func cancel(id: String) async throws -> FundingSource {
        let mutationInput = GraphQL.IdInput(id: id)
        let mutation = GraphQL.CancelFundingSourceMutation(input: mutationInput)
        let data = try await GraphQLHelper.performMutation(
            graphQLClient: graphQLClient,
            serviceErrorTransformations: [SudoVirtualCardsError.init(graphQLError:)],
            mutation: mutation,
            logger: logger
        )
        return FundingSource(fragment: data.cancelFundingSource.fragments.fundingSource)
    }
}
