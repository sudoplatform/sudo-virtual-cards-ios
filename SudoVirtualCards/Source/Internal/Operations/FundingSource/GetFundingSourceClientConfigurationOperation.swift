//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// `GetFundingSourceClientConfigurationOperation` is in violation of 3-40 character rule.
// swiftlint:disable type_name

import Foundation
import SudoOperations
import AWSAppSync
import SudoLogging

/// Operation that retrieves the FundingSource Client Configuration from Virtual Cards Service.
///
/// This operation hits the service query GraphQL `getFundingSourceClientConfiguration`.
///
/// The `resultObject` contains the stripe client configuration.
///
/// **Prerequisites**
///
/// *This method does not contain any prerequisites.*
///
class GetFundingSourceClientConfigurationOperation: PlatformGroupOperation {

    // MARK: - Properties

    /// Result object of the operation. Returns the configuration used to configure a stripe client.
    /// If this is nil, an issue has likely occurred with accessing the configuration from the service.
    var resultObject: StripeClientConfiguration?

    // MARK: - Lifecyle

    /// Initialize a `GetFundingSourceClientConfigurationOperation`.
    ///
    /// This primes the internal queue with an operation to fetch the configuration. This operation will
    /// **ALWAYS** call out to the service for the latest configuration.
    ///
    /// - Parameters:
    ///   - operationFactory: Operation factory to generate the query operation to call the service for configuration.
    ///   - appSyncClient: The appsync client used to call the service.
    ///   - logger: Logs errors and debugging information.
    init(operationFactory: OperationFactory, appSyncClient: AWSAppSyncClient, logger: Logger) {
        let query = GetFundingSourceClientConfigurationQuery()
        // We always want to get the latest configuration, so use online
        let operation = operationFactory.generateQueryOperation(query: query, appSyncClient: appSyncClient, cachePolicy: .useOnline, logger: logger)
        super.init(logger: logger, operations: [operation])
    }

    // MARK: - Overrides

    override func operationDidFinish(_ operation: Operation, withErrors errors: [Error]) {
        guard errors.isEmpty else {
            // Errors will get handled in parent class.
            return
        }
        guard let operation = operation as? PlatformQueryOperation<GetFundingSourceClientConfigurationQuery> else {
            let msg = "Finish handler operation observer MUST match operation"
            logger.error(msg)
            addErrorToAggregate(error: AnyError(msg))
            return
        }
        guard
            let encodedDataString = operation.result?.getFundingSourceClientConfiguration.data,
            let encodedData = Data(base64Encoded: encodedDataString)
        else {
            addErrorToAggregate(error: GetFundingSourceClientConfigurationError.getFailed)
            return
        }
        do {
            let configuration = try JSONDecoder().decode(StripeClientConfiguration.self, from: encodedData)
            resultObject = configuration
        } catch {
            logger.error("Failed to decode configuration: \(error)")
            addErrorToAggregate(error: error)
        }
    }
}
