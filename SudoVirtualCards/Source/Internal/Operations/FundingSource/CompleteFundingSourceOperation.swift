//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoOperations
import AWSAppSync
import SudoLogging

private typealias SetupOperation = SetupFundingSourceOperation
private typealias StripeOperation = GetStripeIntentOperation

/// Complete Funding Source Dependency Condition.
///
/// Ensures that dependencies are correctly evaluated and injects dependency data into the `CompleteFundingSourceOperation`.
class CompleteFundingSourceDependencyCondition: PlatformOperationCondition {

    static var name: String = "CompleteFundingSourceDependencyCondition"

    func dependencyForOperation(_ operation: PlatformOperation) -> Operation? {
        return nil
    }

    func evaluateForOperation(_ operation: PlatformOperation, completion: (PlatformOperationConditionResult) -> Void) {
            guard let operation = operation as? CompleteFundingSourceOperation else {
            let cause = "Only `CompleteFundingSourceOperation` can be assigned with a \(type(of: self).name) condition"
            let error = SudoVirtualCardsError.internalError(cause: cause)
            completion(.failure(error))
            return
        }
        guard let setupOperation = operation.dependencies.first(where: { $0 is SetupOperation }) as? SetupOperation else {
            let cause = "Required `SetupFundingSourceOperation` dependency is missing"
            let error = SudoVirtualCardsError.internalError(cause: cause)
            completion(.failure(error))
            return
        }
        if let error = setupOperation.errors.first {
            completion(.failure(error))
            return
        }
        guard let clientId = setupOperation.resultObject?.id else {
            let cause = "Unable to resolve `id` from `SetupFundingSourceOperation` dependency"
            let error = SudoVirtualCardsError.internalError(cause: cause)
            completion(.failure(error))
            return
        }
        guard let stripeOperation = operation.dependencies.first(where: { $0 is GetStripeIntentOperation }) as? GetStripeIntentOperation else {
            let cause = "Required `GetStripeIntentOperation` dependency is missing"
            let error = SudoVirtualCardsError.internalError(cause: cause)
            completion(.failure(error))
            return
        }
        if let error = stripeOperation.errors.first {
            completion(.failure(error))
            return
        }
        guard let paymentMethodID = stripeOperation.resultObject?.paymentMethodID else {
            let cause = "Unable to resolve `stripePaymentMethodID` from `GetStripeIntentOperation` dependency"
            let error = SudoVirtualCardsError.internalError(cause: cause)
            completion(.failure(error))
            return
        }
        operation.injectables = CompleteFundingSourceOperation.Injectables(clientId: clientId, paymentMethodId: paymentMethodID)
        completion(.success(()))
    }
}

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
class CompleteFundingSourceOperation: PlatformOperation {

    // MARK: - Supplementary

    /// Contains the values that **MUST** be injected into this operation. This occurs in the `CompleteFundingSourceDependencyCondition`, and if not properly
    /// injected, will supply error.
    struct Injectables {
        /// The `StripeSetup.id` value retrieved via the `SetupFundingSourceOperation` class.
        let clientId: String

        /// The `STPSetupIntent.paymentMethodID` value retrieved via the `STPAPIClient.confirmSetupIntent` method.
        let paymentMethodId: String
    }

    // MARK: - Properties

    /// Funding source service used to complete the funding source.
    unowned var fundingSourceService: FundingSourceService

    /// Result object of the operation. Returns a fully fledged `FundingSource` from the service.
    var resultObject: FundingSource?

    /// Injected data from other dependencies.
    var injectables: Injectables!

    // MARK: - Lifecycle

    /// Initalize a `CompleteFundingSourceOperation`.
    /// - Parameters:
    ///   - fundingSourceService: Funding source service used to complete the funding source.
    init(fundingSourceService: FundingSourceService, logger: Logger) {
        self.fundingSourceService = fundingSourceService
        super.init(logger: logger)
        addCondition(CompleteFundingSourceDependencyCondition())
    }

    override func execute() {
        fundingSourceService.complete(clientId: injectables.clientId, paymentMethodId: injectables.paymentMethodId) { result in
            switch result {
            case let .success(fundingSource):
                self.resultObject = fundingSource
                self.finish()
                return
            case let .failure(error):
                self.finishWithError(error)
                return
            }
        }
    }

}
