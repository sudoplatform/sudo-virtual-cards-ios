//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import Stripe
import AppSyncRealTimeClient
import SudoLogging

// This will all be removed on PAY-1166.
class StripeIntentWorker: NSObject, STPAuthenticationContext {

    let stripeClient: STPAPIClient
    let intentParameters: STPSetupIntentConfirmParams
    weak var authorizationDelegate: FundingSourceAuthorizationDelegate?
    let logger: Logger

    init(
       fromInputDetails inputDetails: CreditCardFundingSourceInput,
       clientSecret: String,
       stripeClient: STPAPIClient,
       authorizationDelegate: FundingSourceAuthorizationDelegate? = nil,
       logger: Logger = .virtualCardsSDKLogger
    ) {
        self.stripeClient = stripeClient
        self.logger = logger
        self.authorizationDelegate = authorizationDelegate
        STPPaymentHandler.shared().apiClient = self.stripeClient

        intentParameters = STPSetupIntentConfirmParams(clientSecret: clientSecret)
        intentParameters.paymentMethodParams = StripeIntentWorker.getStripePaymentMethodParams(fromInputDetails: inputDetails)
        intentParameters.returnURL = authorizationDelegate?.returnURL
    }

    func confirmSetupIntent() async throws -> String {
        let setupIntent: STPSetupIntent = try await withCheckedThrowingContinuation { continuation in
            stripeClient.confirmSetupIntent(with: intentParameters) { intent, error in
                guard let setupIntent = intent else {
                    if let error = error {
                        return continuation.resume(throwing: error)
                    }
                    return continuation.resume(throwing: SudoVirtualCardsError.internalError("Unknown Stripe Error"))
                }
                // Check that status doesn't require action, else finish.
                guard setupIntent.status == .requiresAction else {
                    return continuation.resume(returning: setupIntent)
                }
                DispatchQueue.main.async {
                    STPPaymentHandler.shared().confirmSetupIntent(self.intentParameters, with: self) { status, intent, error in
                        switch status {
                        case .succeeded:
                            guard let intent = intent else {
                                return continuation.resume(throwing: SudoVirtualCardsError.internalError("Intent is nil on success"))
                            }
                            return continuation.resume(returning: intent)
                        case .failed:
                            if self.authorizationDelegate == nil {
                                let msg = "Authorization delegate is nil"
                                self.logger.error(msg)
                                return continuation.resume(throwing: AnyError(msg))
                            } else {
                                let msg = "Additional Authorization failed"
                                self.logger.error(msg)
                                return continuation.resume(throwing: AnyError(msg))
                            }
                        case .canceled:
                            let msg = "Additional Authorization cancelled"
                            self.logger.error(msg)
                            return continuation.resume(throwing: AnyError(msg))
                        }
                    }
                }
            }
        }
        guard let paymentMethodId = setupIntent.paymentMethodID else {
            throw SudoVirtualCardsError.internalError("Invalid Stripe Setup Intent received - no paymentMethodID found")
        }
        return paymentMethodId
    }

    // MARK: - Private: Static Helpers

    private static func getStripePaymentMethodParams(fromInputDetails inputDetails: CreditCardFundingSourceInput) -> STPPaymentMethodParams {
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
        return STPPaymentMethodParams(card: cardParameters, billingDetails: billingDetails, metadata: nil)
    }

    // MARK: - Conformance: STPAuthenticationContext

    func authenticationPresentingViewController() -> UIViewController {
        guard let delegate = authorizationDelegate else {
            return UIViewController()
        }
        return delegate.fundingSourceAuthorizationPresentingViewController()
    }

}
