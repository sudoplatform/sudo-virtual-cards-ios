//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoLogging
import AWSAppSync
import SudoApiClient
import SudoOperations

/// Abstraction of the SDKs capabilities surrounding `FundingSource` access/manipulation with virtual cards service.
class FundingSourceService {

    // MARK: - Properties

    /// Used to make GraphQL requests to AWS. Injected into operations to delegate the calls.
    unowned var graphQLClient: SudoApiClient

    /// Used to generate operations.
    unowned var operationFactory: OperationFactory

    /// Logs errors and diagnostic information.
    var logger: Logger

    /// Operation queue used by the `FundingSourceService`.
    var queue: PlatformOperationQueue = PlatformOperationQueue()

    /// Used to decode JSON data.
    var decoder: JSONDecoder = JSONDecoder()

    /// Used to encode JSON data.
    var encoder: JSONEncoder = JSONEncoder()

    // MARK: - Lifecycle

    /// Initialize an instance of `FundingSourceService`.
    init(graphQLClient: SudoApiClient, operationFactory: OperationFactory, logger: Logger) {
        self.graphQLClient = graphQLClient
        self.operationFactory = operationFactory
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
    func setup(input: SetupFundingSourceInput, completion: @escaping ClientCompletion<StripeSetup>) {
        let input = SetupFundingSourceRequest(type: input.type.fundingSourceType, currency: input.currency)
        let mutation = SetupFundingSourceMutation(input: input)
        let operation = operationFactory.generateMutationOperation(mutation: mutation, graphQLClient: graphQLClient, logger: logger)
        let completionObserver = PlatformBlockObserver(finishHandler: { [weak operation, weak self] _, errors in
            guard let weakSelf = self else { return }
            if let error = errors.first {
                completion(.failure(error))
                return
            }
            guard
                let result = operation?.result?.setupFundingSource,
                let encodedProvisioningData = Data(base64Encoded: result.provisioningData)
            else {
                completion(.failure(SudoVirtualCardsError.setupFailed))
                return
            }
            do {
                let stripeSetupData = try weakSelf.decoder.decode(StripeSetup.Data.self, from: encodedProvisioningData)
                let stripeSetup = StripeSetup(id: result.id, data: stripeSetupData)
                completion(.success(stripeSetup))
            } catch {
                self?.logger.error("Failed to decode stripe setup data: \(error)")
                completion(.failure(SudoVirtualCardsError.setupFailed))
            }
        })
        operation.addObserver(completionObserver)
        queue.addOperation(operation)
    }

    /// Complete a provisional funding source.
    ///
    /// - Parameters:
    ///   - clientId: ID generated when calling `setup`.
    ///   - paymentMethodId: Payment Method ID from Stripe.
    /// - Returns:
    ///     - Success: Provisioned funding source, ready to be used.
    ///     - Failure: `Error` that occurred.
    func complete(clientId: String, paymentMethodId: String, completion: @escaping ClientCompletion<FundingSource>) {
        let completionData = StripeCompletionData(paymentMethod: paymentMethodId)
        let encodedCompletionString: String
        do {
            let data = try encoder.encode(completionData)
            encodedCompletionString = data.base64EncodedString()
        } catch {
            logger.error("Failed to encode completionData: \(error)")
            completion(.failure(SudoVirtualCardsError.completionFailed))
            return
        }
        let input = CompleteFundingSourceRequest(id: clientId, completionData: encodedCompletionString)
        let mutation = CompleteFundingSourceMutation(input: input)
        let operation = operationFactory.generateMutationOperation(mutation: mutation, graphQLClient: graphQLClient, logger: logger)
        let completionObserver = PlatformBlockObserver(finishHandler: { [weak operation] _, errors in
            if let error = errors.first {
                completion(.failure(error))
                return
            }
            guard let result = operation?.result?.completeFundingSource else {
                completion(.failure(SudoVirtualCardsError.completionFailed))
                return
            }
            let fundingSource = FundingSource(completeFundingSource: result)
            completion(.success(fundingSource))
        })
        operation.addObserver(completionObserver)
        queue.addOperation(operation)
    }

    /// Get the client configuration for interacting with 3rd party partner authorization.
    ///
    /// - Parameters:
    ///   - cachePolicy: Cache policy on how to access the configuration.
    /// - Returns:
    ///     - Success: Configuration.
    ///     - Failure: `Error` that occurred.
    func getConfig(cachePolicy: CachePolicy, completion: @escaping ClientCompletion<StripeClientConfiguration>) {
        let query = GetFundingSourceClientConfigurationQuery()
        let operation = operationFactory.generateQueryOperation(query: query, graphQLClient: graphQLClient, cachePolicy: cachePolicy, logger: logger)
        let completionObserver = PlatformBlockObserver(finishHandler: { [weak operation, weak self] _, errors in
            guard let weakSelf = self else { return }
            if let error = errors.first {
                completion(.failure(error))
                return
            }
            guard
                let encodedDataString = operation?.result?.getFundingSourceClientConfiguration.data,
                let encodedData = Data(base64Encoded: encodedDataString)
            else {
                completion(.failure(SudoVirtualCardsError.getFailed))
                return
            }
            do {
                let configuration = try weakSelf.decoder.decode(StripeClientConfiguration.self, from: encodedData)
                completion(.success(configuration))
            } catch {
                completion(.failure(SudoVirtualCardsError.getFailed))
            }
        })
        operation.addObserver(completionObserver)
        queue.addOperation(operation)
    }
}
