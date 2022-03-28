//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoOperations
import AWSAppSync
import SudoLogging

/// Operation that performs the complete funding source operation from the Virtual Cards Service.
///
/// This operation hits the service mutation GraphQL `completeFundingSource`.
///
/// The `resultObject` contains the provisioned/registered FundingSource.
///
/// **Prerequisites**
///
/// - `SetupFundingSourceOperation`
/// - `GetStripeIntentOperation`
///
class CompleteFundingSourceOperation: PlatformGroupOperation {

    // MARK: - Supplementary

    /// Contains the values that **MUST** be injected into this operation. This occurs in the
    /// `evaluateCustomConditions` method, and if not properly injected, will error with
    /// `PlatformOperationError.conditionFailed`.
    struct Injectables {
        /// The `StripeSetup.id` value retrieved via the `SetupFundingSourceOperation` class.
        let clientId: String

        /// The `STPSetupIntent.paymentMethodID` value retrieved via the `STPAPIClient.confirmSetupIntent` method.
        let paymentMethodId: String
    }

    private typealias SetupOperation = SetupFundingSourceOperation
    private typealias StripeOperation = GetStripeIntentOperation

    // MARK: - Properties

    /// Operation factory used to generate the mutation operation.
    unowned let operationFactory: OperationFactory

    /// The appsync client used to call the service.
    unowned let appSyncClient: AWSAppSyncClient

    /// Result object of the operation. Returns a fully fledged `FundingSource` from the service.
    var resultObject: FundingSource?

    /// Injected data from other dependencies.
    var injectables: Injectables!

    // MARK: - Lifecycle

    /// Initalize a `CompleteFundingSourceOperation`.
    /// - Parameters:
    ///   - operationFactory: Operation factory used to generate the mutation operation.
    ///   - appSyncClient: The appsync client used to call the service.
    ///   - logger: Logs errors and debugging information.
    init(operationFactory: OperationFactory, appSyncClient: AWSAppSyncClient, logger: Logger) {
        self.operationFactory = operationFactory
        self.appSyncClient = appSyncClient

        super.init(logger: logger, operations: [])
    }

    // MARK: - Overrides

    override func evaluateCustomConditions() -> Bool {
        guard super.evaluateCustomConditions() else {
            return false
        }
        guard let setupOperation = dependencies.first(where: { $0 is SetupOperation }) as? SetupOperation else {
            logger.error("Required `SetupFundingSourceOperation` dependency is missing")
            return false
        }
        guard let clientId = setupOperation.resultObject?.id else {
            logger.error("Unable to resolve `stripeID` from `GetStripeIntentOperation` dependency")
            return false
        }
        guard let stripeOperation = dependencies.first(where: { $0 is GetStripeIntentOperation }) as? GetStripeIntentOperation else {
            logger.error("Required `GetStripeIntentOperation` dependency is missing")
            return false
        }
        guard let paymentMethodID = stripeOperation.resultObject?.paymentMethodID else {
            logger.error("Unable to resolve `stripePaymentMethodID` from `GetStripeIntentOperation` dependency")
            return false
        }
        injectables = Injectables(clientId: clientId, paymentMethodId: paymentMethodID)
        return true
    }

    override func execute() {
        let completionData = StripeCompletionData(paymentMethod: injectables.paymentMethodId)
        let encodedCompletionData: String
        do {
            let data = try JSONEncoder().encode(completionData)
            encodedCompletionData = data.base64EncodedString()
        } catch {
            logger.error("Failed to encode completionData: \(error)")
            finishWithError(error)
            return
        }
        let input = CompleteFundingSourceRequest(id: injectables.clientId, completionData: encodedCompletionData)
        let mutation = CompleteFundingSourceMutation(input: input)
        let operation = operationFactory.generateMutationOperation(
            mutation: mutation,
            appSyncClient: appSyncClient,
            serviceErrorTransformations: [FundingSourceError.init(_:)],
            logger: logger)

        addOperation(operation)
        super.execute()
    }

    override func operationDidFinish(_ operation: Operation, withErrors errors: [Error]) {
        guard let operation = operation as? PlatformMutationOperation<CompleteFundingSourceMutation> else {
            let msg = "Finish handler operation observer MUST match operation"
            logger.error(msg)
            addErrorToAggregate(error: AnyError(msg))
            return
        }
        guard let result = operation.result else {
            addErrorToAggregate(error: FundingSourceError.completionFailed)
            return
        }

        let fundingSource = FundingSource(completeFundingSource: result.completeFundingSource)
        self.resultObject = fundingSource
    }
}
