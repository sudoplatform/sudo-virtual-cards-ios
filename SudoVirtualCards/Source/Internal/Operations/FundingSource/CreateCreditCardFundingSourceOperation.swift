//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoOperations
import AWSAppSync
import SudoLogging

/// Operation that performs the creation of a Credit Card FundingSource with the Virtual Cards Service.
///
/// The `resultObject` contains a fully fledged Funding Source from the service, ready to be used to generate a virtual card by the consumer.
///
/// **Prerequisites**
///
/// *This method does not contain any prerequisites.*
///
class CreateCreditCardFundingSourceOperation: PlatformGroupOperation {

    /// Hard-coded curency support until further notice.
    let setupInput = SetupFundingSourceInput(type: .creditCard, currency: "USD")

    /// Result object of the operation. Returns the fully fledged Funding Source from the service, ready to be used to generate a virtual card by the consumer.
    /// If this is nil, an issue has likely occurred with accessing the configuration from the service.
    var resultObject: FundingSource?

    /// Initialize a `CreditCardFundingSourceOperation`.
    ///
    /// - Parameters:
    ///   - input: Input information necessary to provision a funding source.
    ///   - authorizationDelegate: `FundingSourceAuthorizationDelegate` delegate to forward any UI hooks to stripe 3Ds with.
    ///   - appSyncClient: The appsync client used to call the service.
    ///   - operationFactory: Operation factory used to generate query and mutation operations.
    ///   - logger: Logs errors and debugging information.
    init(
        input: CreditCardFundingSourceInput,
        authorizationDelegate: FundingSourceAuthorizationDelegate?,
        appSyncClient: AWSAppSyncClient,
        operationFactory: OperationFactory,
        logger: Logger
    ) {
        let clientConfigOperation = GetFundingSourceClientConfigurationOperation(
            operationFactory: operationFactory,
            appSyncClient: appSyncClient,
            logger: logger)
        let setupOperation = SetupFundingSourceOperation(input: setupInput, appSyncClient: appSyncClient, operationFactory: operationFactory, logger: logger)
        let stripeIntentOperation = GetStripeIntentOperation(inputDetails: input, authorizationDelegate: authorizationDelegate, logger: logger)
        let completeOperation = CompleteFundingSourceOperation(operationFactory: operationFactory, appSyncClient: appSyncClient, logger: logger)

        stripeIntentOperation.addDependency(clientConfigOperation)
        stripeIntentOperation.addDependency(setupOperation)
        completeOperation.addDependency(setupOperation)
        completeOperation.addDependency(stripeIntentOperation)

        super.init(logger: logger, operations: [clientConfigOperation, setupOperation, stripeIntentOperation, completeOperation])
    }

    // MARK: - Overrides

    override func operationDidFinish(_ operation: Operation, withErrors errors: [Error]) {
        guard let operation = operation as? CompleteFundingSourceOperation else {
            return
        }
        resultObject = operation.resultObject
    }
}
