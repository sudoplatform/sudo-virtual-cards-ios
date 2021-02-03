//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoOperations
import AWSAppSync
import Stripe
import SudoLogging

// swiftlint:disable type_name

private typealias SetupOperation = SetupFundingSourceOperation
private typealias ConfigurationOperation = GetFundingSourceClientConfigurationOperation

/// Basic class with a shared instance to facilitate being able to mock a stripe API in unit tests
class StripeAPIBuilder {

    /// Shared builder instance
    static var shared: StripeAPIBuilder = StripeAPIBuilder()

    func build(withAPIKey key: String) -> STPAPIClient {
        return STPAPIClient(publishableKey: key)
    }
}

class GetStripeIntentOperationDependencyCondition: PlatformOperationCondition {

    static var name: String = "GetStripeIntentOperationDependencyCondition"

    func dependencyForOperation(_ operation: PlatformOperation) -> Operation? {
        return nil
    }

    func evaluateForOperation(_ operation: PlatformOperation, completion: (PlatformOperationConditionResult) -> Void) {
        guard let operation = operation as? GetStripeIntentOperation else {
            let cause = "Only `GetStripeIntentOperation` can be assigned with a \(type(of: self).name) condition"
            let error = SudoVirtualCardsError.internalError(cause)
            completion(.failure(error))
            return
        }
        guard let setupOperation = operation.dependencies.first(where: { $0 is SetupOperation }) as? SetupOperation else {
            let cause = "Required `SetupFundingSourceOperation` dependency is missing"
            let error = SudoVirtualCardsError.internalError(cause)
            completion(.failure(error))
            return
        }
        if let error = setupOperation.errors.first {
            completion(.failure(error))
            return
        }
        guard let clientSecret = setupOperation.resultObject?.clientSecret else {
            let cause = "Unable to resolve `clientSecret` from `SetupFundingSourceOperation` dependency"
            let error = SudoVirtualCardsError.internalError(cause)
            completion(.failure(error))
            return
        }
        guard let configurationOperation = operation.dependencies.first(where: { $0 is ConfigurationOperation }) as? ConfigurationOperation else {
            let cause = "Required `GetFundingSourceConfigurationOperation` dependency is missing"
            let error = SudoVirtualCardsError.internalError(cause)
            completion(.failure(error))
            return
        }
        if let error = configurationOperation.errors.first {
            completion(.failure(error))
            return
        }
        guard let apiKey = configurationOperation.resultObject?.fundingSourceTypes.first?.apiKey else {
            let cause = "Unable to resolve `apiKey` from `GetFundingSourceConfigurationOperation` dependency"
            let error = SudoVirtualCardsError.internalError(cause)
            completion(.failure(error))
            return
        }
        operation.injectables = GetStripeIntentOperation.Injectables(apiKey: apiKey, clientSecret: clientSecret)
        completion(.success(()))
    }

}

/// Operation that performs the Stripe Intents, and additional authorization if required.
///
/// The `resultObject` contains the Stripe Intent required to complete a funding source on the Virtual Cards Service.
///
/// **Prerequisites**
///
/// - `GetFundingSourceClientConfigurationOperation`
/// - `SetupFundingSourceOperation`
///
class GetStripeIntentOperation: PlatformOperation, STPAuthenticationContext {

    // MARK: - Supplementary

    /// Contains the values that **MUST** be injected into this operation. This occurs in the `GetStripeIntentOperationDependencyCondition`, and if not properly
    /// injected, will supply error.
    struct Injectables {
        /// The `StripeClientConfiguration.FundingSourceType.apiKey` object retrieved via
        /// the `GetFundingSourceClientConfigurationOperation` class.
        let apiKey: String

        /// The `StripeSetup.clientSecret` result object retrieved via the `SetupFundingSourceOperation` class.
        let clientSecret: String
    }

    // MARK: - Properties

    /// The payment method parameters to send to the stripe API
    let stripePaymentParameters: STPPaymentMethodParams

    /// Any injected data.
    var injectables: Injectables!

    /// The intent object from the main operation.
    var resultObject: STPSetupIntent?

    /// `FundingSourceAuthorizationDelegate` delegate to forward any UI hooks to stripe 3Ds with.
    weak var authorizationDelegate: FundingSourceAuthorizationDelegate?

    // MARK: - Lifecycle

    /// Initialize a `GetStripeIntentOperation`.
    ///
    /// Constructs the needed input for the StripeAPI.
    ///
    /// - Parameters:
    ///   - inputDetails: Information necessary to perform the stripe operation.
    ///   - authorizationDelegate: `FundingSourceAuthorizationDelegate` delegate to forward any UI hooks to stripe 3Ds with.
    ///   - logger: Logs errors and debugging information.
    init(inputDetails: CreditCardFundingSourceInput, authorizationDelegate: FundingSourceAuthorizationDelegate?, logger: Logger) {
        let cardDetails = STPCardParams()
        cardDetails.number = inputDetails.cardNumber
        cardDetails.expMonth = UInt(inputDetails.expirationMonth)
        cardDetails.expYear = UInt(inputDetails.expirationYear)
        cardDetails.cvc = inputDetails.securityCode
        // Billing Address
        let billingDetails = STPPaymentMethodBillingDetails()
        billingDetails.address = STPPaymentMethodAddress()
        billingDetails.address?.line1 = inputDetails.address
        if let unitNumber = inputDetails.unitNumber {
            billingDetails.address?.line1 = "\(unitNumber) / \(inputDetails.address)"
        }
        billingDetails.address?.city = inputDetails.city
        billingDetails.address?.state = inputDetails.state
        billingDetails.address?.postalCode = inputDetails.postalCode
        billingDetails.address?.country = inputDetails.country
        // Assign
        let cardParameters = STPPaymentMethodCardParams(cardSourceParams: cardDetails)
        stripePaymentParameters = STPPaymentMethodParams(card: cardParameters, billingDetails: billingDetails, metadata: nil)
        self.authorizationDelegate = authorizationDelegate
        super.init(logger: logger)
        addCondition(GetStripeIntentOperationDependencyCondition())
    }

    // MARK: - Overrides

    override func execute() {
        let stripeClient = StripeAPIBuilder.shared.build(withAPIKey: injectables.apiKey)
        STPPaymentHandler.shared().apiClient = stripeClient
        let intentParameters = STPSetupIntentConfirmParams(clientSecret: injectables.clientSecret)
        intentParameters.paymentMethodParams = stripePaymentParameters
        intentParameters.returnURL = authorizationDelegate?.returnURL
        stripeClient.confirmSetupIntent(with: intentParameters) { intent, error in
            guard let setupIntent = intent, setupIntent.status == .requiresAction else {
                self.handleStandardResponse(withIntent: intent, error: error)
                return
            }
            DispatchQueue.main.async {
                STPPaymentHandler.shared().confirmSetupIntent(intentParameters, with: self) { status, intent, error in
                    var setupIntent: STPSetupIntent?
                    var error: Error? = error
                    switch status {
                    case .succeeded:
                        setupIntent = intent
                    case .failed:
                        if self.authorizationDelegate == nil {
                            let msg = "Authorization delegate is nil"
                            self.logger.error(msg)
                            error = AnyError(msg)
                        } else {
                            let msg = "Additional Authorization failed"
                            self.logger.error(msg)
                            error = AnyError(msg)
                        }
                    case .canceled:
                        let msg = "Additional Authorization cancelled"
                        self.logger.warning(msg)
                        error = AnyError(msg)
                    @unknown default:
                        break
                    }
                    // At this point we just continue on as the next operations have custom condition checks.
                    self.handleStandardResponse(withIntent: setupIntent, error: error)
                }
            }
        }
    }

    // MARK: - Helpers

    func handleStandardResponse(withIntent intent: STPSetupIntent?, error: Error?) {
        self.resultObject = intent
        finishWithError(error)
    }

    // MARK: - Conformance: STPAuthenticationContext

    func authenticationPresentingViewController() -> UIViewController {
        guard let delegate = authorizationDelegate else {
            // Will trigger a failure
            return UIViewController()
        }
        return delegate.fundingSourceAuthorizationPresentingViewController()
    }
}
