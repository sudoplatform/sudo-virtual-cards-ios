# Motivation

As of version 20.1.0, the `sudo-virtual-cards-ios` SDK began a number of releases containing breaking changes and new functionality
to allow integration with a new funding source provider **checkout.com**. This funding source provider not only provides
an alternative to **stripe** for using consumer's credit cards as a funding source, but also the ability to use a bank account
using ACH (the Automated Clearing House network).

The purpose of this document is to assist developers with existing **stripe** integrations to
make changes to that implementation. Refer to the Sudo Platform Virtual Cards SDK documentation for 
details of how to add support for checkout.com funding sources.:
https://docs.sudoplatform.com/guides/virtual-cards


# v22.0.1 

Bug fix release - no changes required.

# v22.0.0

This version of the SDK introduces a breaking change in that calls to `setupFundingSource` and 
`refreshFundingSource` now require an additional parameter `applicationData`. The value of this parameter
must be determined in consultation with service deployment as it is used to index a set of server-managed data
which defines the relationship with Plaid, our ACH funding source provider.

This data, while effectively defining a relationship between the client application and the funding source provider,
is currently configured and managed at the service and includes information such as oauth redirect path and client
application name.

```
let provisionalFundingSource = try await virtualCardsClient.setupFundingSource(
    withInput: SetupFundingSourceInput(
        type: .creditCard,
        currency: "USD",
        applicationData: ClientApplicationData(applicationName: "yourApplicationName"),
        supportedProviders: ["checkout"])
)
```

# v21.1.0

This version of the SDK completed the provisioning of virtual cards backed by Bank Account funding sources, available 
through integration with Plaid Link and Checkout. Checkout provides the actual payment processing
and Plaid Link manages the integration between our users and the ACH network, ensuring that users can provide access 
to their bank account to be used to fund virtual card transactions without providing any authentication details 
to our service.

Additionally, the charge details that exist on each Transaction now have their own `state` field which 
indicates the status of the transaction interaction with the funding source provider. This is most
significant for ACH transactions as at this time, all stripe funding source transactions remain in state 
`cleared`.

```
public enum ChargeDetailState: Hashable {
    /// Funding transaction initiated
    case pending
    /// Funding transaction cleared
    case cleared
    /// Funding transaction failed due to insufficient funds
    case insufficientFunds
    /// Funding transaction failed for other reasons
    case failed
    /// Backwards compatibility guard for catching new enum values added by the service - check you have the latest version of the SDK
    case unknown(String)
}
```

No code changes are required to support **stripe** funding source integrations.

# v21.0.0

This version of the SDK is breaking due to dependency updates across breaking versions. Some changes may be necessary
in order to rebuild against these versions of external components but no significant changes should be required.

# v20.3.0

This version of the SDK adds a transactionVelocity attribute to funding source identifying the current transaction
velocity. Transaction velocity is used as a measure of card risk. No changes are required.

# v20.2.0

This version of the SDK adds a cardType to card funding sources identifying the funding model of the card 
(credit card, debit card, etc). No changes are required, although it may be relevant to access this
information to display to the user.

# v20.1.0

## Virtual cards configuration

This version of the SDK adds the ability to query the server about the supported configuration for virtual cards.
This includes data such as transaction velocity, maximum transaction amounts, card creation velocity, 
funding source creation / error velocity, funding source support information and supported virtual card currencies.
While no code changes are required in order to integrate with this version of the SDK, clients
may choose to take advantage of the new functionality to display relevant information to the user.

To retrieve virtual cards configuration information, use the following code snippet:
```
let virtualCardsConfig = 
    try await vcClient.getVirtualCardsConfig(cachePolicy: .remoteOnly)
```
<details>
  <summary>Click for virtual cards configuration data types</summary>

```
/// Representation of a Virtual Card Config
public struct VirtualCardsConfig: Equatable {

    /// The maximum number of funding sources that can be
    /// successfully created within a defined period.
    public var maxFundingSourceVelocity: [String]
    
    /// The maximum number of failed funding source
    /// creations that can be performed within a defined period.
    public var maxFundingSourceFailureVelocity: [String]

    /// The maximum number of virtual cards that can be
    /// created within a defined period.
    public var maxCardCreationVelocity: [String]

    /// The maximum number of transactions that
    /// can be created within a defined period.
    public var maxTransactionVelocity: [CurrencyVelocity]

    /// The maximum transaction amount per currency.
    public var maxTransactionAmount: [CurrencyAmount]

    /// The list of supported virtual card currencies.
    public var virtualCardCurrencies: [String]

    /// The funding source support info.
    public var fundingSourceSupportInfo: [FundingSourceSupportInfo]
}

/// Representation of a Funding Source's Info
public struct FundingSourceSupportInfo: Equatable {
    /// The provider type of the Funding Source
    public var providerType: String

    /// The funding source type
    public var fundingSourceType: String

    /// The network type of the funding source
    public var network: String

    /// The details of the funding source
    public var detail: [FundingSourceSupportDetail]
}

/// Representation of a Funding Source's details
public struct FundingSourceSupportDetail: Equatable {
    /// The card type of the funding source
    public var cardType: CardType
}

/// Representation of an enumeration depicting the card type of a [CreditCardFundingSource]
public enum CardType: Hashable {
    /// Credit Card funding source
    case CREDIT
    /// Debit Card funding source
    case DEBIT
    /// Prepaid card funding source
    case PREPAID
    /// Other card funding source type
    case OTHER

    /// Backwards compatibility guard for catching new enum values added by the service - check you have the latest version of the SDK
    case UNKNOWN(String)
}
```
</details>


### Transaction velocity

Note that transaction velocity string values are represented in the format of amount/period, where period is an 
ISO8601 period. For example, a maxCardCreationVelocity of 10 cards per hour, would be represented as 10/PT1H.

https://docs.sudoplatform.com/guides/virtual-cards/virtual-cards-transaction-velocity-constraints


## Stripe credit card funding sources

In order to continue to support only **stripe** as a funding source provider, the following changes must be made:

### getFundingSourceClientConfiguration

The `virtualCardsClient.getFundingSourceClientConfiguration` method has always returned an array of 
`FundingSourceClientConfiguration` objects, however previously there was only one type of such object.
This type now supports an enum with the options `.stripeCard`, `.checkoutCard` and `.checkoutBankAccount`. In order
to continue to support only **stripe**, ensure that you find the `.stripeCard` configuration entity and 
extract the configuration information from it:
```
let fundingSourceClientConfigs = 
    try await virtualCardsClient.getFundingSourceClientConfiguration()
var stripeApiKey: String?
for config in configs {
    if case .stripeCard(let stripeConfig) = config {
        stripeApiKey = stripeConfig.apiKey
        break
    }
}
```

### setupFundingSource

The `virtualCardsClient.setupFundingSource` method takes a new additional parameter which is an array of 
funding source providers. If your application only wishes to support **stripe** as a funding source, then the client code 
should be changed to specify this:
```
let setupResult = try await virtualCardsClient.setupFundingSource(
    withInput: SetupFundingSourceInput(
        type: .creditCard,
        currency: "USD",
        supportedProviders: ["stripe"])
    )
```
If no value is provided for this new parameter, the default provider continues to be **stripe**, however this
may change in the future.

Extract the **stripe**-specific information from the returned provisional funding source:
```
var clientSecret: String?
if case .stripeCard(let stripeProvisioningData) = setupResult.provisioningData {
    clientSecret = stripeProvisioningData.clientSecret
}
```
and provide it directly to the **stripe** provisioning library:
```
let stripeWorker = StripeIntentWorker(
    fromInputDetails: input,
    clientSecret: clientSecret,
    stripeClient: stripeClient,
    authenticationContext: self
)
```
Once the interaction with **stripe** is completed, present the resultant information to the service using the 
`completeFundingSource` method.

### completeFundingSource

Invocation of the virtualCardClient.completeFundingSource method must be modified to indicate that the funding source
being completed is for the stripe provider.
```
let completeResult = try await virtualCardsClient.completeFundingSource(
    withInput: CompleteFundingSourceInput(
        id: setupResult.id,
        completionData: .stripeCard(StripeCardCompletionDataInput(paymentMethodId: paymentMethodId))
    )
```
