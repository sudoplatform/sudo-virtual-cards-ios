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
class SetupFundingSourceOperation: PlatformOperation {

    // MARK: - Properties

    /// Result object of the operation. Returns the result of a `SetupFundingSource` mutation to the service.
    /// If this is nil, an issue has likely occurred while executing the operation.
    var resultObject: StripeSetup?

    var input: SetupFundingSourceInput

    /// Funding source service used to setup the provisional funding source.
    var fundingSourceService: FundingSourceService

    // MARK: - Lifecycle

    /// Initialize a `SetupFundingSourceOperation`.
    ///
    /// This primes the internal queue with an operation to call the mutation `setupFundingSource`
    /// on the Virtual Cards Service.
    ///
    /// - Parameters:
    ///   - input: Information necessary to perform the operation.
    ///   - fundingSourceService: Funding source service used to setup the provisional funding source.
    ///   - logger: Logs errors and debugging information.
    init(input: SetupFundingSourceInput, fundingSourceService: FundingSourceService, logger: Logger) {
        self.input = input
        self.fundingSourceService = fundingSourceService
        super.init(logger: logger)
    }

    // MARK: - Overrides

    override func execute() {
        fundingSourceService.setup(input: input) { [weak self] result in
            switch result {
            case let .success(setup):
                self?.resultObject = setup
                self?.finish()
            case let .failure(error):
                self?.finishWithError(error)
            }
        }
    }

}
