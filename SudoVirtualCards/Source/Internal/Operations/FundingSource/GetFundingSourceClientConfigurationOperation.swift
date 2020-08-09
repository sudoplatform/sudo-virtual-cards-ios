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
class GetFundingSourceClientConfigurationOperation: PlatformOperation {

    // MARK: - Properties

    /// Result object of the operation. Returns the configuration used to configure a stripe client.
    /// If this is nil, an issue has likely occurred with accessing the configuration from the service.
    var resultObject: StripeClientConfiguration?

    /// Funding source service used to retrieve the configuration.
    unowned var fundingSourceService: FundingSourceService

    // MARK: - Lifecyle

    /// Initialize a `GetFundingSourceClientConfigurationOperation`.
    ///
    /// This primes the internal queue with an operation to fetch the configuration. This operation will
    /// **ALWAYS** call out to the service for the latest configuration.
    ///
    /// - Parameters:
    ///   - fundingSourceService: Funding source service used to retrieve the configuration.
    init(fundingSourceService: FundingSourceService, logger: Logger) {
        self.fundingSourceService = fundingSourceService
        super.init(logger: logger)
    }

    // MARK: - Overrides

    override func execute() {
        // We always want to get the latest configuration, so use online
        fundingSourceService.getConfig(cachePolicy: .remoteOnly) { result in
            switch result {
            case let .success(config):
                self.resultObject = config
                self.finish()
            case let .failure(error):
                self.finishWithError(error)
            }
        }
    }

}
