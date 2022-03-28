//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoOperations
import AWSAppSync
import SudoLogging

/// Operation that performs the setup funding source operation from the Virtual Cards Service.
///
/// This operation hits the service mutation GraphQL `setupFundingSource`.
///
/// The `resultObject` contains the information to interact with Stripe's Payment Intents.
///
/// **Prerequisites**
///
/// *This method does not contain any prerequisites.*
///
class SetupFundingSourceOperation: PlatformGroupOperation {

    // MARK: - Properties

    /// Result object of the operation. Returns the result of a `SetupFundingSource` mutation to the service.
    /// If this is nil, an issue has likely occurred while executing the operation.
    var resultObject: StripeSetup?

    // MARK: - Lifecycle

    /// Initialize a `SetupFundingSourceOperation`.
    ///
    /// This primes the internal queue with an operation to call the mutation `setupFundingSource`
    /// on the Virtual Cards Service.
    ///
    /// - Parameters:
    ///   - input: Information necessary to perform the operation.
    ///   - appSyncClient: The appsync client used to call the service.
    ///   - operationFactory: Operation factory to generate the mutation operation to call the service for configuration.
    ///   - logger: Logs errors and debugging information.
    init(input: SetupFundingSourceInput, appSyncClient: AWSAppSyncClient, operationFactory: OperationFactory, logger: Logger) {
        let input = SetupFundingSourceRequest(type: input.type.fundingSourceType, currency: input.currency)
        let mutation = SetupFundingSourceMutation(input: input)
        let operation = operationFactory.generateMutationOperation(
            mutation: mutation,
            appSyncClient: appSyncClient,
            serviceErrorTransformations: [FundingSourceError.init(_:)],
            logger: logger)
        super.init(logger: logger, operations: [operation])
    }

    // MARK: - Overrides

    override func operationDidFinish(_ operation: Operation, withErrors errors: [Error]) {
        guard let operation = operation as? PlatformMutationOperation<SetupFundingSourceMutation> else {
            let msg = "Finish handler operation observer MUST match operation"
            logger.error(msg)
            addErrorToAggregate(error: AnyError(msg))
            return
        }
        guard let result = operation.result else {
            addErrorToAggregate(error: FundingSourceError.setupFailed)
            return
        }
        do {
            guard let base64Data = Data(base64Encoded: result.setupFundingSource.provisioningData) else {
                throw AnyError("Provisioning Data not base64 string")
            }
            let stripeSetupData = try JSONDecoder().decode(StripeSetup.Data.self, from: base64Data)
            let stripeSetup = StripeSetup(id: result.setupFundingSource.id, data: stripeSetupData)
            resultObject = stripeSetup
        } catch {
            self.logger.error("Failed to decode stripe setup data: \(error)")
            addErrorToAggregate(error: FundingSourceError.setupFailed)
        }
    }
}
