// swiftlint:disable all
//  This file was automatically generated and should not be edited.

import AWSAppSync

internal enum ProvisioningState: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case provisioning
  case completed
  case failed
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "PROVISIONING": self = .provisioning
      case "COMPLETED": self = .completed
      case "FAILED": self = .failed
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .provisioning: return "PROVISIONING"
      case .completed: return "COMPLETED"
      case .failed: return "FAILED"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: ProvisioningState, rhs: ProvisioningState) -> Bool {
    switch (lhs, rhs) {
      case (.provisioning, .provisioning): return true
      case (.completed, .completed): return true
      case (.failed, .failed): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal enum CardState: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case issued
  case failed
  case closed
  case suspended
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "ISSUED": self = .issued
      case "FAILED": self = .failed
      case "CLOSED": self = .closed
      case "SUSPENDED": self = .suspended
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .issued: return "ISSUED"
      case .failed: return "FAILED"
      case .closed: return "CLOSED"
      case .suspended: return "SUSPENDED"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: CardState, rhs: CardState) -> Bool {
    switch (lhs, rhs) {
      case (.issued, .issued): return true
      case (.failed, .failed): return true
      case (.closed, .closed): return true
      case (.suspended, .suspended): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

/// If a resource is marked as DELETE, the reference should be cleaned from the cache.
internal enum DeltaAction: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case delete
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "DELETE": self = .delete
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .delete: return "DELETE"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: DeltaAction, rhs: DeltaAction) -> Bool {
    switch (lhs, rhs) {
      case (.delete, .delete): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal struct ProvisionalCardFilterInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(id: Optional<IDFilterInput?> = nil, owner: Optional<IDFilterInput?> = nil, clientRefId: Optional<IDFilterInput?> = nil) {
    graphQLMap = ["id": id, "owner": owner, "clientRefId": clientRefId]
  }

  internal var id: Optional<IDFilterInput?> {
    get {
      return graphQLMap["id"] as! Optional<IDFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  internal var owner: Optional<IDFilterInput?> {
    get {
      return graphQLMap["owner"] as! Optional<IDFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "owner")
    }
  }

  internal var clientRefId: Optional<IDFilterInput?> {
    get {
      return graphQLMap["clientRefId"] as! Optional<IDFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "clientRefId")
    }
  }
}

internal struct IDFilterInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(ne: Optional<GraphQLID?> = nil, eq: Optional<GraphQLID?> = nil, le: Optional<GraphQLID?> = nil, lt: Optional<GraphQLID?> = nil, ge: Optional<GraphQLID?> = nil, gt: Optional<GraphQLID?> = nil, contains: Optional<GraphQLID?> = nil, notContains: Optional<GraphQLID?> = nil, between: Optional<[GraphQLID?]?> = nil, beginsWith: Optional<GraphQLID?> = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith]
  }

  internal var ne: Optional<GraphQLID?> {
    get {
      return graphQLMap["ne"] as! Optional<GraphQLID?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  internal var eq: Optional<GraphQLID?> {
    get {
      return graphQLMap["eq"] as! Optional<GraphQLID?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  internal var le: Optional<GraphQLID?> {
    get {
      return graphQLMap["le"] as! Optional<GraphQLID?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  internal var lt: Optional<GraphQLID?> {
    get {
      return graphQLMap["lt"] as! Optional<GraphQLID?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  internal var ge: Optional<GraphQLID?> {
    get {
      return graphQLMap["ge"] as! Optional<GraphQLID?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  internal var gt: Optional<GraphQLID?> {
    get {
      return graphQLMap["gt"] as! Optional<GraphQLID?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  internal var contains: Optional<GraphQLID?> {
    get {
      return graphQLMap["contains"] as! Optional<GraphQLID?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  internal var notContains: Optional<GraphQLID?> {
    get {
      return graphQLMap["notContains"] as! Optional<GraphQLID?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  internal var between: Optional<[GraphQLID?]?> {
    get {
      return graphQLMap["between"] as! Optional<[GraphQLID?]?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  internal var beginsWith: Optional<GraphQLID?> {
    get {
      return graphQLMap["beginsWith"] as! Optional<GraphQLID?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }
}

internal struct CardFilterInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(id: Optional<IDFilterInput?> = nil, owner: Optional<IDFilterInput?> = nil, keyId: Optional<IDFilterInput?> = nil, state: Optional<IDFilterInput?> = nil) {
    graphQLMap = ["id": id, "owner": owner, "keyId": keyId, "state": state]
  }

  internal var id: Optional<IDFilterInput?> {
    get {
      return graphQLMap["id"] as! Optional<IDFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  internal var owner: Optional<IDFilterInput?> {
    get {
      return graphQLMap["owner"] as! Optional<IDFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "owner")
    }
  }

  internal var keyId: Optional<IDFilterInput?> {
    get {
      return graphQLMap["keyId"] as! Optional<IDFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "keyId")
    }
  }

  internal var state: Optional<IDFilterInput?> {
    get {
      return graphQLMap["state"] as! Optional<IDFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "state")
    }
  }
}

internal enum TransactionType: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case pending
  case complete
  case refund
  case decline
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "PENDING": self = .pending
      case "COMPLETE": self = .complete
      case "REFUND": self = .refund
      case "DECLINE": self = .decline
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .pending: return "PENDING"
      case .complete: return "COMPLETE"
      case .refund: return "REFUND"
      case .decline: return "DECLINE"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: TransactionType, rhs: TransactionType) -> Bool {
    switch (lhs, rhs) {
      case (.pending, .pending): return true
      case (.complete, .complete): return true
      case (.refund, .refund): return true
      case (.decline, .decline): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal struct TransactionFilterInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(id: Optional<IDFilterInput?> = nil, owner: Optional<IDFilterInput?> = nil, cardId: Optional<IDFilterInput?> = nil, keyId: Optional<IDFilterInput?> = nil) {
    graphQLMap = ["id": id, "owner": owner, "cardId": cardId, "keyId": keyId]
  }

  internal var id: Optional<IDFilterInput?> {
    get {
      return graphQLMap["id"] as! Optional<IDFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  internal var owner: Optional<IDFilterInput?> {
    get {
      return graphQLMap["owner"] as! Optional<IDFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "owner")
    }
  }

  internal var cardId: Optional<IDFilterInput?> {
    get {
      return graphQLMap["cardId"] as! Optional<IDFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cardId")
    }
  }

  internal var keyId: Optional<IDFilterInput?> {
    get {
      return graphQLMap["keyId"] as! Optional<IDFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "keyId")
    }
  }
}

/// INACTIVE: Funding source is inactive. Is not usable for funding of new transactions
/// but may receive refunds or additional charges on partially complete transactions.
internal enum FundingSourceState: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case active
  case inactive
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "ACTIVE": self = .active
      case "INACTIVE": self = .inactive
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .active: return "ACTIVE"
      case .inactive: return "INACTIVE"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: FundingSourceState, rhs: FundingSourceState) -> Bool {
    switch (lhs, rhs) {
      case (.active, .active): return true
      case (.inactive, .inactive): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal enum CreditCardNetwork: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case amex
  case diners
  case discover
  case jcb
  case mastercard
  case unionpay
  case visa
  case other
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "AMEX": self = .amex
      case "DINERS": self = .diners
      case "DISCOVER": self = .discover
      case "JCB": self = .jcb
      case "MASTERCARD": self = .mastercard
      case "UNIONPAY": self = .unionpay
      case "VISA": self = .visa
      case "OTHER": self = .other
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .amex: return "AMEX"
      case .diners: return "DINERS"
      case .discover: return "DISCOVER"
      case .jcb: return "JCB"
      case .mastercard: return "MASTERCARD"
      case .unionpay: return "UNIONPAY"
      case .visa: return "VISA"
      case .other: return "OTHER"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: CreditCardNetwork, rhs: CreditCardNetwork) -> Bool {
    switch (lhs, rhs) {
      case (.amex, .amex): return true
      case (.diners, .diners): return true
      case (.discover, .discover): return true
      case (.jcb, .jcb): return true
      case (.mastercard, .mastercard): return true
      case (.unionpay, .unionpay): return true
      case (.visa, .visa): return true
      case (.other, .other): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal struct FundingSourceFilterInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(owner: Optional<IDFilterInput?> = nil) {
    graphQLMap = ["owner": owner]
  }

  internal var owner: Optional<IDFilterInput?> {
    get {
      return graphQLMap["owner"] as! Optional<IDFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "owner")
    }
  }
}

/// Request used to provision a virtual card from a card provider.
internal struct CardProvisionRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(clientRefId: String, ownerProofs: [GraphQLID], keyRingId: GraphQLID, fundingSourceId: GraphQLID, cardHolder: String, alias: String, billingAddress: Optional<AddressInput?> = nil, currency: String) {
    graphQLMap = ["clientRefId": clientRefId, "ownerProofs": ownerProofs, "keyRingId": keyRingId, "fundingSourceId": fundingSourceId, "cardHolder": cardHolder, "alias": alias, "billingAddress": billingAddress, "currency": currency]
  }

  internal var clientRefId: String {
    get {
      return graphQLMap["clientRefId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "clientRefId")
    }
  }

  internal var ownerProofs: [GraphQLID] {
    get {
      return graphQLMap["ownerProofs"] as! [GraphQLID]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ownerProofs")
    }
  }

  internal var keyRingId: GraphQLID {
    get {
      return graphQLMap["keyRingId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "keyRingId")
    }
  }

  internal var fundingSourceId: GraphQLID {
    get {
      return graphQLMap["fundingSourceId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fundingSourceId")
    }
  }

  internal var cardHolder: String {
    get {
      return graphQLMap["cardHolder"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cardHolder")
    }
  }

  internal var alias: String {
    get {
      return graphQLMap["alias"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "alias")
    }
  }

  internal var billingAddress: Optional<AddressInput?> {
    get {
      return graphQLMap["billingAddress"] as! Optional<AddressInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "billingAddress")
    }
  }

  internal var currency: String {
    get {
      return graphQLMap["currency"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "currency")
    }
  }
}

/// Input used to build the billing address associated with a virtual card.
internal struct AddressInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(addressLine1: String, addressLine2: Optional<String?> = nil, city: String, state: String, postalCode: String, country: String) {
    graphQLMap = ["addressLine1": addressLine1, "addressLine2": addressLine2, "city": city, "state": state, "postalCode": postalCode, "country": country]
  }

  internal var addressLine1: String {
    get {
      return graphQLMap["addressLine1"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "addressLine1")
    }
  }

  internal var addressLine2: Optional<String?> {
    get {
      return graphQLMap["addressLine2"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "addressLine2")
    }
  }

  internal var city: String {
    get {
      return graphQLMap["city"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "city")
    }
  }

  internal var state: String {
    get {
      return graphQLMap["state"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "state")
    }
  }

  internal var postalCode: String {
    get {
      return graphQLMap["postalCode"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "postalCode")
    }
  }

  internal var country: String {
    get {
      return graphQLMap["country"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "country")
    }
  }
}

/// Request used to update a virtual card at the card provider.
internal struct CardUpdateRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(id: GraphQLID, keyId: String, expectedVersion: Optional<Int?> = nil, cardHolder: String, billingAddress: Optional<AddressInput?> = nil, alias: String) {
    graphQLMap = ["id": id, "keyId": keyId, "expectedVersion": expectedVersion, "cardHolder": cardHolder, "billingAddress": billingAddress, "alias": alias]
  }

  /// ID of card to update
  internal var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  /// See SealedObject.keyId
  internal var keyId: String {
    get {
      return graphQLMap["keyId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "keyId")
    }
  }

  /// Version of card to update. If specified, version
  /// must match existing version of card.
  internal var expectedVersion: Optional<Int?> {
    get {
      return graphQLMap["expectedVersion"] as! Optional<Int?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "expectedVersion")
    }
  }

  /// Updated card holder
  internal var cardHolder: String {
    get {
      return graphQLMap["cardHolder"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cardHolder")
    }
  }

  /// Updated billing address
  internal var billingAddress: Optional<AddressInput?> {
    get {
      return graphQLMap["billingAddress"] as! Optional<AddressInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "billingAddress")
    }
  }

  /// Updated alias
  internal var alias: String {
    get {
      return graphQLMap["alias"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "alias")
    }
  }
}

/// Request used to cancel a virtual card at the card provider.
internal struct CardCancelRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(id: GraphQLID, keyId: String) {
    graphQLMap = ["id": id, "keyId": keyId]
  }

  /// ID of card to cancel.
  internal var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  /// See SealedObject.keyId
  internal var keyId: String {
    get {
      return graphQLMap["keyId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "keyId")
    }
  }
}

internal struct SetupFundingSourceRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(type: FundingSourceType, currency: String) {
    graphQLMap = ["type": type, "currency": currency]
  }

  /// Type of funding source to setup
  internal var type: FundingSourceType {
    get {
      return graphQLMap["type"] as! FundingSourceType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  /// Billing currency of the funding source as 3 character ISO
  /// currency code.
  internal var currency: String {
    get {
      return graphQLMap["currency"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "currency")
    }
  }
}

/// Type of funding source
internal enum FundingSourceType: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case creditCard
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "CREDIT_CARD": self = .creditCard
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .creditCard: return "CREDIT_CARD"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: FundingSourceType, rhs: FundingSourceType) -> Bool {
    switch (lhs, rhs) {
      case (.creditCard, .creditCard): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal struct CompleteFundingSourceRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(id: GraphQLID, completionData: GraphQLID) {
    graphQLMap = ["id": id, "completionData": completionData]
  }

  /// See CommonObject.id
  internal var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  /// Opaque completion data required to complete setup as returned
  /// by SDK
  internal var completionData: GraphQLID {
    get {
      return graphQLMap["completionData"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "completionData")
    }
  }
}

/// Input for operations that require only an ID.
internal struct IdInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(id: GraphQLID) {
    graphQLMap = ["id": id]
  }

  internal var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

internal struct CreatePublicKeyInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(keyId: String, keyRingId: String, algorithm: String, publicKey: String) {
    graphQLMap = ["keyId": keyId, "keyRingId": keyRingId, "algorithm": algorithm, "publicKey": publicKey]
  }

  /// See PublicKey.keyId
  internal var keyId: String {
    get {
      return graphQLMap["keyId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "keyId")
    }
  }

  /// See PublicKey.keyRingId
  internal var keyRingId: String {
    get {
      return graphQLMap["keyRingId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "keyRingId")
    }
  }

  /// See PublicKey.algorithm
  internal var algorithm: String {
    get {
      return graphQLMap["algorithm"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "algorithm")
    }
  }

  /// See PublicKey.publicKey
  internal var publicKey: String {
    get {
      return graphQLMap["publicKey"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "publicKey")
    }
  }
}

internal struct DeletePublicKeyInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(keyId: String) {
    graphQLMap = ["keyId": keyId]
  }

  /// See PublicKey.keyId
  internal var keyId: String {
    get {
      return graphQLMap["keyId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "keyId")
    }
  }
}

internal final class GetProvisionalCardQuery: GraphQLQuery {
  internal static let operationString =
    "query GetProvisionalCard($id: ID!) {\n  getProvisionalCard(id: $id) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    clientRefId\n    provisioningState\n    card {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      algorithm\n      keyId\n      keyRingId\n      owners {\n        __typename\n        id\n        issuer\n      }\n      fundingSourceId\n      currency\n      state\n      activeToEpochMs\n      cancelledAtEpochMs\n      last4\n      cardHolder\n      alias\n      pan\n      csc\n      billingAddress {\n        __typename\n        addressLine1\n        addressLine2\n        city\n        state\n        postalCode\n        country\n      }\n      expiry {\n        __typename\n        mm\n        yyyy\n      }\n    }\n    aws_ds\n  }\n}"

  internal var id: GraphQLID

  internal init(id: GraphQLID) {
    self.id = id
  }

  internal var variables: GraphQLMap? {
    return ["id": id]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("getProvisionalCard", arguments: ["id": GraphQLVariable("id")], type: .object(GetProvisionalCard.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(getProvisionalCard: GetProvisionalCard? = nil) {
      self.init(snapshot: ["__typename": "Query", "getProvisionalCard": getProvisionalCard.flatMap { $0.snapshot }])
    }

    internal var getProvisionalCard: GetProvisionalCard? {
      get {
        return (snapshot["getProvisionalCard"] as? Snapshot).flatMap { GetProvisionalCard(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getProvisionalCard")
      }
    }

    internal struct GetProvisionalCard: GraphQLSelectionSet {
      internal static let possibleTypes = ["ProvisionalCard"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("clientRefId", type: .nonNull(.scalar(String.self))),
        GraphQLField("provisioningState", type: .nonNull(.scalar(ProvisioningState.self))),
        GraphQLField("card", type: .list(.nonNull(.object(Card.selections)))),
        GraphQLField("aws_ds", type: .scalar(DeltaAction.self)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, clientRefId: String, provisioningState: ProvisioningState, card: [Card]? = nil, awsDs: DeltaAction? = nil) {
        self.init(snapshot: ["__typename": "ProvisionalCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "clientRefId": clientRefId, "provisioningState": provisioningState, "card": card.flatMap { $0.map { $0.snapshot } }, "aws_ds": awsDs])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// See CommonObject.id
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      /// ID used for the client to subscribe to specific events.
      internal var clientRefId: String {
        get {
          return snapshot["clientRefId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "clientRefId")
        }
      }

      /// State of the provisioning request which define complete, provisioning and failed processing of card provisioning.
      internal var provisioningState: ProvisioningState {
        get {
          return snapshot["provisioningState"]! as! ProvisioningState
        }
        set {
          snapshot.updateValue(newValue, forKey: "provisioningState")
        }
      }

      /// The fully provisioned virtual card if the provisioning is successful.
      internal var card: [Card]? {
        get {
          return (snapshot["card"] as? [Snapshot]).flatMap { $0.map { Card(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "card")
        }
      }

      /// AppSync clients can filter on this and remove records from their local cache if they were deleted while offline.
      internal var awsDs: DeltaAction? {
        get {
          return snapshot["aws_ds"] as? DeltaAction
        }
        set {
          snapshot.updateValue(newValue, forKey: "aws_ds")
        }
      }

      internal struct Card: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCard"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyRingId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owners", type: .nonNull(.list(.nonNull(.object(Owner.selections))))),
          GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .nonNull(.scalar(CardState.self))),
          GraphQLField("activeToEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("cancelledAtEpochMs", type: .scalar(Double.self)),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("cardHolder", type: .nonNull(.scalar(String.self))),
          GraphQLField("alias", type: .nonNull(.scalar(String.self))),
          GraphQLField("pan", type: .nonNull(.scalar(String.self))),
          GraphQLField("csc", type: .nonNull(.scalar(String.self))),
          GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
          GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry) {
          self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// NOT SEALED. See CommonObject.id
        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// NOT SEALED. See CommonObject.owner
        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        /// NOT SEALED. See CommonObject.version
        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        /// NOT SEALED. See CommonObject.createdAtEpochMs
        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        /// NOT SEALED. See CommonObject.updatedAtEpochMs
        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        /// NOT SEALED. See SealedObject.algorithm
        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        /// NOT SEALED. See SealedObject.keyId
        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        /// NOT SEALED.
        internal var keyRingId: GraphQLID {
          get {
            return snapshot["keyRingId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyRingId")
          }
        }

        /// NOT SEALED.
        internal var owners: [Owner] {
          get {
            return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
          }
        }

        /// NOT SEALED
        internal var fundingSourceId: GraphQLID {
          get {
            return snapshot["fundingSourceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fundingSourceId")
          }
        }

        /// NOT SEALED
        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        /// NOT SEALED
        internal var state: CardState {
          get {
            return snapshot["state"]! as! CardState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        /// NOT SEALED
        internal var activeToEpochMs: Double {
          get {
            return snapshot["activeToEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "activeToEpochMs")
          }
        }

        /// NOT SEALED
        internal var cancelledAtEpochMs: Double? {
          get {
            return snapshot["cancelledAtEpochMs"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
          }
        }

        /// NOT SEALED
        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        /// SEALED
        internal var cardHolder: String {
          get {
            return snapshot["cardHolder"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardHolder")
          }
        }

        /// SEALED
        internal var alias: String {
          get {
            return snapshot["alias"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "alias")
          }
        }

        /// SEALED
        internal var pan: String {
          get {
            return snapshot["pan"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pan")
          }
        }

        /// SEALED
        internal var csc: String {
          get {
            return snapshot["csc"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "csc")
          }
        }

        /// SEALED
        internal var billingAddress: BillingAddress? {
          get {
            return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
          }
        }

        /// SEALED
        internal var expiry: Expiry {
          get {
            return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "expiry")
          }
        }

        internal struct Owner: GraphQLSelectionSet {
          internal static let possibleTypes = ["Owner"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("issuer", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(id: String, issuer: String) {
            self.init(snapshot: ["__typename": "Owner", "id": id, "issuer": issuer])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var id: String {
            get {
              return snapshot["id"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          internal var issuer: String {
            get {
              return snapshot["issuer"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "issuer")
            }
          }
        }

        internal struct BillingAddress: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAddressAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("addressLine1", type: .nonNull(.scalar(String.self))),
            GraphQLField("addressLine2", type: .scalar(String.self)),
            GraphQLField("city", type: .nonNull(.scalar(String.self))),
            GraphQLField("state", type: .nonNull(.scalar(String.self))),
            GraphQLField("postalCode", type: .nonNull(.scalar(String.self))),
            GraphQLField("country", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(addressLine1: String, addressLine2: String? = nil, city: String, state: String, postalCode: String, country: String) {
            self.init(snapshot: ["__typename": "SealedAddressAttribute", "addressLine1": addressLine1, "addressLine2": addressLine2, "city": city, "state": state, "postalCode": postalCode, "country": country])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var addressLine1: String {
            get {
              return snapshot["addressLine1"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "addressLine1")
            }
          }

          internal var addressLine2: String? {
            get {
              return snapshot["addressLine2"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "addressLine2")
            }
          }

          internal var city: String {
            get {
              return snapshot["city"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "city")
            }
          }

          internal var state: String {
            get {
              return snapshot["state"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          internal var postalCode: String {
            get {
              return snapshot["postalCode"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "postalCode")
            }
          }

          internal var country: String {
            get {
              return snapshot["country"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "country")
            }
          }
        }

        internal struct Expiry: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedExpiryAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mm", type: .nonNull(.scalar(String.self))),
            GraphQLField("yyyy", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(mm: String, yyyy: String) {
            self.init(snapshot: ["__typename": "SealedExpiryAttribute", "mm": mm, "yyyy": yyyy])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var mm: String {
            get {
              return snapshot["mm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mm")
            }
          }

          internal var yyyy: String {
            get {
              return snapshot["yyyy"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "yyyy")
            }
          }
        }
      }
    }
  }
}

internal final class ListProvisionalCardsQuery: GraphQLQuery {
  internal static let operationString =
    "query ListProvisionalCards($filter: ProvisionalCardFilterInput, $limit: Int, $nextToken: String) {\n  listProvisionalCards(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      clientRefId\n      provisioningState\n      card {\n        __typename\n        id\n        owner\n        version\n        createdAtEpochMs\n        updatedAtEpochMs\n        algorithm\n        keyId\n        keyRingId\n        owners {\n          __typename\n          id\n          issuer\n        }\n        fundingSourceId\n        currency\n        state\n        activeToEpochMs\n        cancelledAtEpochMs\n        last4\n        cardHolder\n        alias\n        pan\n        csc\n        billingAddress {\n          __typename\n          addressLine1\n          addressLine2\n          city\n          state\n          postalCode\n          country\n        }\n        expiry {\n          __typename\n          mm\n          yyyy\n        }\n      }\n      aws_ds\n    }\n    nextToken\n  }\n}"

  internal var filter: ProvisionalCardFilterInput?
  internal var limit: Int?
  internal var nextToken: String?

  internal init(filter: ProvisionalCardFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  internal var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("listProvisionalCards", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListProvisionalCard.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(listProvisionalCards: ListProvisionalCard? = nil) {
      self.init(snapshot: ["__typename": "Query", "listProvisionalCards": listProvisionalCards.flatMap { $0.snapshot }])
    }

    internal var listProvisionalCards: ListProvisionalCard? {
      get {
        return (snapshot["listProvisionalCards"] as? Snapshot).flatMap { ListProvisionalCard(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listProvisionalCards")
      }
    }

    internal struct ListProvisionalCard: GraphQLSelectionSet {
      internal static let possibleTypes = ["ProvisionalCardConnection"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ProvisionalCardConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      internal var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      internal struct Item: GraphQLSelectionSet {
        internal static let possibleTypes = ["ProvisionalCard"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("clientRefId", type: .nonNull(.scalar(String.self))),
          GraphQLField("provisioningState", type: .nonNull(.scalar(ProvisioningState.self))),
          GraphQLField("card", type: .list(.nonNull(.object(Card.selections)))),
          GraphQLField("aws_ds", type: .scalar(DeltaAction.self)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, clientRefId: String, provisioningState: ProvisioningState, card: [Card]? = nil, awsDs: DeltaAction? = nil) {
          self.init(snapshot: ["__typename": "ProvisionalCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "clientRefId": clientRefId, "provisioningState": provisioningState, "card": card.flatMap { $0.map { $0.snapshot } }, "aws_ds": awsDs])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// See CommonObject.id
        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// See CommonObject.owner
        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        /// See CommonObject.version
        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        /// See CommonObject.createdAtEpochMs
        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        /// See CommonObject.updatedAtEpochMs
        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        /// ID used for the client to subscribe to specific events.
        internal var clientRefId: String {
          get {
            return snapshot["clientRefId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "clientRefId")
          }
        }

        /// State of the provisioning request which define complete, provisioning and failed processing of card provisioning.
        internal var provisioningState: ProvisioningState {
          get {
            return snapshot["provisioningState"]! as! ProvisioningState
          }
          set {
            snapshot.updateValue(newValue, forKey: "provisioningState")
          }
        }

        /// The fully provisioned virtual card if the provisioning is successful.
        internal var card: [Card]? {
          get {
            return (snapshot["card"] as? [Snapshot]).flatMap { $0.map { Card(snapshot: $0) } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "card")
          }
        }

        /// AppSync clients can filter on this and remove records from their local cache if they were deleted while offline.
        internal var awsDs: DeltaAction? {
          get {
            return snapshot["aws_ds"] as? DeltaAction
          }
          set {
            snapshot.updateValue(newValue, forKey: "aws_ds")
          }
        }

        internal struct Card: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCard"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("version", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyRingId", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("owners", type: .nonNull(.list(.nonNull(.object(Owner.selections))))),
            GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("state", type: .nonNull(.scalar(CardState.self))),
            GraphQLField("activeToEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("cancelledAtEpochMs", type: .scalar(Double.self)),
            GraphQLField("last4", type: .nonNull(.scalar(String.self))),
            GraphQLField("cardHolder", type: .nonNull(.scalar(String.self))),
            GraphQLField("alias", type: .nonNull(.scalar(String.self))),
            GraphQLField("pan", type: .nonNull(.scalar(String.self))),
            GraphQLField("csc", type: .nonNull(.scalar(String.self))),
            GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
            GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry) {
            self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// NOT SEALED. See CommonObject.id
          internal var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          /// NOT SEALED. See CommonObject.owner
          internal var owner: GraphQLID {
            get {
              return snapshot["owner"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "owner")
            }
          }

          /// NOT SEALED. See CommonObject.version
          internal var version: Int {
            get {
              return snapshot["version"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "version")
            }
          }

          /// NOT SEALED. See CommonObject.createdAtEpochMs
          internal var createdAtEpochMs: Double {
            get {
              return snapshot["createdAtEpochMs"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
            }
          }

          /// NOT SEALED. See CommonObject.updatedAtEpochMs
          internal var updatedAtEpochMs: Double {
            get {
              return snapshot["updatedAtEpochMs"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
            }
          }

          /// NOT SEALED. See SealedObject.algorithm
          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          /// NOT SEALED. See SealedObject.keyId
          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          /// NOT SEALED.
          internal var keyRingId: GraphQLID {
            get {
              return snapshot["keyRingId"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyRingId")
            }
          }

          /// NOT SEALED.
          internal var owners: [Owner] {
            get {
              return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
            }
          }

          /// NOT SEALED
          internal var fundingSourceId: GraphQLID {
            get {
              return snapshot["fundingSourceId"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "fundingSourceId")
            }
          }

          /// NOT SEALED
          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          /// NOT SEALED
          internal var state: CardState {
            get {
              return snapshot["state"]! as! CardState
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          /// NOT SEALED
          internal var activeToEpochMs: Double {
            get {
              return snapshot["activeToEpochMs"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "activeToEpochMs")
            }
          }

          /// NOT SEALED
          internal var cancelledAtEpochMs: Double? {
            get {
              return snapshot["cancelledAtEpochMs"] as? Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
            }
          }

          /// NOT SEALED
          internal var last4: String {
            get {
              return snapshot["last4"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "last4")
            }
          }

          /// SEALED
          internal var cardHolder: String {
            get {
              return snapshot["cardHolder"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "cardHolder")
            }
          }

          /// SEALED
          internal var alias: String {
            get {
              return snapshot["alias"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "alias")
            }
          }

          /// SEALED
          internal var pan: String {
            get {
              return snapshot["pan"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "pan")
            }
          }

          /// SEALED
          internal var csc: String {
            get {
              return snapshot["csc"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "csc")
            }
          }

          /// SEALED
          internal var billingAddress: BillingAddress? {
            get {
              return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
            }
          }

          /// SEALED
          internal var expiry: Expiry {
            get {
              return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "expiry")
            }
          }

          internal struct Owner: GraphQLSelectionSet {
            internal static let possibleTypes = ["Owner"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
              GraphQLField("issuer", type: .nonNull(.scalar(String.self))),
            ]

            internal var snapshot: Snapshot

            internal init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            internal init(id: String, issuer: String) {
              self.init(snapshot: ["__typename": "Owner", "id": id, "issuer": issuer])
            }

            internal var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            internal var id: String {
              get {
                return snapshot["id"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            internal var issuer: String {
              get {
                return snapshot["issuer"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "issuer")
              }
            }
          }

          internal struct BillingAddress: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedAddressAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("addressLine1", type: .nonNull(.scalar(String.self))),
              GraphQLField("addressLine2", type: .scalar(String.self)),
              GraphQLField("city", type: .nonNull(.scalar(String.self))),
              GraphQLField("state", type: .nonNull(.scalar(String.self))),
              GraphQLField("postalCode", type: .nonNull(.scalar(String.self))),
              GraphQLField("country", type: .nonNull(.scalar(String.self))),
            ]

            internal var snapshot: Snapshot

            internal init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            internal init(addressLine1: String, addressLine2: String? = nil, city: String, state: String, postalCode: String, country: String) {
              self.init(snapshot: ["__typename": "SealedAddressAttribute", "addressLine1": addressLine1, "addressLine2": addressLine2, "city": city, "state": state, "postalCode": postalCode, "country": country])
            }

            internal var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            internal var addressLine1: String {
              get {
                return snapshot["addressLine1"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "addressLine1")
              }
            }

            internal var addressLine2: String? {
              get {
                return snapshot["addressLine2"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "addressLine2")
              }
            }

            internal var city: String {
              get {
                return snapshot["city"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "city")
              }
            }

            internal var state: String {
              get {
                return snapshot["state"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "state")
              }
            }

            internal var postalCode: String {
              get {
                return snapshot["postalCode"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "postalCode")
              }
            }

            internal var country: String {
              get {
                return snapshot["country"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "country")
              }
            }
          }

          internal struct Expiry: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedExpiryAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("mm", type: .nonNull(.scalar(String.self))),
              GraphQLField("yyyy", type: .nonNull(.scalar(String.self))),
            ]

            internal var snapshot: Snapshot

            internal init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            internal init(mm: String, yyyy: String) {
              self.init(snapshot: ["__typename": "SealedExpiryAttribute", "mm": mm, "yyyy": yyyy])
            }

            internal var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            internal var mm: String {
              get {
                return snapshot["mm"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "mm")
              }
            }

            internal var yyyy: String {
              get {
                return snapshot["yyyy"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "yyyy")
              }
            }
          }
        }
      }
    }
  }
}

internal final class ListProvisionalCardsDeltaQuery: GraphQLQuery {
  internal static let operationString =
    "query ListProvisionalCardsDelta($lastSync: AWSTimestamp, $filter: ProvisionalCardFilterInput, $limit: Int) {\n  listProvisionalCardsDelta(lastSync: $lastSync, filter: $filter, limit: $limit) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    clientRefId\n    provisioningState\n    card {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      algorithm\n      keyId\n      keyRingId\n      owners {\n        __typename\n        id\n        issuer\n      }\n      fundingSourceId\n      currency\n      state\n      activeToEpochMs\n      cancelledAtEpochMs\n      last4\n      cardHolder\n      alias\n      pan\n      csc\n      billingAddress {\n        __typename\n        addressLine1\n        addressLine2\n        city\n        state\n        postalCode\n        country\n      }\n      expiry {\n        __typename\n        mm\n        yyyy\n      }\n    }\n    aws_ds\n  }\n}"

  internal var lastSync: Int?
  internal var filter: ProvisionalCardFilterInput?
  internal var limit: Int?

  internal init(lastSync: Int? = nil, filter: ProvisionalCardFilterInput? = nil, limit: Int? = nil) {
    self.lastSync = lastSync
    self.filter = filter
    self.limit = limit
  }

  internal var variables: GraphQLMap? {
    return ["lastSync": lastSync, "filter": filter, "limit": limit]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("listProvisionalCardsDelta", arguments: ["lastSync": GraphQLVariable("lastSync"), "filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit")], type: .nonNull(.list(.nonNull(.object(ListProvisionalCardsDeltum.selections))))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(listProvisionalCardsDelta: [ListProvisionalCardsDeltum]) {
      self.init(snapshot: ["__typename": "Query", "listProvisionalCardsDelta": listProvisionalCardsDelta.map { $0.snapshot }])
    }

    internal var listProvisionalCardsDelta: [ListProvisionalCardsDeltum] {
      get {
        return (snapshot["listProvisionalCardsDelta"] as! [Snapshot]).map { ListProvisionalCardsDeltum(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "listProvisionalCardsDelta")
      }
    }

    internal struct ListProvisionalCardsDeltum: GraphQLSelectionSet {
      internal static let possibleTypes = ["ProvisionalCard"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("clientRefId", type: .nonNull(.scalar(String.self))),
        GraphQLField("provisioningState", type: .nonNull(.scalar(ProvisioningState.self))),
        GraphQLField("card", type: .list(.nonNull(.object(Card.selections)))),
        GraphQLField("aws_ds", type: .scalar(DeltaAction.self)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, clientRefId: String, provisioningState: ProvisioningState, card: [Card]? = nil, awsDs: DeltaAction? = nil) {
        self.init(snapshot: ["__typename": "ProvisionalCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "clientRefId": clientRefId, "provisioningState": provisioningState, "card": card.flatMap { $0.map { $0.snapshot } }, "aws_ds": awsDs])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// See CommonObject.id
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      /// ID used for the client to subscribe to specific events.
      internal var clientRefId: String {
        get {
          return snapshot["clientRefId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "clientRefId")
        }
      }

      /// State of the provisioning request which define complete, provisioning and failed processing of card provisioning.
      internal var provisioningState: ProvisioningState {
        get {
          return snapshot["provisioningState"]! as! ProvisioningState
        }
        set {
          snapshot.updateValue(newValue, forKey: "provisioningState")
        }
      }

      /// The fully provisioned virtual card if the provisioning is successful.
      internal var card: [Card]? {
        get {
          return (snapshot["card"] as? [Snapshot]).flatMap { $0.map { Card(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "card")
        }
      }

      /// AppSync clients can filter on this and remove records from their local cache if they were deleted while offline.
      internal var awsDs: DeltaAction? {
        get {
          return snapshot["aws_ds"] as? DeltaAction
        }
        set {
          snapshot.updateValue(newValue, forKey: "aws_ds")
        }
      }

      internal struct Card: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCard"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyRingId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owners", type: .nonNull(.list(.nonNull(.object(Owner.selections))))),
          GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .nonNull(.scalar(CardState.self))),
          GraphQLField("activeToEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("cancelledAtEpochMs", type: .scalar(Double.self)),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("cardHolder", type: .nonNull(.scalar(String.self))),
          GraphQLField("alias", type: .nonNull(.scalar(String.self))),
          GraphQLField("pan", type: .nonNull(.scalar(String.self))),
          GraphQLField("csc", type: .nonNull(.scalar(String.self))),
          GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
          GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry) {
          self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// NOT SEALED. See CommonObject.id
        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// NOT SEALED. See CommonObject.owner
        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        /// NOT SEALED. See CommonObject.version
        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        /// NOT SEALED. See CommonObject.createdAtEpochMs
        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        /// NOT SEALED. See CommonObject.updatedAtEpochMs
        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        /// NOT SEALED. See SealedObject.algorithm
        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        /// NOT SEALED. See SealedObject.keyId
        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        /// NOT SEALED.
        internal var keyRingId: GraphQLID {
          get {
            return snapshot["keyRingId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyRingId")
          }
        }

        /// NOT SEALED.
        internal var owners: [Owner] {
          get {
            return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
          }
        }

        /// NOT SEALED
        internal var fundingSourceId: GraphQLID {
          get {
            return snapshot["fundingSourceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fundingSourceId")
          }
        }

        /// NOT SEALED
        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        /// NOT SEALED
        internal var state: CardState {
          get {
            return snapshot["state"]! as! CardState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        /// NOT SEALED
        internal var activeToEpochMs: Double {
          get {
            return snapshot["activeToEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "activeToEpochMs")
          }
        }

        /// NOT SEALED
        internal var cancelledAtEpochMs: Double? {
          get {
            return snapshot["cancelledAtEpochMs"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
          }
        }

        /// NOT SEALED
        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        /// SEALED
        internal var cardHolder: String {
          get {
            return snapshot["cardHolder"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardHolder")
          }
        }

        /// SEALED
        internal var alias: String {
          get {
            return snapshot["alias"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "alias")
          }
        }

        /// SEALED
        internal var pan: String {
          get {
            return snapshot["pan"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pan")
          }
        }

        /// SEALED
        internal var csc: String {
          get {
            return snapshot["csc"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "csc")
          }
        }

        /// SEALED
        internal var billingAddress: BillingAddress? {
          get {
            return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
          }
        }

        /// SEALED
        internal var expiry: Expiry {
          get {
            return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "expiry")
          }
        }

        internal struct Owner: GraphQLSelectionSet {
          internal static let possibleTypes = ["Owner"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("issuer", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(id: String, issuer: String) {
            self.init(snapshot: ["__typename": "Owner", "id": id, "issuer": issuer])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var id: String {
            get {
              return snapshot["id"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          internal var issuer: String {
            get {
              return snapshot["issuer"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "issuer")
            }
          }
        }

        internal struct BillingAddress: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAddressAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("addressLine1", type: .nonNull(.scalar(String.self))),
            GraphQLField("addressLine2", type: .scalar(String.self)),
            GraphQLField("city", type: .nonNull(.scalar(String.self))),
            GraphQLField("state", type: .nonNull(.scalar(String.self))),
            GraphQLField("postalCode", type: .nonNull(.scalar(String.self))),
            GraphQLField("country", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(addressLine1: String, addressLine2: String? = nil, city: String, state: String, postalCode: String, country: String) {
            self.init(snapshot: ["__typename": "SealedAddressAttribute", "addressLine1": addressLine1, "addressLine2": addressLine2, "city": city, "state": state, "postalCode": postalCode, "country": country])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var addressLine1: String {
            get {
              return snapshot["addressLine1"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "addressLine1")
            }
          }

          internal var addressLine2: String? {
            get {
              return snapshot["addressLine2"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "addressLine2")
            }
          }

          internal var city: String {
            get {
              return snapshot["city"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "city")
            }
          }

          internal var state: String {
            get {
              return snapshot["state"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          internal var postalCode: String {
            get {
              return snapshot["postalCode"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "postalCode")
            }
          }

          internal var country: String {
            get {
              return snapshot["country"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "country")
            }
          }
        }

        internal struct Expiry: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedExpiryAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mm", type: .nonNull(.scalar(String.self))),
            GraphQLField("yyyy", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(mm: String, yyyy: String) {
            self.init(snapshot: ["__typename": "SealedExpiryAttribute", "mm": mm, "yyyy": yyyy])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var mm: String {
            get {
              return snapshot["mm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mm")
            }
          }

          internal var yyyy: String {
            get {
              return snapshot["yyyy"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "yyyy")
            }
          }
        }
      }
    }
  }
}

internal final class GetCardQuery: GraphQLQuery {
  internal static let operationString =
    "query GetCard($id: ID!, $keyId: String!) {\n  getCard(id: $id, keyId: $keyId) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    algorithm\n    keyId\n    keyRingId\n    owners {\n      __typename\n      id\n      issuer\n    }\n    fundingSourceId\n    currency\n    state\n    activeToEpochMs\n    cancelledAtEpochMs\n    last4\n    cardHolder\n    alias\n    pan\n    csc\n    billingAddress {\n      __typename\n      addressLine1\n      addressLine2\n      city\n      state\n      postalCode\n      country\n    }\n    expiry {\n      __typename\n      mm\n      yyyy\n    }\n  }\n}"

  internal var id: GraphQLID
  internal var keyId: String

  internal init(id: GraphQLID, keyId: String) {
    self.id = id
    self.keyId = keyId
  }

  internal var variables: GraphQLMap? {
    return ["id": id, "keyId": keyId]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("getCard", arguments: ["id": GraphQLVariable("id"), "keyId": GraphQLVariable("keyId")], type: .object(GetCard.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(getCard: GetCard? = nil) {
      self.init(snapshot: ["__typename": "Query", "getCard": getCard.flatMap { $0.snapshot }])
    }

    internal var getCard: GetCard? {
      get {
        return (snapshot["getCard"] as? Snapshot).flatMap { GetCard(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getCard")
      }
    }

    internal struct GetCard: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedCard"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyRingId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owners", type: .nonNull(.list(.nonNull(.object(Owner.selections))))),
        GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("currency", type: .nonNull(.scalar(String.self))),
        GraphQLField("state", type: .nonNull(.scalar(CardState.self))),
        GraphQLField("activeToEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("cancelledAtEpochMs", type: .scalar(Double.self)),
        GraphQLField("last4", type: .nonNull(.scalar(String.self))),
        GraphQLField("cardHolder", type: .nonNull(.scalar(String.self))),
        GraphQLField("alias", type: .nonNull(.scalar(String.self))),
        GraphQLField("pan", type: .nonNull(.scalar(String.self))),
        GraphQLField("csc", type: .nonNull(.scalar(String.self))),
        GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
        GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry) {
        self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// NOT SEALED. See CommonObject.id
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// NOT SEALED. See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// NOT SEALED. See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// NOT SEALED. See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// NOT SEALED. See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      /// NOT SEALED. See SealedObject.algorithm
      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      /// NOT SEALED. See SealedObject.keyId
      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      /// NOT SEALED.
      internal var keyRingId: GraphQLID {
        get {
          return snapshot["keyRingId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyRingId")
        }
      }

      /// NOT SEALED.
      internal var owners: [Owner] {
        get {
          return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
        }
      }

      /// NOT SEALED
      internal var fundingSourceId: GraphQLID {
        get {
          return snapshot["fundingSourceId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "fundingSourceId")
        }
      }

      /// NOT SEALED
      internal var currency: String {
        get {
          return snapshot["currency"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      /// NOT SEALED
      internal var state: CardState {
        get {
          return snapshot["state"]! as! CardState
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      /// NOT SEALED
      internal var activeToEpochMs: Double {
        get {
          return snapshot["activeToEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "activeToEpochMs")
        }
      }

      /// NOT SEALED
      internal var cancelledAtEpochMs: Double? {
        get {
          return snapshot["cancelledAtEpochMs"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
        }
      }

      /// NOT SEALED
      internal var last4: String {
        get {
          return snapshot["last4"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last4")
        }
      }

      /// SEALED
      internal var cardHolder: String {
        get {
          return snapshot["cardHolder"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "cardHolder")
        }
      }

      /// SEALED
      internal var alias: String {
        get {
          return snapshot["alias"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "alias")
        }
      }

      /// SEALED
      internal var pan: String {
        get {
          return snapshot["pan"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "pan")
        }
      }

      /// SEALED
      internal var csc: String {
        get {
          return snapshot["csc"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "csc")
        }
      }

      /// SEALED
      internal var billingAddress: BillingAddress? {
        get {
          return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
        }
      }

      /// SEALED
      internal var expiry: Expiry {
        get {
          return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "expiry")
        }
      }

      internal struct Owner: GraphQLSelectionSet {
        internal static let possibleTypes = ["Owner"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("issuer", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: String, issuer: String) {
          self.init(snapshot: ["__typename": "Owner", "id": id, "issuer": issuer])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: String {
          get {
            return snapshot["id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var issuer: String {
          get {
            return snapshot["issuer"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "issuer")
          }
        }
      }

      internal struct BillingAddress: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedAddressAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("addressLine1", type: .nonNull(.scalar(String.self))),
          GraphQLField("addressLine2", type: .scalar(String.self)),
          GraphQLField("city", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .nonNull(.scalar(String.self))),
          GraphQLField("postalCode", type: .nonNull(.scalar(String.self))),
          GraphQLField("country", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(addressLine1: String, addressLine2: String? = nil, city: String, state: String, postalCode: String, country: String) {
          self.init(snapshot: ["__typename": "SealedAddressAttribute", "addressLine1": addressLine1, "addressLine2": addressLine2, "city": city, "state": state, "postalCode": postalCode, "country": country])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var addressLine1: String {
          get {
            return snapshot["addressLine1"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "addressLine1")
          }
        }

        internal var addressLine2: String? {
          get {
            return snapshot["addressLine2"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "addressLine2")
          }
        }

        internal var city: String {
          get {
            return snapshot["city"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "city")
          }
        }

        internal var state: String {
          get {
            return snapshot["state"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var postalCode: String {
          get {
            return snapshot["postalCode"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "postalCode")
          }
        }

        internal var country: String {
          get {
            return snapshot["country"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "country")
          }
        }
      }

      internal struct Expiry: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedExpiryAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mm", type: .nonNull(.scalar(String.self))),
          GraphQLField("yyyy", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(mm: String, yyyy: String) {
          self.init(snapshot: ["__typename": "SealedExpiryAttribute", "mm": mm, "yyyy": yyyy])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var mm: String {
          get {
            return snapshot["mm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "mm")
          }
        }

        internal var yyyy: String {
          get {
            return snapshot["yyyy"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "yyyy")
          }
        }
      }
    }
  }
}

internal final class ListCardsQuery: GraphQLQuery {
  internal static let operationString =
    "query ListCards($filter: CardFilterInput, $limit: Int, $nextToken: String) {\n  listCards(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      algorithm\n      keyId\n      keyRingId\n      owners {\n        __typename\n        id\n        issuer\n      }\n      fundingSourceId\n      currency\n      state\n      activeToEpochMs\n      cancelledAtEpochMs\n      last4\n      cardHolder\n      alias\n      pan\n      csc\n      billingAddress {\n        __typename\n        addressLine1\n        addressLine2\n        city\n        state\n        postalCode\n        country\n      }\n      expiry {\n        __typename\n        mm\n        yyyy\n      }\n    }\n    nextToken\n  }\n}"

  internal var filter: CardFilterInput?
  internal var limit: Int?
  internal var nextToken: String?

  internal init(filter: CardFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  internal var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("listCards", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListCard.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(listCards: ListCard? = nil) {
      self.init(snapshot: ["__typename": "Query", "listCards": listCards.flatMap { $0.snapshot }])
    }

    internal var listCards: ListCard? {
      get {
        return (snapshot["listCards"] as? Snapshot).flatMap { ListCard(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listCards")
      }
    }

    internal struct ListCard: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedCardConnection"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "SealedCardConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      internal var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      internal struct Item: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCard"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyRingId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owners", type: .nonNull(.list(.nonNull(.object(Owner.selections))))),
          GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .nonNull(.scalar(CardState.self))),
          GraphQLField("activeToEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("cancelledAtEpochMs", type: .scalar(Double.self)),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("cardHolder", type: .nonNull(.scalar(String.self))),
          GraphQLField("alias", type: .nonNull(.scalar(String.self))),
          GraphQLField("pan", type: .nonNull(.scalar(String.self))),
          GraphQLField("csc", type: .nonNull(.scalar(String.self))),
          GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
          GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry) {
          self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// NOT SEALED. See CommonObject.id
        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// NOT SEALED. See CommonObject.owner
        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        /// NOT SEALED. See CommonObject.version
        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        /// NOT SEALED. See CommonObject.createdAtEpochMs
        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        /// NOT SEALED. See CommonObject.updatedAtEpochMs
        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        /// NOT SEALED. See SealedObject.algorithm
        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        /// NOT SEALED. See SealedObject.keyId
        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        /// NOT SEALED.
        internal var keyRingId: GraphQLID {
          get {
            return snapshot["keyRingId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyRingId")
          }
        }

        /// NOT SEALED.
        internal var owners: [Owner] {
          get {
            return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
          }
        }

        /// NOT SEALED
        internal var fundingSourceId: GraphQLID {
          get {
            return snapshot["fundingSourceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fundingSourceId")
          }
        }

        /// NOT SEALED
        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        /// NOT SEALED
        internal var state: CardState {
          get {
            return snapshot["state"]! as! CardState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        /// NOT SEALED
        internal var activeToEpochMs: Double {
          get {
            return snapshot["activeToEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "activeToEpochMs")
          }
        }

        /// NOT SEALED
        internal var cancelledAtEpochMs: Double? {
          get {
            return snapshot["cancelledAtEpochMs"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
          }
        }

        /// NOT SEALED
        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        /// SEALED
        internal var cardHolder: String {
          get {
            return snapshot["cardHolder"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardHolder")
          }
        }

        /// SEALED
        internal var alias: String {
          get {
            return snapshot["alias"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "alias")
          }
        }

        /// SEALED
        internal var pan: String {
          get {
            return snapshot["pan"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pan")
          }
        }

        /// SEALED
        internal var csc: String {
          get {
            return snapshot["csc"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "csc")
          }
        }

        /// SEALED
        internal var billingAddress: BillingAddress? {
          get {
            return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
          }
        }

        /// SEALED
        internal var expiry: Expiry {
          get {
            return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "expiry")
          }
        }

        internal struct Owner: GraphQLSelectionSet {
          internal static let possibleTypes = ["Owner"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("issuer", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(id: String, issuer: String) {
            self.init(snapshot: ["__typename": "Owner", "id": id, "issuer": issuer])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var id: String {
            get {
              return snapshot["id"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          internal var issuer: String {
            get {
              return snapshot["issuer"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "issuer")
            }
          }
        }

        internal struct BillingAddress: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAddressAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("addressLine1", type: .nonNull(.scalar(String.self))),
            GraphQLField("addressLine2", type: .scalar(String.self)),
            GraphQLField("city", type: .nonNull(.scalar(String.self))),
            GraphQLField("state", type: .nonNull(.scalar(String.self))),
            GraphQLField("postalCode", type: .nonNull(.scalar(String.self))),
            GraphQLField("country", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(addressLine1: String, addressLine2: String? = nil, city: String, state: String, postalCode: String, country: String) {
            self.init(snapshot: ["__typename": "SealedAddressAttribute", "addressLine1": addressLine1, "addressLine2": addressLine2, "city": city, "state": state, "postalCode": postalCode, "country": country])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var addressLine1: String {
            get {
              return snapshot["addressLine1"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "addressLine1")
            }
          }

          internal var addressLine2: String? {
            get {
              return snapshot["addressLine2"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "addressLine2")
            }
          }

          internal var city: String {
            get {
              return snapshot["city"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "city")
            }
          }

          internal var state: String {
            get {
              return snapshot["state"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          internal var postalCode: String {
            get {
              return snapshot["postalCode"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "postalCode")
            }
          }

          internal var country: String {
            get {
              return snapshot["country"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "country")
            }
          }
        }

        internal struct Expiry: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedExpiryAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mm", type: .nonNull(.scalar(String.self))),
            GraphQLField("yyyy", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(mm: String, yyyy: String) {
            self.init(snapshot: ["__typename": "SealedExpiryAttribute", "mm": mm, "yyyy": yyyy])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var mm: String {
            get {
              return snapshot["mm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mm")
            }
          }

          internal var yyyy: String {
            get {
              return snapshot["yyyy"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "yyyy")
            }
          }
        }
      }
    }
  }
}

internal final class GetTransactionQuery: GraphQLQuery {
  internal static let operationString =
    "query GetTransaction($id: ID!, $keyId: String!) {\n  getTransaction(id: $id, keyId: $keyId) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    algorithm\n    keyId\n    cardId\n    sequenceId\n    type\n    transactedAtEpochMs\n    billedAmount {\n      __typename\n      currency\n      amount\n    }\n    transactedAmount {\n      __typename\n      currency\n      amount\n    }\n    description\n    declineReason\n    detail {\n      __typename\n      virtualCardAmount {\n        __typename\n        currency\n        amount\n      }\n      markup {\n        __typename\n        percent\n        flat\n        minCharge\n      }\n      markupAmount {\n        __typename\n        currency\n        amount\n      }\n      fundingSourceAmount {\n        __typename\n        currency\n        amount\n      }\n      fundingSourceId\n      description\n    }\n  }\n}"

  internal var id: GraphQLID
  internal var keyId: String

  internal init(id: GraphQLID, keyId: String) {
    self.id = id
    self.keyId = keyId
  }

  internal var variables: GraphQLMap? {
    return ["id": id, "keyId": keyId]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("getTransaction", arguments: ["id": GraphQLVariable("id"), "keyId": GraphQLVariable("keyId")], type: .object(GetTransaction.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(getTransaction: GetTransaction? = nil) {
      self.init(snapshot: ["__typename": "Query", "getTransaction": getTransaction.flatMap { $0.snapshot }])
    }

    internal var getTransaction: GetTransaction? {
      get {
        return (snapshot["getTransaction"] as? Snapshot).flatMap { GetTransaction(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getTransaction")
      }
    }

    internal struct GetTransaction: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedTransaction"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("cardId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("sequenceId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
        GraphQLField("transactedAtEpochMs", type: .nonNull(.scalar(String.self))),
        GraphQLField("billedAmount", type: .nonNull(.object(BilledAmount.selections))),
        GraphQLField("transactedAmount", type: .nonNull(.object(TransactedAmount.selections))),
        GraphQLField("description", type: .nonNull(.scalar(String.self))),
        GraphQLField("declineReason", type: .scalar(String.self)),
        GraphQLField("detail", type: .list(.nonNull(.object(Detail.selections)))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
        self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// NOT SEALED. See CommonObject.id
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// NOT SEALED. See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// NOT SEALED. See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// NOT SEALED. See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// NOT SEALED. See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      /// NOT SEALED. See SealedObject.algorithm
      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      /// NOT SEALED. See SealedObject.keyId
      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      /// NOT SEALED
      internal var cardId: GraphQLID {
        get {
          return snapshot["cardId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cardId")
        }
      }

      /// NOT SEALED
      internal var sequenceId: GraphQLID {
        get {
          return snapshot["sequenceId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "sequenceId")
        }
      }

      /// NOT SEALED
      internal var type: TransactionType {
        get {
          return snapshot["type"]! as! TransactionType
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      /// SEALED
      internal var transactedAtEpochMs: String {
        get {
          return snapshot["transactedAtEpochMs"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "transactedAtEpochMs")
        }
      }

      /// SEALED
      internal var billedAmount: BilledAmount {
        get {
          return BilledAmount(snapshot: snapshot["billedAmount"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "billedAmount")
        }
      }

      /// SEALED
      internal var transactedAmount: TransactedAmount {
        get {
          return TransactedAmount(snapshot: snapshot["transactedAmount"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "transactedAmount")
        }
      }

      /// SEALED
      internal var description: String {
        get {
          return snapshot["description"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      /// SEALED
      internal var declineReason: String? {
        get {
          return snapshot["declineReason"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "declineReason")
        }
      }

      /// List of details about this transaction depending on
      /// transaction type. Pending, complete and refund transactions
      /// will always have detail.
      internal var detail: [Detail]? {
        get {
          return (snapshot["detail"] as? [Snapshot]).flatMap { $0.map { Detail(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "detail")
        }
      }

      internal struct BilledAmount: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("amount", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(currency: String, amount: String) {
          self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Currency of currency amount
        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        /// Amount of currency amount in currency's minor unit
        internal var amount: String {
          get {
            return snapshot["amount"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "amount")
          }
        }
      }

      internal struct TransactedAmount: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("amount", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(currency: String, amount: String) {
          self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Currency of currency amount
        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        /// Amount of currency amount in currency's minor unit
        internal var amount: String {
          get {
            return snapshot["amount"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "amount")
          }
        }
      }

      internal struct Detail: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedTransactionDetailChargeAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("virtualCardAmount", type: .nonNull(.object(VirtualCardAmount.selections))),
          GraphQLField("markup", type: .nonNull(.object(Markup.selections))),
          GraphQLField("markupAmount", type: .nonNull(.object(MarkupAmount.selections))),
          GraphQLField("fundingSourceAmount", type: .nonNull(.object(FundingSourceAmount.selections))),
          GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(virtualCardAmount: VirtualCardAmount, markup: Markup, markupAmount: MarkupAmount, fundingSourceAmount: FundingSourceAmount, fundingSourceId: GraphQLID, description: String) {
          self.init(snapshot: ["__typename": "SealedTransactionDetailChargeAttribute", "virtualCardAmount": virtualCardAmount.snapshot, "markup": markup.snapshot, "markupAmount": markupAmount.snapshot, "fundingSourceAmount": fundingSourceAmount.snapshot, "fundingSourceId": fundingSourceId, "description": description])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Amount merchant charged virtual card.
        internal var virtualCardAmount: VirtualCardAmount {
          get {
            return VirtualCardAmount(snapshot: snapshot["virtualCardAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "virtualCardAmount")
          }
        }

        /// Markup formula applied to billedAmount to calculate
        internal var markup: Markup {
          get {
            return Markup(snapshot: snapshot["markup"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "markup")
          }
        }

        /// Markup amount added to transactedAmount.
        internal var markupAmount: MarkupAmount {
          get {
            return MarkupAmount(snapshot: snapshot["markupAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "markupAmount")
          }
        }

        /// Amount charged funding source.
        internal var fundingSourceAmount: FundingSourceAmount {
          get {
            return FundingSourceAmount(snapshot: snapshot["fundingSourceAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "fundingSourceAmount")
          }
        }

        /// NOT SEALED
        internal var fundingSourceId: GraphQLID {
          get {
            return snapshot["fundingSourceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fundingSourceId")
          }
        }

        /// Description that will show on the real funding source statement
        internal var description: String {
          get {
            return snapshot["description"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "description")
          }
        }

        internal struct VirtualCardAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(currency: String, amount: String) {
            self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Currency of currency amount
          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          /// Amount of currency amount in currency's minor unit
          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }
        }

        internal struct Markup: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedMarkupAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("percent", type: .nonNull(.scalar(String.self))),
            GraphQLField("flat", type: .nonNull(.scalar(String.self))),
            GraphQLField("minCharge", type: .scalar(String.self)),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(percent: String, flat: String, minCharge: String? = nil) {
            self.init(snapshot: ["__typename": "SealedMarkupAttribute", "percent": percent, "flat": flat, "minCharge": minCharge])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Floating point percentage amount applied in calculating
          /// total markup multiple by 1000. For example: 2990 for 2.99%.
          /// 1/1000th of a percent is the smallest granularity that can be
          /// represented.
          internal var percent: String {
            get {
              return snapshot["percent"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "percent")
            }
          }

          /// Flat amount applied in calculating total markup in minor
          /// currency unit of billed currency in containing transaction detail
          /// e.g. 31 for $0.31
          internal var flat: String {
            get {
              return snapshot["flat"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "flat")
            }
          }

          /// The minimum charge that will be made to the funding source. For example,
          /// if a small charge of $0.10 were made with a 2.99%+$0.31 fee formula
          /// then the resultant fee would be $0.31 cents resulting in an expected
          /// funding source charge of $0.41 cents. If minCharge is set and more than
          /// this amount then the minCharge will be charged instead.
          internal var minCharge: String? {
            get {
              return snapshot["minCharge"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "minCharge")
            }
          }
        }

        internal struct MarkupAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(currency: String, amount: String) {
            self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Currency of currency amount
          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          /// Amount of currency amount in currency's minor unit
          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }
        }

        internal struct FundingSourceAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(currency: String, amount: String) {
            self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Currency of currency amount
          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          /// Amount of currency amount in currency's minor unit
          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }
        }
      }
    }
  }
}

internal final class ListTransactionsQuery: GraphQLQuery {
  internal static let operationString =
    "query ListTransactions($filter: TransactionFilterInput, $limit: Int, $nextToken: String) {\n  listTransactions(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      algorithm\n      keyId\n      cardId\n      sequenceId\n      type\n      transactedAtEpochMs\n      billedAmount {\n        __typename\n        currency\n        amount\n      }\n      transactedAmount {\n        __typename\n        currency\n        amount\n      }\n      description\n      declineReason\n      detail {\n        __typename\n        virtualCardAmount {\n          __typename\n          currency\n          amount\n        }\n        markup {\n          __typename\n          percent\n          flat\n          minCharge\n        }\n        markupAmount {\n          __typename\n          currency\n          amount\n        }\n        fundingSourceAmount {\n          __typename\n          currency\n          amount\n        }\n        fundingSourceId\n        description\n      }\n    }\n    nextToken\n  }\n}"

  internal var filter: TransactionFilterInput?
  internal var limit: Int?
  internal var nextToken: String?

  internal init(filter: TransactionFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  internal var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("listTransactions", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListTransaction.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(listTransactions: ListTransaction? = nil) {
      self.init(snapshot: ["__typename": "Query", "listTransactions": listTransactions.flatMap { $0.snapshot }])
    }

    internal var listTransactions: ListTransaction? {
      get {
        return (snapshot["listTransactions"] as? Snapshot).flatMap { ListTransaction(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listTransactions")
      }
    }

    internal struct ListTransaction: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedTransactionConnection"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "SealedTransactionConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      internal var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      internal struct Item: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedTransaction"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("cardId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("sequenceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
          GraphQLField("transactedAtEpochMs", type: .nonNull(.scalar(String.self))),
          GraphQLField("billedAmount", type: .nonNull(.object(BilledAmount.selections))),
          GraphQLField("transactedAmount", type: .nonNull(.object(TransactedAmount.selections))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("declineReason", type: .scalar(String.self)),
          GraphQLField("detail", type: .list(.nonNull(.object(Detail.selections)))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
          self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// NOT SEALED. See CommonObject.id
        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// NOT SEALED. See CommonObject.owner
        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        /// NOT SEALED. See CommonObject.version
        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        /// NOT SEALED. See CommonObject.createdAtEpochMs
        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        /// NOT SEALED. See CommonObject.updatedAtEpochMs
        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        /// NOT SEALED. See SealedObject.algorithm
        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        /// NOT SEALED. See SealedObject.keyId
        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        /// NOT SEALED
        internal var cardId: GraphQLID {
          get {
            return snapshot["cardId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardId")
          }
        }

        /// NOT SEALED
        internal var sequenceId: GraphQLID {
          get {
            return snapshot["sequenceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "sequenceId")
          }
        }

        /// NOT SEALED
        internal var type: TransactionType {
          get {
            return snapshot["type"]! as! TransactionType
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        /// SEALED
        internal var transactedAtEpochMs: String {
          get {
            return snapshot["transactedAtEpochMs"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "transactedAtEpochMs")
          }
        }

        /// SEALED
        internal var billedAmount: BilledAmount {
          get {
            return BilledAmount(snapshot: snapshot["billedAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "billedAmount")
          }
        }

        /// SEALED
        internal var transactedAmount: TransactedAmount {
          get {
            return TransactedAmount(snapshot: snapshot["transactedAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "transactedAmount")
          }
        }

        /// SEALED
        internal var description: String {
          get {
            return snapshot["description"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "description")
          }
        }

        /// SEALED
        internal var declineReason: String? {
          get {
            return snapshot["declineReason"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "declineReason")
          }
        }

        /// List of details about this transaction depending on
        /// transaction type. Pending, complete and refund transactions
        /// will always have detail.
        internal var detail: [Detail]? {
          get {
            return (snapshot["detail"] as? [Snapshot]).flatMap { $0.map { Detail(snapshot: $0) } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "detail")
          }
        }

        internal struct BilledAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(currency: String, amount: String) {
            self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Currency of currency amount
          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          /// Amount of currency amount in currency's minor unit
          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }
        }

        internal struct TransactedAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(currency: String, amount: String) {
            self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Currency of currency amount
          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          /// Amount of currency amount in currency's minor unit
          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }
        }

        internal struct Detail: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedTransactionDetailChargeAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("virtualCardAmount", type: .nonNull(.object(VirtualCardAmount.selections))),
            GraphQLField("markup", type: .nonNull(.object(Markup.selections))),
            GraphQLField("markupAmount", type: .nonNull(.object(MarkupAmount.selections))),
            GraphQLField("fundingSourceAmount", type: .nonNull(.object(FundingSourceAmount.selections))),
            GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(virtualCardAmount: VirtualCardAmount, markup: Markup, markupAmount: MarkupAmount, fundingSourceAmount: FundingSourceAmount, fundingSourceId: GraphQLID, description: String) {
            self.init(snapshot: ["__typename": "SealedTransactionDetailChargeAttribute", "virtualCardAmount": virtualCardAmount.snapshot, "markup": markup.snapshot, "markupAmount": markupAmount.snapshot, "fundingSourceAmount": fundingSourceAmount.snapshot, "fundingSourceId": fundingSourceId, "description": description])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Amount merchant charged virtual card.
          internal var virtualCardAmount: VirtualCardAmount {
            get {
              return VirtualCardAmount(snapshot: snapshot["virtualCardAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "virtualCardAmount")
            }
          }

          /// Markup formula applied to billedAmount to calculate
          internal var markup: Markup {
            get {
              return Markup(snapshot: snapshot["markup"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "markup")
            }
          }

          /// Markup amount added to transactedAmount.
          internal var markupAmount: MarkupAmount {
            get {
              return MarkupAmount(snapshot: snapshot["markupAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "markupAmount")
            }
          }

          /// Amount charged funding source.
          internal var fundingSourceAmount: FundingSourceAmount {
            get {
              return FundingSourceAmount(snapshot: snapshot["fundingSourceAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "fundingSourceAmount")
            }
          }

          /// NOT SEALED
          internal var fundingSourceId: GraphQLID {
            get {
              return snapshot["fundingSourceId"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "fundingSourceId")
            }
          }

          /// Description that will show on the real funding source statement
          internal var description: String {
            get {
              return snapshot["description"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "description")
            }
          }

          internal struct VirtualCardAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("currency", type: .nonNull(.scalar(String.self))),
              GraphQLField("amount", type: .nonNull(.scalar(String.self))),
            ]

            internal var snapshot: Snapshot

            internal init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            internal init(currency: String, amount: String) {
              self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
            }

            internal var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Currency of currency amount
            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            /// Amount of currency amount in currency's minor unit
            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }
          }

          internal struct Markup: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedMarkupAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("percent", type: .nonNull(.scalar(String.self))),
              GraphQLField("flat", type: .nonNull(.scalar(String.self))),
              GraphQLField("minCharge", type: .scalar(String.self)),
            ]

            internal var snapshot: Snapshot

            internal init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            internal init(percent: String, flat: String, minCharge: String? = nil) {
              self.init(snapshot: ["__typename": "SealedMarkupAttribute", "percent": percent, "flat": flat, "minCharge": minCharge])
            }

            internal var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Floating point percentage amount applied in calculating
            /// total markup multiple by 1000. For example: 2990 for 2.99%.
            /// 1/1000th of a percent is the smallest granularity that can be
            /// represented.
            internal var percent: String {
              get {
                return snapshot["percent"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "percent")
              }
            }

            /// Flat amount applied in calculating total markup in minor
            /// currency unit of billed currency in containing transaction detail
            /// e.g. 31 for $0.31
            internal var flat: String {
              get {
                return snapshot["flat"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "flat")
              }
            }

            /// The minimum charge that will be made to the funding source. For example,
            /// if a small charge of $0.10 were made with a 2.99%+$0.31 fee formula
            /// then the resultant fee would be $0.31 cents resulting in an expected
            /// funding source charge of $0.41 cents. If minCharge is set and more than
            /// this amount then the minCharge will be charged instead.
            internal var minCharge: String? {
              get {
                return snapshot["minCharge"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "minCharge")
              }
            }
          }

          internal struct MarkupAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("currency", type: .nonNull(.scalar(String.self))),
              GraphQLField("amount", type: .nonNull(.scalar(String.self))),
            ]

            internal var snapshot: Snapshot

            internal init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            internal init(currency: String, amount: String) {
              self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
            }

            internal var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Currency of currency amount
            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            /// Amount of currency amount in currency's minor unit
            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }
          }

          internal struct FundingSourceAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("currency", type: .nonNull(.scalar(String.self))),
              GraphQLField("amount", type: .nonNull(.scalar(String.self))),
            ]

            internal var snapshot: Snapshot

            internal init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            internal init(currency: String, amount: String) {
              self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
            }

            internal var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Currency of currency amount
            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            /// Amount of currency amount in currency's minor unit
            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }
          }
        }
      }
    }
  }
}

internal final class GetFundingSourceClientConfigurationQuery: GraphQLQuery {
  internal static let operationString =
    "query GetFundingSourceClientConfiguration {\n  getFundingSourceClientConfiguration {\n    __typename\n    data\n  }\n}"

  internal init() {
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("getFundingSourceClientConfiguration", type: .nonNull(.object(GetFundingSourceClientConfiguration.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(getFundingSourceClientConfiguration: GetFundingSourceClientConfiguration) {
      self.init(snapshot: ["__typename": "Query", "getFundingSourceClientConfiguration": getFundingSourceClientConfiguration.snapshot])
    }

    internal var getFundingSourceClientConfiguration: GetFundingSourceClientConfiguration {
      get {
        return GetFundingSourceClientConfiguration(snapshot: snapshot["getFundingSourceClientConfiguration"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "getFundingSourceClientConfiguration")
      }
    }

    internal struct GetFundingSourceClientConfiguration: GraphQLSelectionSet {
      internal static let possibleTypes = ["FundingSourceClientConfiguration"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("data", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(data: GraphQLID) {
        self.init(snapshot: ["__typename": "FundingSourceClientConfiguration", "data": data])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Opaque client configuration data
      internal var data: GraphQLID {
        get {
          return snapshot["data"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "data")
        }
      }
    }
  }
}

internal final class GetFundingSourceQuery: GraphQLQuery {
  internal static let operationString =
    "query GetFundingSource($id: ID!) {\n  getFundingSource(id: $id) {\n    __typename\n    ... on CreditCardFundingSource {\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      state\n      currency\n      last4\n      network\n    }\n  }\n}"

  internal var id: GraphQLID

  internal init(id: GraphQLID) {
    self.id = id
  }

  internal var variables: GraphQLMap? {
    return ["id": id]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("getFundingSource", arguments: ["id": GraphQLVariable("id")], type: .object(GetFundingSource.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(getFundingSource: GetFundingSource? = nil) {
      self.init(snapshot: ["__typename": "Query", "getFundingSource": getFundingSource.flatMap { $0.snapshot }])
    }

    internal var getFundingSource: GetFundingSource? {
      get {
        return (snapshot["getFundingSource"] as? Snapshot).flatMap { GetFundingSource(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getFundingSource")
      }
    }

    internal struct GetFundingSource: GraphQLSelectionSet {
      internal static let possibleTypes = ["CreditCardFundingSource"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
        GraphQLField("currency", type: .nonNull(.scalar(String.self))),
        GraphQLField("last4", type: .nonNull(.scalar(String.self))),
        GraphQLField("network", type: .nonNull(.scalar(CreditCardNetwork.self))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, last4: String, network: CreditCardNetwork) {
        self.init(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "last4": last4, "network": network])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// See CommonObject.id
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      /// See CommonFundingSource.state
      internal var state: FundingSourceState {
        get {
          return snapshot["state"]! as! FundingSourceState
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      /// See CommonFundingSource.currency
      internal var currency: String {
        get {
          return snapshot["currency"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      /// Last 4 digits of user's credit card
      internal var last4: String {
        get {
          return snapshot["last4"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last4")
        }
      }

      /// Card network of card
      internal var network: CreditCardNetwork {
        get {
          return snapshot["network"]! as! CreditCardNetwork
        }
        set {
          snapshot.updateValue(newValue, forKey: "network")
        }
      }
    }
  }
}

internal final class ListFundingSourcesQuery: GraphQLQuery {
  internal static let operationString =
    "query ListFundingSources($filter: FundingSourceFilterInput, $limit: Int, $nextToken: String) {\n  listFundingSources(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      ... on CreditCardFundingSource {\n        id\n        owner\n        version\n        createdAtEpochMs\n        updatedAtEpochMs\n        state\n        currency\n        last4\n        network\n      }\n    }\n    nextToken\n  }\n}"

  internal var filter: FundingSourceFilterInput?
  internal var limit: Int?
  internal var nextToken: String?

  internal init(filter: FundingSourceFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  internal var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("listFundingSources", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListFundingSource.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(listFundingSources: ListFundingSource? = nil) {
      self.init(snapshot: ["__typename": "Query", "listFundingSources": listFundingSources.flatMap { $0.snapshot }])
    }

    internal var listFundingSources: ListFundingSource? {
      get {
        return (snapshot["listFundingSources"] as? Snapshot).flatMap { ListFundingSource(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listFundingSources")
      }
    }

    internal struct ListFundingSource: GraphQLSelectionSet {
      internal static let possibleTypes = ["FundingSourceConnection"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "FundingSourceConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      internal var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      internal struct Item: GraphQLSelectionSet {
        internal static let possibleTypes = ["CreditCardFundingSource"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("network", type: .nonNull(.scalar(CreditCardNetwork.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, last4: String, network: CreditCardNetwork) {
          self.init(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "last4": last4, "network": network])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// See CommonObject.id
        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// See CommonObject.owner
        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        /// See CommonObject.version
        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        /// See CommonObject.createdAtEpochMs
        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        /// See CommonObject.updatedAtEpochMs
        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        /// See CommonFundingSource.state
        internal var state: FundingSourceState {
          get {
            return snapshot["state"]! as! FundingSourceState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        /// See CommonFundingSource.currency
        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        /// Last 4 digits of user's credit card
        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        /// Card network of card
        internal var network: CreditCardNetwork {
          get {
            return snapshot["network"]! as! CreditCardNetwork
          }
          set {
            snapshot.updateValue(newValue, forKey: "network")
          }
        }
      }
    }
  }
}

internal final class GetPublicKeyForVirtualCardsQuery: GraphQLQuery {
  internal static let operationString =
    "query GetPublicKeyForVirtualCards($keyId: String!) {\n  getPublicKeyForVirtualCards(keyId: $keyId) {\n    __typename\n    id\n    keyId\n    keyRingId\n    algorithm\n    publicKey\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n  }\n}"

  internal var keyId: String

  internal init(keyId: String) {
    self.keyId = keyId
  }

  internal var variables: GraphQLMap? {
    return ["keyId": keyId]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("getPublicKeyForVirtualCards", arguments: ["keyId": GraphQLVariable("keyId")], type: .object(GetPublicKeyForVirtualCard.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(getPublicKeyForVirtualCards: GetPublicKeyForVirtualCard? = nil) {
      self.init(snapshot: ["__typename": "Query", "getPublicKeyForVirtualCards": getPublicKeyForVirtualCards.flatMap { $0.snapshot }])
    }

    internal var getPublicKeyForVirtualCards: GetPublicKeyForVirtualCard? {
      get {
        return (snapshot["getPublicKeyForVirtualCards"] as? Snapshot).flatMap { GetPublicKeyForVirtualCard(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getPublicKeyForVirtualCards")
      }
    }

    internal struct GetPublicKeyForVirtualCard: GraphQLSelectionSet {
      internal static let possibleTypes = ["PublicKey"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyRingId", type: .nonNull(.scalar(String.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("publicKey", type: .nonNull(.scalar(String.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, keyId: String, keyRingId: String, algorithm: String, publicKey: String, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double) {
        self.init(snapshot: ["__typename": "PublicKey", "id": id, "keyId": keyId, "keyRingId": keyRingId, "algorithm": algorithm, "publicKey": publicKey, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Server generated id for caching purposes. This is generated at the VTL.
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// See SealedObject.keyId
      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      /// Client generated key ring ID for the internal key ring used
      /// for sealing.
      internal var keyRingId: String {
        get {
          return snapshot["keyRingId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyRingId")
        }
      }

      /// See SealedObject.algorithm
      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      /// The RSA internal key
      internal var publicKey: String {
        get {
          return snapshot["publicKey"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "publicKey")
        }
      }

      /// See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }
    }
  }
}

internal final class GetPublicKeysForVirtualCardsQuery: GraphQLQuery {
  internal static let operationString =
    "query GetPublicKeysForVirtualCards($limit: Int, $nextToken: String) {\n  getPublicKeysForVirtualCards(limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      keyId\n      keyRingId\n      algorithm\n      publicKey\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n    }\n    nextToken\n  }\n}"

  internal var limit: Int?
  internal var nextToken: String?

  internal init(limit: Int? = nil, nextToken: String? = nil) {
    self.limit = limit
    self.nextToken = nextToken
  }

  internal var variables: GraphQLMap? {
    return ["limit": limit, "nextToken": nextToken]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("getPublicKeysForVirtualCards", arguments: ["limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .nonNull(.object(GetPublicKeysForVirtualCard.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(getPublicKeysForVirtualCards: GetPublicKeysForVirtualCard) {
      self.init(snapshot: ["__typename": "Query", "getPublicKeysForVirtualCards": getPublicKeysForVirtualCards.snapshot])
    }

    internal var getPublicKeysForVirtualCards: GetPublicKeysForVirtualCard {
      get {
        return GetPublicKeysForVirtualCard(snapshot: snapshot["getPublicKeysForVirtualCards"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "getPublicKeysForVirtualCards")
      }
    }

    internal struct GetPublicKeysForVirtualCard: GraphQLSelectionSet {
      internal static let possibleTypes = ["PaginatedPublicKey"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "PaginatedPublicKey", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      internal var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      internal struct Item: GraphQLSelectionSet {
        internal static let possibleTypes = ["PublicKey"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyRingId", type: .nonNull(.scalar(String.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("publicKey", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, keyId: String, keyRingId: String, algorithm: String, publicKey: String, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double) {
          self.init(snapshot: ["__typename": "PublicKey", "id": id, "keyId": keyId, "keyRingId": keyRingId, "algorithm": algorithm, "publicKey": publicKey, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Server generated id for caching purposes. This is generated at the VTL.
        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// See SealedObject.keyId
        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        /// Client generated key ring ID for the internal key ring used
        /// for sealing.
        internal var keyRingId: String {
          get {
            return snapshot["keyRingId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyRingId")
          }
        }

        /// See SealedObject.algorithm
        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        /// The RSA internal key
        internal var publicKey: String {
          get {
            return snapshot["publicKey"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "publicKey")
          }
        }

        /// See CommonObject.owner
        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        /// See CommonObject.version
        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        /// See CommonObject.createdAtEpochMs
        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        /// See CommonObject.updatedAtEpochMs
        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }
      }
    }
  }
}

internal final class GetKeyRingForVirtualCardsQuery: GraphQLQuery {
  internal static let operationString =
    "query GetKeyRingForVirtualCards($keyRingId: String!, $limit: Int, $nextToken: String) {\n  getKeyRingForVirtualCards(keyRingId: $keyRingId, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      keyId\n      keyRingId\n      algorithm\n      publicKey\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n    }\n    nextToken\n  }\n}"

  internal var keyRingId: String
  internal var limit: Int?
  internal var nextToken: String?

  internal init(keyRingId: String, limit: Int? = nil, nextToken: String? = nil) {
    self.keyRingId = keyRingId
    self.limit = limit
    self.nextToken = nextToken
  }

  internal var variables: GraphQLMap? {
    return ["keyRingId": keyRingId, "limit": limit, "nextToken": nextToken]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("getKeyRingForVirtualCards", arguments: ["keyRingId": GraphQLVariable("keyRingId"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .nonNull(.object(GetKeyRingForVirtualCard.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(getKeyRingForVirtualCards: GetKeyRingForVirtualCard) {
      self.init(snapshot: ["__typename": "Query", "getKeyRingForVirtualCards": getKeyRingForVirtualCards.snapshot])
    }

    internal var getKeyRingForVirtualCards: GetKeyRingForVirtualCard {
      get {
        return GetKeyRingForVirtualCard(snapshot: snapshot["getKeyRingForVirtualCards"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "getKeyRingForVirtualCards")
      }
    }

    internal struct GetKeyRingForVirtualCard: GraphQLSelectionSet {
      internal static let possibleTypes = ["PaginatedPublicKey"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "PaginatedPublicKey", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      internal var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      internal struct Item: GraphQLSelectionSet {
        internal static let possibleTypes = ["PublicKey"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyRingId", type: .nonNull(.scalar(String.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("publicKey", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, keyId: String, keyRingId: String, algorithm: String, publicKey: String, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double) {
          self.init(snapshot: ["__typename": "PublicKey", "id": id, "keyId": keyId, "keyRingId": keyRingId, "algorithm": algorithm, "publicKey": publicKey, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Server generated id for caching purposes. This is generated at the VTL.
        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// See SealedObject.keyId
        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        /// Client generated key ring ID for the internal key ring used
        /// for sealing.
        internal var keyRingId: String {
          get {
            return snapshot["keyRingId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyRingId")
          }
        }

        /// See SealedObject.algorithm
        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        /// The RSA internal key
        internal var publicKey: String {
          get {
            return snapshot["publicKey"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "publicKey")
          }
        }

        /// See CommonObject.owner
        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        /// See CommonObject.version
        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        /// See CommonObject.createdAtEpochMs
        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        /// See CommonObject.updatedAtEpochMs
        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }
      }
    }
  }
}

internal final class CardProvisionMutation: GraphQLMutation {
  internal static let operationString =
    "mutation CardProvision($input: CardProvisionRequest!) {\n  cardProvision(input: $input) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    clientRefId\n    provisioningState\n    card {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      algorithm\n      keyId\n      keyRingId\n      owners {\n        __typename\n        id\n        issuer\n      }\n      fundingSourceId\n      currency\n      state\n      activeToEpochMs\n      cancelledAtEpochMs\n      last4\n      cardHolder\n      alias\n      pan\n      csc\n      billingAddress {\n        __typename\n        addressLine1\n        addressLine2\n        city\n        state\n        postalCode\n        country\n      }\n      expiry {\n        __typename\n        mm\n        yyyy\n      }\n    }\n    aws_ds\n  }\n}"

  internal var input: CardProvisionRequest

  internal init(input: CardProvisionRequest) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("cardProvision", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(CardProvision.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(cardProvision: CardProvision) {
      self.init(snapshot: ["__typename": "Mutation", "cardProvision": cardProvision.snapshot])
    }

    /// Initiate card provision process. Caller can subscribe via
    /// onCardProvisionComplete to determine completion of card
    /// provisioning.
    internal var cardProvision: CardProvision {
      get {
        return CardProvision(snapshot: snapshot["cardProvision"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "cardProvision")
      }
    }

    internal struct CardProvision: GraphQLSelectionSet {
      internal static let possibleTypes = ["ProvisionalCard"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("clientRefId", type: .nonNull(.scalar(String.self))),
        GraphQLField("provisioningState", type: .nonNull(.scalar(ProvisioningState.self))),
        GraphQLField("card", type: .list(.nonNull(.object(Card.selections)))),
        GraphQLField("aws_ds", type: .scalar(DeltaAction.self)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, clientRefId: String, provisioningState: ProvisioningState, card: [Card]? = nil, awsDs: DeltaAction? = nil) {
        self.init(snapshot: ["__typename": "ProvisionalCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "clientRefId": clientRefId, "provisioningState": provisioningState, "card": card.flatMap { $0.map { $0.snapshot } }, "aws_ds": awsDs])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// See CommonObject.id
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      /// ID used for the client to subscribe to specific events.
      internal var clientRefId: String {
        get {
          return snapshot["clientRefId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "clientRefId")
        }
      }

      /// State of the provisioning request which define complete, provisioning and failed processing of card provisioning.
      internal var provisioningState: ProvisioningState {
        get {
          return snapshot["provisioningState"]! as! ProvisioningState
        }
        set {
          snapshot.updateValue(newValue, forKey: "provisioningState")
        }
      }

      /// The fully provisioned virtual card if the provisioning is successful.
      internal var card: [Card]? {
        get {
          return (snapshot["card"] as? [Snapshot]).flatMap { $0.map { Card(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "card")
        }
      }

      /// AppSync clients can filter on this and remove records from their local cache if they were deleted while offline.
      internal var awsDs: DeltaAction? {
        get {
          return snapshot["aws_ds"] as? DeltaAction
        }
        set {
          snapshot.updateValue(newValue, forKey: "aws_ds")
        }
      }

      internal struct Card: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCard"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyRingId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owners", type: .nonNull(.list(.nonNull(.object(Owner.selections))))),
          GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .nonNull(.scalar(CardState.self))),
          GraphQLField("activeToEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("cancelledAtEpochMs", type: .scalar(Double.self)),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("cardHolder", type: .nonNull(.scalar(String.self))),
          GraphQLField("alias", type: .nonNull(.scalar(String.self))),
          GraphQLField("pan", type: .nonNull(.scalar(String.self))),
          GraphQLField("csc", type: .nonNull(.scalar(String.self))),
          GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
          GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry) {
          self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// NOT SEALED. See CommonObject.id
        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// NOT SEALED. See CommonObject.owner
        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        /// NOT SEALED. See CommonObject.version
        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        /// NOT SEALED. See CommonObject.createdAtEpochMs
        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        /// NOT SEALED. See CommonObject.updatedAtEpochMs
        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        /// NOT SEALED. See SealedObject.algorithm
        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        /// NOT SEALED. See SealedObject.keyId
        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        /// NOT SEALED.
        internal var keyRingId: GraphQLID {
          get {
            return snapshot["keyRingId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyRingId")
          }
        }

        /// NOT SEALED.
        internal var owners: [Owner] {
          get {
            return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
          }
        }

        /// NOT SEALED
        internal var fundingSourceId: GraphQLID {
          get {
            return snapshot["fundingSourceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fundingSourceId")
          }
        }

        /// NOT SEALED
        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        /// NOT SEALED
        internal var state: CardState {
          get {
            return snapshot["state"]! as! CardState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        /// NOT SEALED
        internal var activeToEpochMs: Double {
          get {
            return snapshot["activeToEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "activeToEpochMs")
          }
        }

        /// NOT SEALED
        internal var cancelledAtEpochMs: Double? {
          get {
            return snapshot["cancelledAtEpochMs"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
          }
        }

        /// NOT SEALED
        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        /// SEALED
        internal var cardHolder: String {
          get {
            return snapshot["cardHolder"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardHolder")
          }
        }

        /// SEALED
        internal var alias: String {
          get {
            return snapshot["alias"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "alias")
          }
        }

        /// SEALED
        internal var pan: String {
          get {
            return snapshot["pan"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pan")
          }
        }

        /// SEALED
        internal var csc: String {
          get {
            return snapshot["csc"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "csc")
          }
        }

        /// SEALED
        internal var billingAddress: BillingAddress? {
          get {
            return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
          }
        }

        /// SEALED
        internal var expiry: Expiry {
          get {
            return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "expiry")
          }
        }

        internal struct Owner: GraphQLSelectionSet {
          internal static let possibleTypes = ["Owner"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("issuer", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(id: String, issuer: String) {
            self.init(snapshot: ["__typename": "Owner", "id": id, "issuer": issuer])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var id: String {
            get {
              return snapshot["id"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          internal var issuer: String {
            get {
              return snapshot["issuer"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "issuer")
            }
          }
        }

        internal struct BillingAddress: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAddressAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("addressLine1", type: .nonNull(.scalar(String.self))),
            GraphQLField("addressLine2", type: .scalar(String.self)),
            GraphQLField("city", type: .nonNull(.scalar(String.self))),
            GraphQLField("state", type: .nonNull(.scalar(String.self))),
            GraphQLField("postalCode", type: .nonNull(.scalar(String.self))),
            GraphQLField("country", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(addressLine1: String, addressLine2: String? = nil, city: String, state: String, postalCode: String, country: String) {
            self.init(snapshot: ["__typename": "SealedAddressAttribute", "addressLine1": addressLine1, "addressLine2": addressLine2, "city": city, "state": state, "postalCode": postalCode, "country": country])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var addressLine1: String {
            get {
              return snapshot["addressLine1"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "addressLine1")
            }
          }

          internal var addressLine2: String? {
            get {
              return snapshot["addressLine2"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "addressLine2")
            }
          }

          internal var city: String {
            get {
              return snapshot["city"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "city")
            }
          }

          internal var state: String {
            get {
              return snapshot["state"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          internal var postalCode: String {
            get {
              return snapshot["postalCode"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "postalCode")
            }
          }

          internal var country: String {
            get {
              return snapshot["country"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "country")
            }
          }
        }

        internal struct Expiry: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedExpiryAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mm", type: .nonNull(.scalar(String.self))),
            GraphQLField("yyyy", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(mm: String, yyyy: String) {
            self.init(snapshot: ["__typename": "SealedExpiryAttribute", "mm": mm, "yyyy": yyyy])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var mm: String {
            get {
              return snapshot["mm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mm")
            }
          }

          internal var yyyy: String {
            get {
              return snapshot["yyyy"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "yyyy")
            }
          }
        }
      }
    }
  }
}

internal final class UpdateCardMutation: GraphQLMutation {
  internal static let operationString =
    "mutation UpdateCard($input: CardUpdateRequest!) {\n  updateCard(input: $input) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    algorithm\n    keyId\n    keyRingId\n    owners {\n      __typename\n      id\n      issuer\n    }\n    fundingSourceId\n    currency\n    state\n    activeToEpochMs\n    cancelledAtEpochMs\n    last4\n    cardHolder\n    alias\n    pan\n    csc\n    billingAddress {\n      __typename\n      addressLine1\n      addressLine2\n      city\n      state\n      postalCode\n      country\n    }\n    expiry {\n      __typename\n      mm\n      yyyy\n    }\n  }\n}"

  internal var input: CardUpdateRequest

  internal init(input: CardUpdateRequest) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("updateCard", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(UpdateCard.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(updateCard: UpdateCard) {
      self.init(snapshot: ["__typename": "Mutation", "updateCard": updateCard.snapshot])
    }

    /// Update user modifiable attributes of the card
    internal var updateCard: UpdateCard {
      get {
        return UpdateCard(snapshot: snapshot["updateCard"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "updateCard")
      }
    }

    internal struct UpdateCard: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedCard"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyRingId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owners", type: .nonNull(.list(.nonNull(.object(Owner.selections))))),
        GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("currency", type: .nonNull(.scalar(String.self))),
        GraphQLField("state", type: .nonNull(.scalar(CardState.self))),
        GraphQLField("activeToEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("cancelledAtEpochMs", type: .scalar(Double.self)),
        GraphQLField("last4", type: .nonNull(.scalar(String.self))),
        GraphQLField("cardHolder", type: .nonNull(.scalar(String.self))),
        GraphQLField("alias", type: .nonNull(.scalar(String.self))),
        GraphQLField("pan", type: .nonNull(.scalar(String.self))),
        GraphQLField("csc", type: .nonNull(.scalar(String.self))),
        GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
        GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry) {
        self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// NOT SEALED. See CommonObject.id
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// NOT SEALED. See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// NOT SEALED. See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// NOT SEALED. See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// NOT SEALED. See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      /// NOT SEALED. See SealedObject.algorithm
      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      /// NOT SEALED. See SealedObject.keyId
      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      /// NOT SEALED.
      internal var keyRingId: GraphQLID {
        get {
          return snapshot["keyRingId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyRingId")
        }
      }

      /// NOT SEALED.
      internal var owners: [Owner] {
        get {
          return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
        }
      }

      /// NOT SEALED
      internal var fundingSourceId: GraphQLID {
        get {
          return snapshot["fundingSourceId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "fundingSourceId")
        }
      }

      /// NOT SEALED
      internal var currency: String {
        get {
          return snapshot["currency"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      /// NOT SEALED
      internal var state: CardState {
        get {
          return snapshot["state"]! as! CardState
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      /// NOT SEALED
      internal var activeToEpochMs: Double {
        get {
          return snapshot["activeToEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "activeToEpochMs")
        }
      }

      /// NOT SEALED
      internal var cancelledAtEpochMs: Double? {
        get {
          return snapshot["cancelledAtEpochMs"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
        }
      }

      /// NOT SEALED
      internal var last4: String {
        get {
          return snapshot["last4"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last4")
        }
      }

      /// SEALED
      internal var cardHolder: String {
        get {
          return snapshot["cardHolder"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "cardHolder")
        }
      }

      /// SEALED
      internal var alias: String {
        get {
          return snapshot["alias"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "alias")
        }
      }

      /// SEALED
      internal var pan: String {
        get {
          return snapshot["pan"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "pan")
        }
      }

      /// SEALED
      internal var csc: String {
        get {
          return snapshot["csc"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "csc")
        }
      }

      /// SEALED
      internal var billingAddress: BillingAddress? {
        get {
          return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
        }
      }

      /// SEALED
      internal var expiry: Expiry {
        get {
          return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "expiry")
        }
      }

      internal struct Owner: GraphQLSelectionSet {
        internal static let possibleTypes = ["Owner"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("issuer", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: String, issuer: String) {
          self.init(snapshot: ["__typename": "Owner", "id": id, "issuer": issuer])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: String {
          get {
            return snapshot["id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var issuer: String {
          get {
            return snapshot["issuer"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "issuer")
          }
        }
      }

      internal struct BillingAddress: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedAddressAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("addressLine1", type: .nonNull(.scalar(String.self))),
          GraphQLField("addressLine2", type: .scalar(String.self)),
          GraphQLField("city", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .nonNull(.scalar(String.self))),
          GraphQLField("postalCode", type: .nonNull(.scalar(String.self))),
          GraphQLField("country", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(addressLine1: String, addressLine2: String? = nil, city: String, state: String, postalCode: String, country: String) {
          self.init(snapshot: ["__typename": "SealedAddressAttribute", "addressLine1": addressLine1, "addressLine2": addressLine2, "city": city, "state": state, "postalCode": postalCode, "country": country])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var addressLine1: String {
          get {
            return snapshot["addressLine1"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "addressLine1")
          }
        }

        internal var addressLine2: String? {
          get {
            return snapshot["addressLine2"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "addressLine2")
          }
        }

        internal var city: String {
          get {
            return snapshot["city"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "city")
          }
        }

        internal var state: String {
          get {
            return snapshot["state"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var postalCode: String {
          get {
            return snapshot["postalCode"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "postalCode")
          }
        }

        internal var country: String {
          get {
            return snapshot["country"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "country")
          }
        }
      }

      internal struct Expiry: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedExpiryAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mm", type: .nonNull(.scalar(String.self))),
          GraphQLField("yyyy", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(mm: String, yyyy: String) {
          self.init(snapshot: ["__typename": "SealedExpiryAttribute", "mm": mm, "yyyy": yyyy])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var mm: String {
          get {
            return snapshot["mm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "mm")
          }
        }

        internal var yyyy: String {
          get {
            return snapshot["yyyy"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "yyyy")
          }
        }
      }
    }
  }
}

internal final class CancelCardMutation: GraphQLMutation {
  internal static let operationString =
    "mutation CancelCard($input: CardCancelRequest!) {\n  cancelCard(input: $input) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    algorithm\n    keyId\n    keyRingId\n    owners {\n      __typename\n      id\n      issuer\n    }\n    fundingSourceId\n    currency\n    state\n    activeToEpochMs\n    cancelledAtEpochMs\n    last4\n    cardHolder\n    alias\n    pan\n    csc\n    billingAddress {\n      __typename\n      addressLine1\n      addressLine2\n      city\n      state\n      postalCode\n      country\n    }\n    expiry {\n      __typename\n      mm\n      yyyy\n    }\n  }\n}"

  internal var input: CardCancelRequest

  internal init(input: CardCancelRequest) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("cancelCard", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(CancelCard.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(cancelCard: CancelCard) {
      self.init(snapshot: ["__typename": "Mutation", "cancelCard": cancelCard.snapshot])
    }

    /// Cancel a card
    internal var cancelCard: CancelCard {
      get {
        return CancelCard(snapshot: snapshot["cancelCard"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "cancelCard")
      }
    }

    internal struct CancelCard: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedCard"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyRingId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owners", type: .nonNull(.list(.nonNull(.object(Owner.selections))))),
        GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("currency", type: .nonNull(.scalar(String.self))),
        GraphQLField("state", type: .nonNull(.scalar(CardState.self))),
        GraphQLField("activeToEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("cancelledAtEpochMs", type: .scalar(Double.self)),
        GraphQLField("last4", type: .nonNull(.scalar(String.self))),
        GraphQLField("cardHolder", type: .nonNull(.scalar(String.self))),
        GraphQLField("alias", type: .nonNull(.scalar(String.self))),
        GraphQLField("pan", type: .nonNull(.scalar(String.self))),
        GraphQLField("csc", type: .nonNull(.scalar(String.self))),
        GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
        GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry) {
        self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// NOT SEALED. See CommonObject.id
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// NOT SEALED. See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// NOT SEALED. See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// NOT SEALED. See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// NOT SEALED. See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      /// NOT SEALED. See SealedObject.algorithm
      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      /// NOT SEALED. See SealedObject.keyId
      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      /// NOT SEALED.
      internal var keyRingId: GraphQLID {
        get {
          return snapshot["keyRingId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyRingId")
        }
      }

      /// NOT SEALED.
      internal var owners: [Owner] {
        get {
          return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
        }
      }

      /// NOT SEALED
      internal var fundingSourceId: GraphQLID {
        get {
          return snapshot["fundingSourceId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "fundingSourceId")
        }
      }

      /// NOT SEALED
      internal var currency: String {
        get {
          return snapshot["currency"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      /// NOT SEALED
      internal var state: CardState {
        get {
          return snapshot["state"]! as! CardState
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      /// NOT SEALED
      internal var activeToEpochMs: Double {
        get {
          return snapshot["activeToEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "activeToEpochMs")
        }
      }

      /// NOT SEALED
      internal var cancelledAtEpochMs: Double? {
        get {
          return snapshot["cancelledAtEpochMs"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
        }
      }

      /// NOT SEALED
      internal var last4: String {
        get {
          return snapshot["last4"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last4")
        }
      }

      /// SEALED
      internal var cardHolder: String {
        get {
          return snapshot["cardHolder"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "cardHolder")
        }
      }

      /// SEALED
      internal var alias: String {
        get {
          return snapshot["alias"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "alias")
        }
      }

      /// SEALED
      internal var pan: String {
        get {
          return snapshot["pan"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "pan")
        }
      }

      /// SEALED
      internal var csc: String {
        get {
          return snapshot["csc"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "csc")
        }
      }

      /// SEALED
      internal var billingAddress: BillingAddress? {
        get {
          return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
        }
      }

      /// SEALED
      internal var expiry: Expiry {
        get {
          return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "expiry")
        }
      }

      internal struct Owner: GraphQLSelectionSet {
        internal static let possibleTypes = ["Owner"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("issuer", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: String, issuer: String) {
          self.init(snapshot: ["__typename": "Owner", "id": id, "issuer": issuer])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: String {
          get {
            return snapshot["id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var issuer: String {
          get {
            return snapshot["issuer"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "issuer")
          }
        }
      }

      internal struct BillingAddress: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedAddressAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("addressLine1", type: .nonNull(.scalar(String.self))),
          GraphQLField("addressLine2", type: .scalar(String.self)),
          GraphQLField("city", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .nonNull(.scalar(String.self))),
          GraphQLField("postalCode", type: .nonNull(.scalar(String.self))),
          GraphQLField("country", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(addressLine1: String, addressLine2: String? = nil, city: String, state: String, postalCode: String, country: String) {
          self.init(snapshot: ["__typename": "SealedAddressAttribute", "addressLine1": addressLine1, "addressLine2": addressLine2, "city": city, "state": state, "postalCode": postalCode, "country": country])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var addressLine1: String {
          get {
            return snapshot["addressLine1"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "addressLine1")
          }
        }

        internal var addressLine2: String? {
          get {
            return snapshot["addressLine2"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "addressLine2")
          }
        }

        internal var city: String {
          get {
            return snapshot["city"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "city")
          }
        }

        internal var state: String {
          get {
            return snapshot["state"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var postalCode: String {
          get {
            return snapshot["postalCode"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "postalCode")
          }
        }

        internal var country: String {
          get {
            return snapshot["country"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "country")
          }
        }
      }

      internal struct Expiry: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedExpiryAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mm", type: .nonNull(.scalar(String.self))),
          GraphQLField("yyyy", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(mm: String, yyyy: String) {
          self.init(snapshot: ["__typename": "SealedExpiryAttribute", "mm": mm, "yyyy": yyyy])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var mm: String {
          get {
            return snapshot["mm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "mm")
          }
        }

        internal var yyyy: String {
          get {
            return snapshot["yyyy"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "yyyy")
          }
        }
      }
    }
  }
}

internal final class SetupFundingSourceMutation: GraphQLMutation {
  internal static let operationString =
    "mutation SetupFundingSource($input: SetupFundingSourceRequest!) {\n  setupFundingSource(input: $input) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    provisioningData\n  }\n}"

  internal var input: SetupFundingSourceRequest

  internal init(input: SetupFundingSourceRequest) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("setupFundingSource", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(SetupFundingSource.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(setupFundingSource: SetupFundingSource) {
      self.init(snapshot: ["__typename": "Mutation", "setupFundingSource": setupFundingSource.snapshot])
    }

    /// Begin setting up a funding source
    internal var setupFundingSource: SetupFundingSource {
      get {
        return SetupFundingSource(snapshot: snapshot["setupFundingSource"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "setupFundingSource")
      }
    }

    internal struct SetupFundingSource: GraphQLSelectionSet {
      internal static let possibleTypes = ["ProvisionalFundingSource"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("provisioningData", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, provisioningData: GraphQLID) {
        self.init(snapshot: ["__typename": "ProvisionalFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "provisioningData": provisioningData])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// See CommonObject.id
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      /// Opaque data for consumption by finding source SDK during funding source
      /// setup.
      internal var provisioningData: GraphQLID {
        get {
          return snapshot["provisioningData"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "provisioningData")
        }
      }
    }
  }
}

internal final class CompleteFundingSourceMutation: GraphQLMutation {
  internal static let operationString =
    "mutation CompleteFundingSource($input: CompleteFundingSourceRequest!) {\n  completeFundingSource(input: $input) {\n    __typename\n    ... on CreditCardFundingSource {\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      state\n      currency\n      last4\n      network\n    }\n  }\n}"

  internal var input: CompleteFundingSourceRequest

  internal init(input: CompleteFundingSourceRequest) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("completeFundingSource", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(CompleteFundingSource.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(completeFundingSource: CompleteFundingSource) {
      self.init(snapshot: ["__typename": "Mutation", "completeFundingSource": completeFundingSource.snapshot])
    }

    /// Complete the process of setting up a funding source
    internal var completeFundingSource: CompleteFundingSource {
      get {
        return CompleteFundingSource(snapshot: snapshot["completeFundingSource"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "completeFundingSource")
      }
    }

    internal struct CompleteFundingSource: GraphQLSelectionSet {
      internal static let possibleTypes = ["CreditCardFundingSource"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
        GraphQLField("currency", type: .nonNull(.scalar(String.self))),
        GraphQLField("last4", type: .nonNull(.scalar(String.self))),
        GraphQLField("network", type: .nonNull(.scalar(CreditCardNetwork.self))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, last4: String, network: CreditCardNetwork) {
        self.init(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "last4": last4, "network": network])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// See CommonObject.id
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      /// See CommonFundingSource.state
      internal var state: FundingSourceState {
        get {
          return snapshot["state"]! as! FundingSourceState
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      /// See CommonFundingSource.currency
      internal var currency: String {
        get {
          return snapshot["currency"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      /// Last 4 digits of user's credit card
      internal var last4: String {
        get {
          return snapshot["last4"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last4")
        }
      }

      /// Card network of card
      internal var network: CreditCardNetwork {
        get {
          return snapshot["network"]! as! CreditCardNetwork
        }
        set {
          snapshot.updateValue(newValue, forKey: "network")
        }
      }
    }
  }
}

internal final class CancelFundingSourceMutation: GraphQLMutation {
  internal static let operationString =
    "mutation CancelFundingSource($input: IdInput!) {\n  cancelFundingSource(input: $input) {\n    __typename\n    ... on CreditCardFundingSource {\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      state\n      currency\n      last4\n      network\n    }\n  }\n}"

  internal var input: IdInput

  internal init(input: IdInput) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("cancelFundingSource", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(CancelFundingSource.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(cancelFundingSource: CancelFundingSource) {
      self.init(snapshot: ["__typename": "Mutation", "cancelFundingSource": cancelFundingSource.snapshot])
    }

    /// Cancel a funding source
    internal var cancelFundingSource: CancelFundingSource {
      get {
        return CancelFundingSource(snapshot: snapshot["cancelFundingSource"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "cancelFundingSource")
      }
    }

    internal struct CancelFundingSource: GraphQLSelectionSet {
      internal static let possibleTypes = ["CreditCardFundingSource"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
        GraphQLField("currency", type: .nonNull(.scalar(String.self))),
        GraphQLField("last4", type: .nonNull(.scalar(String.self))),
        GraphQLField("network", type: .nonNull(.scalar(CreditCardNetwork.self))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, last4: String, network: CreditCardNetwork) {
        self.init(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "last4": last4, "network": network])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// See CommonObject.id
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      /// See CommonFundingSource.state
      internal var state: FundingSourceState {
        get {
          return snapshot["state"]! as! FundingSourceState
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      /// See CommonFundingSource.currency
      internal var currency: String {
        get {
          return snapshot["currency"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      /// Last 4 digits of user's credit card
      internal var last4: String {
        get {
          return snapshot["last4"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last4")
        }
      }

      /// Card network of card
      internal var network: CreditCardNetwork {
        get {
          return snapshot["network"]! as! CreditCardNetwork
        }
        set {
          snapshot.updateValue(newValue, forKey: "network")
        }
      }
    }
  }
}

internal final class CreatePublicKeyForVirtualCardsMutation: GraphQLMutation {
  internal static let operationString =
    "mutation CreatePublicKeyForVirtualCards($input: CreatePublicKeyInput!) {\n  createPublicKeyForVirtualCards(input: $input) {\n    __typename\n    id\n    keyId\n    keyRingId\n    algorithm\n    publicKey\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n  }\n}"

  internal var input: CreatePublicKeyInput

  internal init(input: CreatePublicKeyInput) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("createPublicKeyForVirtualCards", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(CreatePublicKeyForVirtualCard.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(createPublicKeyForVirtualCards: CreatePublicKeyForVirtualCard) {
      self.init(snapshot: ["__typename": "Mutation", "createPublicKeyForVirtualCards": createPublicKeyForVirtualCards.snapshot])
    }

    /// Create a internal key
    internal var createPublicKeyForVirtualCards: CreatePublicKeyForVirtualCard {
      get {
        return CreatePublicKeyForVirtualCard(snapshot: snapshot["createPublicKeyForVirtualCards"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "createPublicKeyForVirtualCards")
      }
    }

    internal struct CreatePublicKeyForVirtualCard: GraphQLSelectionSet {
      internal static let possibleTypes = ["PublicKey"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyRingId", type: .nonNull(.scalar(String.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("publicKey", type: .nonNull(.scalar(String.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, keyId: String, keyRingId: String, algorithm: String, publicKey: String, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double) {
        self.init(snapshot: ["__typename": "PublicKey", "id": id, "keyId": keyId, "keyRingId": keyRingId, "algorithm": algorithm, "publicKey": publicKey, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Server generated id for caching purposes. This is generated at the VTL.
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// See SealedObject.keyId
      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      /// Client generated key ring ID for the internal key ring used
      /// for sealing.
      internal var keyRingId: String {
        get {
          return snapshot["keyRingId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyRingId")
        }
      }

      /// See SealedObject.algorithm
      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      /// The RSA internal key
      internal var publicKey: String {
        get {
          return snapshot["publicKey"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "publicKey")
        }
      }

      /// See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }
    }
  }
}

internal final class DeletePublicKeyForVirtualCardsMutation: GraphQLMutation {
  internal static let operationString =
    "mutation DeletePublicKeyForVirtualCards($input: DeletePublicKeyInput) {\n  deletePublicKeyForVirtualCards(input: $input) {\n    __typename\n    id\n    keyId\n    keyRingId\n    algorithm\n    publicKey\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n  }\n}"

  internal var input: DeletePublicKeyInput?

  internal init(input: DeletePublicKeyInput? = nil) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("deletePublicKeyForVirtualCards", arguments: ["input": GraphQLVariable("input")], type: .object(DeletePublicKeyForVirtualCard.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(deletePublicKeyForVirtualCards: DeletePublicKeyForVirtualCard? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deletePublicKeyForVirtualCards": deletePublicKeyForVirtualCards.flatMap { $0.snapshot }])
    }

    /// Delete a internal key
    internal var deletePublicKeyForVirtualCards: DeletePublicKeyForVirtualCard? {
      get {
        return (snapshot["deletePublicKeyForVirtualCards"] as? Snapshot).flatMap { DeletePublicKeyForVirtualCard(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deletePublicKeyForVirtualCards")
      }
    }

    internal struct DeletePublicKeyForVirtualCard: GraphQLSelectionSet {
      internal static let possibleTypes = ["PublicKey"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyRingId", type: .nonNull(.scalar(String.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("publicKey", type: .nonNull(.scalar(String.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, keyId: String, keyRingId: String, algorithm: String, publicKey: String, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double) {
        self.init(snapshot: ["__typename": "PublicKey", "id": id, "keyId": keyId, "keyRingId": keyRingId, "algorithm": algorithm, "publicKey": publicKey, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Server generated id for caching purposes. This is generated at the VTL.
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// See SealedObject.keyId
      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      /// Client generated key ring ID for the internal key ring used
      /// for sealing.
      internal var keyRingId: String {
        get {
          return snapshot["keyRingId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyRingId")
        }
      }

      /// See SealedObject.algorithm
      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      /// The RSA internal key
      internal var publicKey: String {
        get {
          return snapshot["publicKey"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "publicKey")
        }
      }

      /// See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }
    }
  }
}

internal final class OnDeltaProvisionalCardSubscription: GraphQLSubscription {
  internal static let operationString =
    "subscription OnDeltaProvisionalCard($owner: ID!) {\n  onDeltaProvisionalCard(owner: $owner) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    clientRefId\n    provisioningState\n    card {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      algorithm\n      keyId\n      keyRingId\n      owners {\n        __typename\n        id\n        issuer\n      }\n      fundingSourceId\n      currency\n      state\n      activeToEpochMs\n      cancelledAtEpochMs\n      last4\n      cardHolder\n      alias\n      pan\n      csc\n      billingAddress {\n        __typename\n        addressLine1\n        addressLine2\n        city\n        state\n        postalCode\n        country\n      }\n      expiry {\n        __typename\n        mm\n        yyyy\n      }\n    }\n    aws_ds\n  }\n}"

  internal var owner: GraphQLID

  internal init(owner: GraphQLID) {
    self.owner = owner
  }

  internal var variables: GraphQLMap? {
    return ["owner": owner]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Subscription"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("onDeltaProvisionalCard", arguments: ["owner": GraphQLVariable("owner")], type: .object(OnDeltaProvisionalCard.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(onDeltaProvisionalCard: OnDeltaProvisionalCard? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeltaProvisionalCard": onDeltaProvisionalCard.flatMap { $0.snapshot }])
    }

    internal var onDeltaProvisionalCard: OnDeltaProvisionalCard? {
      get {
        return (snapshot["onDeltaProvisionalCard"] as? Snapshot).flatMap { OnDeltaProvisionalCard(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeltaProvisionalCard")
      }
    }

    internal struct OnDeltaProvisionalCard: GraphQLSelectionSet {
      internal static let possibleTypes = ["ProvisionalCard"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("clientRefId", type: .nonNull(.scalar(String.self))),
        GraphQLField("provisioningState", type: .nonNull(.scalar(ProvisioningState.self))),
        GraphQLField("card", type: .list(.nonNull(.object(Card.selections)))),
        GraphQLField("aws_ds", type: .scalar(DeltaAction.self)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, clientRefId: String, provisioningState: ProvisioningState, card: [Card]? = nil, awsDs: DeltaAction? = nil) {
        self.init(snapshot: ["__typename": "ProvisionalCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "clientRefId": clientRefId, "provisioningState": provisioningState, "card": card.flatMap { $0.map { $0.snapshot } }, "aws_ds": awsDs])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// See CommonObject.id
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      /// ID used for the client to subscribe to specific events.
      internal var clientRefId: String {
        get {
          return snapshot["clientRefId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "clientRefId")
        }
      }

      /// State of the provisioning request which define complete, provisioning and failed processing of card provisioning.
      internal var provisioningState: ProvisioningState {
        get {
          return snapshot["provisioningState"]! as! ProvisioningState
        }
        set {
          snapshot.updateValue(newValue, forKey: "provisioningState")
        }
      }

      /// The fully provisioned virtual card if the provisioning is successful.
      internal var card: [Card]? {
        get {
          return (snapshot["card"] as? [Snapshot]).flatMap { $0.map { Card(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "card")
        }
      }

      /// AppSync clients can filter on this and remove records from their local cache if they were deleted while offline.
      internal var awsDs: DeltaAction? {
        get {
          return snapshot["aws_ds"] as? DeltaAction
        }
        set {
          snapshot.updateValue(newValue, forKey: "aws_ds")
        }
      }

      internal struct Card: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCard"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyRingId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owners", type: .nonNull(.list(.nonNull(.object(Owner.selections))))),
          GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .nonNull(.scalar(CardState.self))),
          GraphQLField("activeToEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("cancelledAtEpochMs", type: .scalar(Double.self)),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("cardHolder", type: .nonNull(.scalar(String.self))),
          GraphQLField("alias", type: .nonNull(.scalar(String.self))),
          GraphQLField("pan", type: .nonNull(.scalar(String.self))),
          GraphQLField("csc", type: .nonNull(.scalar(String.self))),
          GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
          GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry) {
          self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// NOT SEALED. See CommonObject.id
        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// NOT SEALED. See CommonObject.owner
        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        /// NOT SEALED. See CommonObject.version
        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        /// NOT SEALED. See CommonObject.createdAtEpochMs
        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        /// NOT SEALED. See CommonObject.updatedAtEpochMs
        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        /// NOT SEALED. See SealedObject.algorithm
        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        /// NOT SEALED. See SealedObject.keyId
        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        /// NOT SEALED.
        internal var keyRingId: GraphQLID {
          get {
            return snapshot["keyRingId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyRingId")
          }
        }

        /// NOT SEALED.
        internal var owners: [Owner] {
          get {
            return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
          }
        }

        /// NOT SEALED
        internal var fundingSourceId: GraphQLID {
          get {
            return snapshot["fundingSourceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fundingSourceId")
          }
        }

        /// NOT SEALED
        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        /// NOT SEALED
        internal var state: CardState {
          get {
            return snapshot["state"]! as! CardState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        /// NOT SEALED
        internal var activeToEpochMs: Double {
          get {
            return snapshot["activeToEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "activeToEpochMs")
          }
        }

        /// NOT SEALED
        internal var cancelledAtEpochMs: Double? {
          get {
            return snapshot["cancelledAtEpochMs"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
          }
        }

        /// NOT SEALED
        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        /// SEALED
        internal var cardHolder: String {
          get {
            return snapshot["cardHolder"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardHolder")
          }
        }

        /// SEALED
        internal var alias: String {
          get {
            return snapshot["alias"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "alias")
          }
        }

        /// SEALED
        internal var pan: String {
          get {
            return snapshot["pan"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pan")
          }
        }

        /// SEALED
        internal var csc: String {
          get {
            return snapshot["csc"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "csc")
          }
        }

        /// SEALED
        internal var billingAddress: BillingAddress? {
          get {
            return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
          }
        }

        /// SEALED
        internal var expiry: Expiry {
          get {
            return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "expiry")
          }
        }

        internal struct Owner: GraphQLSelectionSet {
          internal static let possibleTypes = ["Owner"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("issuer", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(id: String, issuer: String) {
            self.init(snapshot: ["__typename": "Owner", "id": id, "issuer": issuer])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var id: String {
            get {
              return snapshot["id"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          internal var issuer: String {
            get {
              return snapshot["issuer"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "issuer")
            }
          }
        }

        internal struct BillingAddress: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAddressAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("addressLine1", type: .nonNull(.scalar(String.self))),
            GraphQLField("addressLine2", type: .scalar(String.self)),
            GraphQLField("city", type: .nonNull(.scalar(String.self))),
            GraphQLField("state", type: .nonNull(.scalar(String.self))),
            GraphQLField("postalCode", type: .nonNull(.scalar(String.self))),
            GraphQLField("country", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(addressLine1: String, addressLine2: String? = nil, city: String, state: String, postalCode: String, country: String) {
            self.init(snapshot: ["__typename": "SealedAddressAttribute", "addressLine1": addressLine1, "addressLine2": addressLine2, "city": city, "state": state, "postalCode": postalCode, "country": country])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var addressLine1: String {
            get {
              return snapshot["addressLine1"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "addressLine1")
            }
          }

          internal var addressLine2: String? {
            get {
              return snapshot["addressLine2"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "addressLine2")
            }
          }

          internal var city: String {
            get {
              return snapshot["city"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "city")
            }
          }

          internal var state: String {
            get {
              return snapshot["state"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          internal var postalCode: String {
            get {
              return snapshot["postalCode"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "postalCode")
            }
          }

          internal var country: String {
            get {
              return snapshot["country"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "country")
            }
          }
        }

        internal struct Expiry: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedExpiryAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mm", type: .nonNull(.scalar(String.self))),
            GraphQLField("yyyy", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(mm: String, yyyy: String) {
            self.init(snapshot: ["__typename": "SealedExpiryAttribute", "mm": mm, "yyyy": yyyy])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var mm: String {
            get {
              return snapshot["mm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mm")
            }
          }

          internal var yyyy: String {
            get {
              return snapshot["yyyy"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "yyyy")
            }
          }
        }
      }
    }
  }
}

internal final class OnUpdateCardProvisionStateSubscription: GraphQLSubscription {
  internal static let operationString =
    "subscription OnUpdateCardProvisionState($owner: ID!, $clientRefId: String!) {\n  onUpdateCardProvisionState(owner: $owner, clientRefId: $clientRefId) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    clientRefId\n    provisioningState\n    card {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      algorithm\n      keyId\n      keyRingId\n      owners {\n        __typename\n        id\n        issuer\n      }\n      fundingSourceId\n      currency\n      state\n      activeToEpochMs\n      cancelledAtEpochMs\n      last4\n      cardHolder\n      alias\n      pan\n      csc\n      billingAddress {\n        __typename\n        addressLine1\n        addressLine2\n        city\n        state\n        postalCode\n        country\n      }\n      expiry {\n        __typename\n        mm\n        yyyy\n      }\n    }\n    aws_ds\n  }\n}"

  internal var owner: GraphQLID
  internal var clientRefId: String

  internal init(owner: GraphQLID, clientRefId: String) {
    self.owner = owner
    self.clientRefId = clientRefId
  }

  internal var variables: GraphQLMap? {
    return ["owner": owner, "clientRefId": clientRefId]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Subscription"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateCardProvisionState", arguments: ["owner": GraphQLVariable("owner"), "clientRefId": GraphQLVariable("clientRefId")], type: .object(OnUpdateCardProvisionState.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(onUpdateCardProvisionState: OnUpdateCardProvisionState? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateCardProvisionState": onUpdateCardProvisionState.flatMap { $0.snapshot }])
    }

    /// owner: Caller's owner ID
    /// clientRefId: Client ref ID that was/will be specified when card provisioning
    /// request was/is issued.
    internal var onUpdateCardProvisionState: OnUpdateCardProvisionState? {
      get {
        return (snapshot["onUpdateCardProvisionState"] as? Snapshot).flatMap { OnUpdateCardProvisionState(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateCardProvisionState")
      }
    }

    internal struct OnUpdateCardProvisionState: GraphQLSelectionSet {
      internal static let possibleTypes = ["ProvisionalCard"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("clientRefId", type: .nonNull(.scalar(String.self))),
        GraphQLField("provisioningState", type: .nonNull(.scalar(ProvisioningState.self))),
        GraphQLField("card", type: .list(.nonNull(.object(Card.selections)))),
        GraphQLField("aws_ds", type: .scalar(DeltaAction.self)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, clientRefId: String, provisioningState: ProvisioningState, card: [Card]? = nil, awsDs: DeltaAction? = nil) {
        self.init(snapshot: ["__typename": "ProvisionalCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "clientRefId": clientRefId, "provisioningState": provisioningState, "card": card.flatMap { $0.map { $0.snapshot } }, "aws_ds": awsDs])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// See CommonObject.id
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      /// ID used for the client to subscribe to specific events.
      internal var clientRefId: String {
        get {
          return snapshot["clientRefId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "clientRefId")
        }
      }

      /// State of the provisioning request which define complete, provisioning and failed processing of card provisioning.
      internal var provisioningState: ProvisioningState {
        get {
          return snapshot["provisioningState"]! as! ProvisioningState
        }
        set {
          snapshot.updateValue(newValue, forKey: "provisioningState")
        }
      }

      /// The fully provisioned virtual card if the provisioning is successful.
      internal var card: [Card]? {
        get {
          return (snapshot["card"] as? [Snapshot]).flatMap { $0.map { Card(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "card")
        }
      }

      /// AppSync clients can filter on this and remove records from their local cache if they were deleted while offline.
      internal var awsDs: DeltaAction? {
        get {
          return snapshot["aws_ds"] as? DeltaAction
        }
        set {
          snapshot.updateValue(newValue, forKey: "aws_ds")
        }
      }

      internal struct Card: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCard"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyRingId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owners", type: .nonNull(.list(.nonNull(.object(Owner.selections))))),
          GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .nonNull(.scalar(CardState.self))),
          GraphQLField("activeToEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("cancelledAtEpochMs", type: .scalar(Double.self)),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("cardHolder", type: .nonNull(.scalar(String.self))),
          GraphQLField("alias", type: .nonNull(.scalar(String.self))),
          GraphQLField("pan", type: .nonNull(.scalar(String.self))),
          GraphQLField("csc", type: .nonNull(.scalar(String.self))),
          GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
          GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry) {
          self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// NOT SEALED. See CommonObject.id
        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// NOT SEALED. See CommonObject.owner
        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        /// NOT SEALED. See CommonObject.version
        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        /// NOT SEALED. See CommonObject.createdAtEpochMs
        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        /// NOT SEALED. See CommonObject.updatedAtEpochMs
        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        /// NOT SEALED. See SealedObject.algorithm
        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        /// NOT SEALED. See SealedObject.keyId
        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        /// NOT SEALED.
        internal var keyRingId: GraphQLID {
          get {
            return snapshot["keyRingId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyRingId")
          }
        }

        /// NOT SEALED.
        internal var owners: [Owner] {
          get {
            return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
          }
        }

        /// NOT SEALED
        internal var fundingSourceId: GraphQLID {
          get {
            return snapshot["fundingSourceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fundingSourceId")
          }
        }

        /// NOT SEALED
        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        /// NOT SEALED
        internal var state: CardState {
          get {
            return snapshot["state"]! as! CardState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        /// NOT SEALED
        internal var activeToEpochMs: Double {
          get {
            return snapshot["activeToEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "activeToEpochMs")
          }
        }

        /// NOT SEALED
        internal var cancelledAtEpochMs: Double? {
          get {
            return snapshot["cancelledAtEpochMs"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
          }
        }

        /// NOT SEALED
        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        /// SEALED
        internal var cardHolder: String {
          get {
            return snapshot["cardHolder"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardHolder")
          }
        }

        /// SEALED
        internal var alias: String {
          get {
            return snapshot["alias"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "alias")
          }
        }

        /// SEALED
        internal var pan: String {
          get {
            return snapshot["pan"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pan")
          }
        }

        /// SEALED
        internal var csc: String {
          get {
            return snapshot["csc"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "csc")
          }
        }

        /// SEALED
        internal var billingAddress: BillingAddress? {
          get {
            return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
          }
        }

        /// SEALED
        internal var expiry: Expiry {
          get {
            return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "expiry")
          }
        }

        internal struct Owner: GraphQLSelectionSet {
          internal static let possibleTypes = ["Owner"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("issuer", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(id: String, issuer: String) {
            self.init(snapshot: ["__typename": "Owner", "id": id, "issuer": issuer])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var id: String {
            get {
              return snapshot["id"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          internal var issuer: String {
            get {
              return snapshot["issuer"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "issuer")
            }
          }
        }

        internal struct BillingAddress: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAddressAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("addressLine1", type: .nonNull(.scalar(String.self))),
            GraphQLField("addressLine2", type: .scalar(String.self)),
            GraphQLField("city", type: .nonNull(.scalar(String.self))),
            GraphQLField("state", type: .nonNull(.scalar(String.self))),
            GraphQLField("postalCode", type: .nonNull(.scalar(String.self))),
            GraphQLField("country", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(addressLine1: String, addressLine2: String? = nil, city: String, state: String, postalCode: String, country: String) {
            self.init(snapshot: ["__typename": "SealedAddressAttribute", "addressLine1": addressLine1, "addressLine2": addressLine2, "city": city, "state": state, "postalCode": postalCode, "country": country])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var addressLine1: String {
            get {
              return snapshot["addressLine1"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "addressLine1")
            }
          }

          internal var addressLine2: String? {
            get {
              return snapshot["addressLine2"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "addressLine2")
            }
          }

          internal var city: String {
            get {
              return snapshot["city"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "city")
            }
          }

          internal var state: String {
            get {
              return snapshot["state"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          internal var postalCode: String {
            get {
              return snapshot["postalCode"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "postalCode")
            }
          }

          internal var country: String {
            get {
              return snapshot["country"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "country")
            }
          }
        }

        internal struct Expiry: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedExpiryAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mm", type: .nonNull(.scalar(String.self))),
            GraphQLField("yyyy", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(mm: String, yyyy: String) {
            self.init(snapshot: ["__typename": "SealedExpiryAttribute", "mm": mm, "yyyy": yyyy])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var mm: String {
            get {
              return snapshot["mm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mm")
            }
          }

          internal var yyyy: String {
            get {
              return snapshot["yyyy"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "yyyy")
            }
          }
        }
      }
    }
  }
}

internal final class OnCardProvisionCompleteSubscription: GraphQLSubscription {
  internal static let operationString =
    "subscription OnCardProvisionComplete($owner: ID!, $clientRefId: String!) {\n  onCardProvisionComplete(owner: $owner, clientRefId: $clientRefId) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    algorithm\n    keyId\n    keyRingId\n    owners {\n      __typename\n      id\n      issuer\n    }\n    fundingSourceId\n    currency\n    state\n    activeToEpochMs\n    cancelledAtEpochMs\n    last4\n    cardHolder\n    alias\n    pan\n    csc\n    billingAddress {\n      __typename\n      addressLine1\n      addressLine2\n      city\n      state\n      postalCode\n      country\n    }\n    expiry {\n      __typename\n      mm\n      yyyy\n    }\n  }\n}"

  internal var owner: GraphQLID
  internal var clientRefId: String

  internal init(owner: GraphQLID, clientRefId: String) {
    self.owner = owner
    self.clientRefId = clientRefId
  }

  internal var variables: GraphQLMap? {
    return ["owner": owner, "clientRefId": clientRefId]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Subscription"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("onCardProvisionComplete", arguments: ["owner": GraphQLVariable("owner"), "clientRefId": GraphQLVariable("clientRefId")], type: .object(OnCardProvisionComplete.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(onCardProvisionComplete: OnCardProvisionComplete? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCardProvisionComplete": onCardProvisionComplete.flatMap { $0.snapshot }])
    }

    /// owner: Caller's owner ID
    /// clientRefId: Client ref ID that was/will be specified when card provisioning
    /// request was/is issued.
    internal var onCardProvisionComplete: OnCardProvisionComplete? {
      get {
        return (snapshot["onCardProvisionComplete"] as? Snapshot).flatMap { OnCardProvisionComplete(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCardProvisionComplete")
      }
    }

    internal struct OnCardProvisionComplete: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedCard"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyRingId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owners", type: .nonNull(.list(.nonNull(.object(Owner.selections))))),
        GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("currency", type: .nonNull(.scalar(String.self))),
        GraphQLField("state", type: .nonNull(.scalar(CardState.self))),
        GraphQLField("activeToEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("cancelledAtEpochMs", type: .scalar(Double.self)),
        GraphQLField("last4", type: .nonNull(.scalar(String.self))),
        GraphQLField("cardHolder", type: .nonNull(.scalar(String.self))),
        GraphQLField("alias", type: .nonNull(.scalar(String.self))),
        GraphQLField("pan", type: .nonNull(.scalar(String.self))),
        GraphQLField("csc", type: .nonNull(.scalar(String.self))),
        GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
        GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry) {
        self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// NOT SEALED. See CommonObject.id
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// NOT SEALED. See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// NOT SEALED. See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// NOT SEALED. See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// NOT SEALED. See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      /// NOT SEALED. See SealedObject.algorithm
      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      /// NOT SEALED. See SealedObject.keyId
      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      /// NOT SEALED.
      internal var keyRingId: GraphQLID {
        get {
          return snapshot["keyRingId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyRingId")
        }
      }

      /// NOT SEALED.
      internal var owners: [Owner] {
        get {
          return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
        }
      }

      /// NOT SEALED
      internal var fundingSourceId: GraphQLID {
        get {
          return snapshot["fundingSourceId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "fundingSourceId")
        }
      }

      /// NOT SEALED
      internal var currency: String {
        get {
          return snapshot["currency"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      /// NOT SEALED
      internal var state: CardState {
        get {
          return snapshot["state"]! as! CardState
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      /// NOT SEALED
      internal var activeToEpochMs: Double {
        get {
          return snapshot["activeToEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "activeToEpochMs")
        }
      }

      /// NOT SEALED
      internal var cancelledAtEpochMs: Double? {
        get {
          return snapshot["cancelledAtEpochMs"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
        }
      }

      /// NOT SEALED
      internal var last4: String {
        get {
          return snapshot["last4"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last4")
        }
      }

      /// SEALED
      internal var cardHolder: String {
        get {
          return snapshot["cardHolder"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "cardHolder")
        }
      }

      /// SEALED
      internal var alias: String {
        get {
          return snapshot["alias"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "alias")
        }
      }

      /// SEALED
      internal var pan: String {
        get {
          return snapshot["pan"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "pan")
        }
      }

      /// SEALED
      internal var csc: String {
        get {
          return snapshot["csc"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "csc")
        }
      }

      /// SEALED
      internal var billingAddress: BillingAddress? {
        get {
          return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
        }
      }

      /// SEALED
      internal var expiry: Expiry {
        get {
          return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "expiry")
        }
      }

      internal struct Owner: GraphQLSelectionSet {
        internal static let possibleTypes = ["Owner"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("issuer", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: String, issuer: String) {
          self.init(snapshot: ["__typename": "Owner", "id": id, "issuer": issuer])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: String {
          get {
            return snapshot["id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var issuer: String {
          get {
            return snapshot["issuer"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "issuer")
          }
        }
      }

      internal struct BillingAddress: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedAddressAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("addressLine1", type: .nonNull(.scalar(String.self))),
          GraphQLField("addressLine2", type: .scalar(String.self)),
          GraphQLField("city", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .nonNull(.scalar(String.self))),
          GraphQLField("postalCode", type: .nonNull(.scalar(String.self))),
          GraphQLField("country", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(addressLine1: String, addressLine2: String? = nil, city: String, state: String, postalCode: String, country: String) {
          self.init(snapshot: ["__typename": "SealedAddressAttribute", "addressLine1": addressLine1, "addressLine2": addressLine2, "city": city, "state": state, "postalCode": postalCode, "country": country])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var addressLine1: String {
          get {
            return snapshot["addressLine1"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "addressLine1")
          }
        }

        internal var addressLine2: String? {
          get {
            return snapshot["addressLine2"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "addressLine2")
          }
        }

        internal var city: String {
          get {
            return snapshot["city"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "city")
          }
        }

        internal var state: String {
          get {
            return snapshot["state"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var postalCode: String {
          get {
            return snapshot["postalCode"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "postalCode")
          }
        }

        internal var country: String {
          get {
            return snapshot["country"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "country")
          }
        }
      }

      internal struct Expiry: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedExpiryAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mm", type: .nonNull(.scalar(String.self))),
          GraphQLField("yyyy", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(mm: String, yyyy: String) {
          self.init(snapshot: ["__typename": "SealedExpiryAttribute", "mm": mm, "yyyy": yyyy])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var mm: String {
          get {
            return snapshot["mm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "mm")
          }
        }

        internal var yyyy: String {
          get {
            return snapshot["yyyy"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "yyyy")
          }
        }
      }
    }
  }
}

internal final class OnUpdateCardSubscription: GraphQLSubscription {
  internal static let operationString =
    "subscription OnUpdateCard($owner: ID!, $clientRefId: String!) {\n  onUpdateCard(owner: $owner, clientRefId: $clientRefId) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    algorithm\n    keyId\n    keyRingId\n    owners {\n      __typename\n      id\n      issuer\n    }\n    fundingSourceId\n    currency\n    state\n    activeToEpochMs\n    cancelledAtEpochMs\n    last4\n    cardHolder\n    alias\n    pan\n    csc\n    billingAddress {\n      __typename\n      addressLine1\n      addressLine2\n      city\n      state\n      postalCode\n      country\n    }\n    expiry {\n      __typename\n      mm\n      yyyy\n    }\n  }\n}"

  internal var owner: GraphQLID
  internal var clientRefId: String

  internal init(owner: GraphQLID, clientRefId: String) {
    self.owner = owner
    self.clientRefId = clientRefId
  }

  internal var variables: GraphQLMap? {
    return ["owner": owner, "clientRefId": clientRefId]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Subscription"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateCard", arguments: ["owner": GraphQLVariable("owner"), "clientRefId": GraphQLVariable("clientRefId")], type: .object(OnUpdateCard.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(onUpdateCard: OnUpdateCard? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateCard": onUpdateCard.flatMap { $0.snapshot }])
    }

    /// owner: Caller's owner ID
    /// clientRefId: Client ref ID that was/will be specified when card provisioning
    /// request was/is issued.
    internal var onUpdateCard: OnUpdateCard? {
      get {
        return (snapshot["onUpdateCard"] as? Snapshot).flatMap { OnUpdateCard(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateCard")
      }
    }

    internal struct OnUpdateCard: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedCard"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyRingId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owners", type: .nonNull(.list(.nonNull(.object(Owner.selections))))),
        GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("currency", type: .nonNull(.scalar(String.self))),
        GraphQLField("state", type: .nonNull(.scalar(CardState.self))),
        GraphQLField("activeToEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("cancelledAtEpochMs", type: .scalar(Double.self)),
        GraphQLField("last4", type: .nonNull(.scalar(String.self))),
        GraphQLField("cardHolder", type: .nonNull(.scalar(String.self))),
        GraphQLField("alias", type: .nonNull(.scalar(String.self))),
        GraphQLField("pan", type: .nonNull(.scalar(String.self))),
        GraphQLField("csc", type: .nonNull(.scalar(String.self))),
        GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
        GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry) {
        self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// NOT SEALED. See CommonObject.id
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// NOT SEALED. See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// NOT SEALED. See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// NOT SEALED. See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// NOT SEALED. See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      /// NOT SEALED. See SealedObject.algorithm
      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      /// NOT SEALED. See SealedObject.keyId
      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      /// NOT SEALED.
      internal var keyRingId: GraphQLID {
        get {
          return snapshot["keyRingId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyRingId")
        }
      }

      /// NOT SEALED.
      internal var owners: [Owner] {
        get {
          return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
        }
      }

      /// NOT SEALED
      internal var fundingSourceId: GraphQLID {
        get {
          return snapshot["fundingSourceId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "fundingSourceId")
        }
      }

      /// NOT SEALED
      internal var currency: String {
        get {
          return snapshot["currency"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      /// NOT SEALED
      internal var state: CardState {
        get {
          return snapshot["state"]! as! CardState
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      /// NOT SEALED
      internal var activeToEpochMs: Double {
        get {
          return snapshot["activeToEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "activeToEpochMs")
        }
      }

      /// NOT SEALED
      internal var cancelledAtEpochMs: Double? {
        get {
          return snapshot["cancelledAtEpochMs"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
        }
      }

      /// NOT SEALED
      internal var last4: String {
        get {
          return snapshot["last4"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last4")
        }
      }

      /// SEALED
      internal var cardHolder: String {
        get {
          return snapshot["cardHolder"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "cardHolder")
        }
      }

      /// SEALED
      internal var alias: String {
        get {
          return snapshot["alias"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "alias")
        }
      }

      /// SEALED
      internal var pan: String {
        get {
          return snapshot["pan"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "pan")
        }
      }

      /// SEALED
      internal var csc: String {
        get {
          return snapshot["csc"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "csc")
        }
      }

      /// SEALED
      internal var billingAddress: BillingAddress? {
        get {
          return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
        }
      }

      /// SEALED
      internal var expiry: Expiry {
        get {
          return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "expiry")
        }
      }

      internal struct Owner: GraphQLSelectionSet {
        internal static let possibleTypes = ["Owner"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("issuer", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: String, issuer: String) {
          self.init(snapshot: ["__typename": "Owner", "id": id, "issuer": issuer])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: String {
          get {
            return snapshot["id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var issuer: String {
          get {
            return snapshot["issuer"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "issuer")
          }
        }
      }

      internal struct BillingAddress: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedAddressAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("addressLine1", type: .nonNull(.scalar(String.self))),
          GraphQLField("addressLine2", type: .scalar(String.self)),
          GraphQLField("city", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .nonNull(.scalar(String.self))),
          GraphQLField("postalCode", type: .nonNull(.scalar(String.self))),
          GraphQLField("country", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(addressLine1: String, addressLine2: String? = nil, city: String, state: String, postalCode: String, country: String) {
          self.init(snapshot: ["__typename": "SealedAddressAttribute", "addressLine1": addressLine1, "addressLine2": addressLine2, "city": city, "state": state, "postalCode": postalCode, "country": country])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var addressLine1: String {
          get {
            return snapshot["addressLine1"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "addressLine1")
          }
        }

        internal var addressLine2: String? {
          get {
            return snapshot["addressLine2"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "addressLine2")
          }
        }

        internal var city: String {
          get {
            return snapshot["city"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "city")
          }
        }

        internal var state: String {
          get {
            return snapshot["state"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var postalCode: String {
          get {
            return snapshot["postalCode"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "postalCode")
          }
        }

        internal var country: String {
          get {
            return snapshot["country"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "country")
          }
        }
      }

      internal struct Expiry: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedExpiryAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mm", type: .nonNull(.scalar(String.self))),
          GraphQLField("yyyy", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(mm: String, yyyy: String) {
          self.init(snapshot: ["__typename": "SealedExpiryAttribute", "mm": mm, "yyyy": yyyy])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var mm: String {
          get {
            return snapshot["mm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "mm")
          }
        }

        internal var yyyy: String {
          get {
            return snapshot["yyyy"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "yyyy")
          }
        }
      }
    }
  }
}

internal final class OnTransactionUpdateSubscription: GraphQLSubscription {
  internal static let operationString =
    "subscription OnTransactionUpdate($owner: ID!) {\n  onTransactionUpdate(owner: $owner) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    algorithm\n    keyId\n    cardId\n    sequenceId\n    type\n    transactedAtEpochMs\n    billedAmount {\n      __typename\n      currency\n      amount\n    }\n    transactedAmount {\n      __typename\n      currency\n      amount\n    }\n    description\n    declineReason\n    detail {\n      __typename\n      virtualCardAmount {\n        __typename\n        currency\n        amount\n      }\n      markup {\n        __typename\n        percent\n        flat\n        minCharge\n      }\n      markupAmount {\n        __typename\n        currency\n        amount\n      }\n      fundingSourceAmount {\n        __typename\n        currency\n        amount\n      }\n      fundingSourceId\n      description\n    }\n  }\n}"

  internal var owner: GraphQLID

  internal init(owner: GraphQLID) {
    self.owner = owner
  }

  internal var variables: GraphQLMap? {
    return ["owner": owner]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Subscription"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("onTransactionUpdate", arguments: ["owner": GraphQLVariable("owner")], type: .object(OnTransactionUpdate.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(onTransactionUpdate: OnTransactionUpdate? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onTransactionUpdate": onTransactionUpdate.flatMap { $0.snapshot }])
    }

    /// owner: Caller's owner ID
    internal var onTransactionUpdate: OnTransactionUpdate? {
      get {
        return (snapshot["onTransactionUpdate"] as? Snapshot).flatMap { OnTransactionUpdate(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onTransactionUpdate")
      }
    }

    internal struct OnTransactionUpdate: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedTransaction"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("cardId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("sequenceId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
        GraphQLField("transactedAtEpochMs", type: .nonNull(.scalar(String.self))),
        GraphQLField("billedAmount", type: .nonNull(.object(BilledAmount.selections))),
        GraphQLField("transactedAmount", type: .nonNull(.object(TransactedAmount.selections))),
        GraphQLField("description", type: .nonNull(.scalar(String.self))),
        GraphQLField("declineReason", type: .scalar(String.self)),
        GraphQLField("detail", type: .list(.nonNull(.object(Detail.selections)))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
        self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// NOT SEALED. See CommonObject.id
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// NOT SEALED. See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// NOT SEALED. See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// NOT SEALED. See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// NOT SEALED. See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      /// NOT SEALED. See SealedObject.algorithm
      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      /// NOT SEALED. See SealedObject.keyId
      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      /// NOT SEALED
      internal var cardId: GraphQLID {
        get {
          return snapshot["cardId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cardId")
        }
      }

      /// NOT SEALED
      internal var sequenceId: GraphQLID {
        get {
          return snapshot["sequenceId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "sequenceId")
        }
      }

      /// NOT SEALED
      internal var type: TransactionType {
        get {
          return snapshot["type"]! as! TransactionType
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      /// SEALED
      internal var transactedAtEpochMs: String {
        get {
          return snapshot["transactedAtEpochMs"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "transactedAtEpochMs")
        }
      }

      /// SEALED
      internal var billedAmount: BilledAmount {
        get {
          return BilledAmount(snapshot: snapshot["billedAmount"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "billedAmount")
        }
      }

      /// SEALED
      internal var transactedAmount: TransactedAmount {
        get {
          return TransactedAmount(snapshot: snapshot["transactedAmount"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "transactedAmount")
        }
      }

      /// SEALED
      internal var description: String {
        get {
          return snapshot["description"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      /// SEALED
      internal var declineReason: String? {
        get {
          return snapshot["declineReason"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "declineReason")
        }
      }

      /// List of details about this transaction depending on
      /// transaction type. Pending, complete and refund transactions
      /// will always have detail.
      internal var detail: [Detail]? {
        get {
          return (snapshot["detail"] as? [Snapshot]).flatMap { $0.map { Detail(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "detail")
        }
      }

      internal struct BilledAmount: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("amount", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(currency: String, amount: String) {
          self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Currency of currency amount
        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        /// Amount of currency amount in currency's minor unit
        internal var amount: String {
          get {
            return snapshot["amount"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "amount")
          }
        }
      }

      internal struct TransactedAmount: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("amount", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(currency: String, amount: String) {
          self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Currency of currency amount
        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        /// Amount of currency amount in currency's minor unit
        internal var amount: String {
          get {
            return snapshot["amount"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "amount")
          }
        }
      }

      internal struct Detail: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedTransactionDetailChargeAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("virtualCardAmount", type: .nonNull(.object(VirtualCardAmount.selections))),
          GraphQLField("markup", type: .nonNull(.object(Markup.selections))),
          GraphQLField("markupAmount", type: .nonNull(.object(MarkupAmount.selections))),
          GraphQLField("fundingSourceAmount", type: .nonNull(.object(FundingSourceAmount.selections))),
          GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(virtualCardAmount: VirtualCardAmount, markup: Markup, markupAmount: MarkupAmount, fundingSourceAmount: FundingSourceAmount, fundingSourceId: GraphQLID, description: String) {
          self.init(snapshot: ["__typename": "SealedTransactionDetailChargeAttribute", "virtualCardAmount": virtualCardAmount.snapshot, "markup": markup.snapshot, "markupAmount": markupAmount.snapshot, "fundingSourceAmount": fundingSourceAmount.snapshot, "fundingSourceId": fundingSourceId, "description": description])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Amount merchant charged virtual card.
        internal var virtualCardAmount: VirtualCardAmount {
          get {
            return VirtualCardAmount(snapshot: snapshot["virtualCardAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "virtualCardAmount")
          }
        }

        /// Markup formula applied to billedAmount to calculate
        internal var markup: Markup {
          get {
            return Markup(snapshot: snapshot["markup"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "markup")
          }
        }

        /// Markup amount added to transactedAmount.
        internal var markupAmount: MarkupAmount {
          get {
            return MarkupAmount(snapshot: snapshot["markupAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "markupAmount")
          }
        }

        /// Amount charged funding source.
        internal var fundingSourceAmount: FundingSourceAmount {
          get {
            return FundingSourceAmount(snapshot: snapshot["fundingSourceAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "fundingSourceAmount")
          }
        }

        /// NOT SEALED
        internal var fundingSourceId: GraphQLID {
          get {
            return snapshot["fundingSourceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fundingSourceId")
          }
        }

        /// Description that will show on the real funding source statement
        internal var description: String {
          get {
            return snapshot["description"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "description")
          }
        }

        internal struct VirtualCardAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(currency: String, amount: String) {
            self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Currency of currency amount
          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          /// Amount of currency amount in currency's minor unit
          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }
        }

        internal struct Markup: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedMarkupAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("percent", type: .nonNull(.scalar(String.self))),
            GraphQLField("flat", type: .nonNull(.scalar(String.self))),
            GraphQLField("minCharge", type: .scalar(String.self)),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(percent: String, flat: String, minCharge: String? = nil) {
            self.init(snapshot: ["__typename": "SealedMarkupAttribute", "percent": percent, "flat": flat, "minCharge": minCharge])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Floating point percentage amount applied in calculating
          /// total markup multiple by 1000. For example: 2990 for 2.99%.
          /// 1/1000th of a percent is the smallest granularity that can be
          /// represented.
          internal var percent: String {
            get {
              return snapshot["percent"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "percent")
            }
          }

          /// Flat amount applied in calculating total markup in minor
          /// currency unit of billed currency in containing transaction detail
          /// e.g. 31 for $0.31
          internal var flat: String {
            get {
              return snapshot["flat"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "flat")
            }
          }

          /// The minimum charge that will be made to the funding source. For example,
          /// if a small charge of $0.10 were made with a 2.99%+$0.31 fee formula
          /// then the resultant fee would be $0.31 cents resulting in an expected
          /// funding source charge of $0.41 cents. If minCharge is set and more than
          /// this amount then the minCharge will be charged instead.
          internal var minCharge: String? {
            get {
              return snapshot["minCharge"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "minCharge")
            }
          }
        }

        internal struct MarkupAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(currency: String, amount: String) {
            self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Currency of currency amount
          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          /// Amount of currency amount in currency's minor unit
          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }
        }

        internal struct FundingSourceAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(currency: String, amount: String) {
            self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Currency of currency amount
          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          /// Amount of currency amount in currency's minor unit
          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }
        }
      }
    }
  }
}

internal final class OnTransactionDeleteSubscription: GraphQLSubscription {
  internal static let operationString =
    "subscription OnTransactionDelete($owner: ID!) {\n  onTransactionDelete(owner: $owner) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    algorithm\n    keyId\n    cardId\n    sequenceId\n    type\n    transactedAtEpochMs\n    billedAmount {\n      __typename\n      currency\n      amount\n    }\n    transactedAmount {\n      __typename\n      currency\n      amount\n    }\n    description\n    declineReason\n    detail {\n      __typename\n      virtualCardAmount {\n        __typename\n        currency\n        amount\n      }\n      markup {\n        __typename\n        percent\n        flat\n        minCharge\n      }\n      markupAmount {\n        __typename\n        currency\n        amount\n      }\n      fundingSourceAmount {\n        __typename\n        currency\n        amount\n      }\n      fundingSourceId\n      description\n    }\n  }\n}"

  internal var owner: GraphQLID

  internal init(owner: GraphQLID) {
    self.owner = owner
  }

  internal var variables: GraphQLMap? {
    return ["owner": owner]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Subscription"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("onTransactionDelete", arguments: ["owner": GraphQLVariable("owner")], type: .object(OnTransactionDelete.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(onTransactionDelete: OnTransactionDelete? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onTransactionDelete": onTransactionDelete.flatMap { $0.snapshot }])
    }

    /// owner: Caller's owner ID
    internal var onTransactionDelete: OnTransactionDelete? {
      get {
        return (snapshot["onTransactionDelete"] as? Snapshot).flatMap { OnTransactionDelete(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onTransactionDelete")
      }
    }

    internal struct OnTransactionDelete: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedTransaction"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("cardId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("sequenceId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
        GraphQLField("transactedAtEpochMs", type: .nonNull(.scalar(String.self))),
        GraphQLField("billedAmount", type: .nonNull(.object(BilledAmount.selections))),
        GraphQLField("transactedAmount", type: .nonNull(.object(TransactedAmount.selections))),
        GraphQLField("description", type: .nonNull(.scalar(String.self))),
        GraphQLField("declineReason", type: .scalar(String.self)),
        GraphQLField("detail", type: .list(.nonNull(.object(Detail.selections)))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
        self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// NOT SEALED. See CommonObject.id
      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// NOT SEALED. See CommonObject.owner
      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      /// NOT SEALED. See CommonObject.version
      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      /// NOT SEALED. See CommonObject.createdAtEpochMs
      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      /// NOT SEALED. See CommonObject.updatedAtEpochMs
      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      /// NOT SEALED. See SealedObject.algorithm
      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      /// NOT SEALED. See SealedObject.keyId
      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      /// NOT SEALED
      internal var cardId: GraphQLID {
        get {
          return snapshot["cardId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cardId")
        }
      }

      /// NOT SEALED
      internal var sequenceId: GraphQLID {
        get {
          return snapshot["sequenceId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "sequenceId")
        }
      }

      /// NOT SEALED
      internal var type: TransactionType {
        get {
          return snapshot["type"]! as! TransactionType
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      /// SEALED
      internal var transactedAtEpochMs: String {
        get {
          return snapshot["transactedAtEpochMs"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "transactedAtEpochMs")
        }
      }

      /// SEALED
      internal var billedAmount: BilledAmount {
        get {
          return BilledAmount(snapshot: snapshot["billedAmount"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "billedAmount")
        }
      }

      /// SEALED
      internal var transactedAmount: TransactedAmount {
        get {
          return TransactedAmount(snapshot: snapshot["transactedAmount"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "transactedAmount")
        }
      }

      /// SEALED
      internal var description: String {
        get {
          return snapshot["description"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      /// SEALED
      internal var declineReason: String? {
        get {
          return snapshot["declineReason"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "declineReason")
        }
      }

      /// List of details about this transaction depending on
      /// transaction type. Pending, complete and refund transactions
      /// will always have detail.
      internal var detail: [Detail]? {
        get {
          return (snapshot["detail"] as? [Snapshot]).flatMap { $0.map { Detail(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "detail")
        }
      }

      internal struct BilledAmount: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("amount", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(currency: String, amount: String) {
          self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Currency of currency amount
        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        /// Amount of currency amount in currency's minor unit
        internal var amount: String {
          get {
            return snapshot["amount"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "amount")
          }
        }
      }

      internal struct TransactedAmount: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("amount", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(currency: String, amount: String) {
          self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Currency of currency amount
        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        /// Amount of currency amount in currency's minor unit
        internal var amount: String {
          get {
            return snapshot["amount"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "amount")
          }
        }
      }

      internal struct Detail: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedTransactionDetailChargeAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("virtualCardAmount", type: .nonNull(.object(VirtualCardAmount.selections))),
          GraphQLField("markup", type: .nonNull(.object(Markup.selections))),
          GraphQLField("markupAmount", type: .nonNull(.object(MarkupAmount.selections))),
          GraphQLField("fundingSourceAmount", type: .nonNull(.object(FundingSourceAmount.selections))),
          GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(virtualCardAmount: VirtualCardAmount, markup: Markup, markupAmount: MarkupAmount, fundingSourceAmount: FundingSourceAmount, fundingSourceId: GraphQLID, description: String) {
          self.init(snapshot: ["__typename": "SealedTransactionDetailChargeAttribute", "virtualCardAmount": virtualCardAmount.snapshot, "markup": markup.snapshot, "markupAmount": markupAmount.snapshot, "fundingSourceAmount": fundingSourceAmount.snapshot, "fundingSourceId": fundingSourceId, "description": description])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Amount merchant charged virtual card.
        internal var virtualCardAmount: VirtualCardAmount {
          get {
            return VirtualCardAmount(snapshot: snapshot["virtualCardAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "virtualCardAmount")
          }
        }

        /// Markup formula applied to billedAmount to calculate
        internal var markup: Markup {
          get {
            return Markup(snapshot: snapshot["markup"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "markup")
          }
        }

        /// Markup amount added to transactedAmount.
        internal var markupAmount: MarkupAmount {
          get {
            return MarkupAmount(snapshot: snapshot["markupAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "markupAmount")
          }
        }

        /// Amount charged funding source.
        internal var fundingSourceAmount: FundingSourceAmount {
          get {
            return FundingSourceAmount(snapshot: snapshot["fundingSourceAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "fundingSourceAmount")
          }
        }

        /// NOT SEALED
        internal var fundingSourceId: GraphQLID {
          get {
            return snapshot["fundingSourceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fundingSourceId")
          }
        }

        /// Description that will show on the real funding source statement
        internal var description: String {
          get {
            return snapshot["description"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "description")
          }
        }

        internal struct VirtualCardAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(currency: String, amount: String) {
            self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Currency of currency amount
          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          /// Amount of currency amount in currency's minor unit
          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }
        }

        internal struct Markup: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedMarkupAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("percent", type: .nonNull(.scalar(String.self))),
            GraphQLField("flat", type: .nonNull(.scalar(String.self))),
            GraphQLField("minCharge", type: .scalar(String.self)),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(percent: String, flat: String, minCharge: String? = nil) {
            self.init(snapshot: ["__typename": "SealedMarkupAttribute", "percent": percent, "flat": flat, "minCharge": minCharge])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Floating point percentage amount applied in calculating
          /// total markup multiple by 1000. For example: 2990 for 2.99%.
          /// 1/1000th of a percent is the smallest granularity that can be
          /// represented.
          internal var percent: String {
            get {
              return snapshot["percent"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "percent")
            }
          }

          /// Flat amount applied in calculating total markup in minor
          /// currency unit of billed currency in containing transaction detail
          /// e.g. 31 for $0.31
          internal var flat: String {
            get {
              return snapshot["flat"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "flat")
            }
          }

          /// The minimum charge that will be made to the funding source. For example,
          /// if a small charge of $0.10 were made with a 2.99%+$0.31 fee formula
          /// then the resultant fee would be $0.31 cents resulting in an expected
          /// funding source charge of $0.41 cents. If minCharge is set and more than
          /// this amount then the minCharge will be charged instead.
          internal var minCharge: String? {
            get {
              return snapshot["minCharge"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "minCharge")
            }
          }
        }

        internal struct MarkupAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(currency: String, amount: String) {
            self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Currency of currency amount
          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          /// Amount of currency amount in currency's minor unit
          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }
        }

        internal struct FundingSourceAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(currency: String, amount: String) {
            self.init(snapshot: ["__typename": "SealedCurrencyAmountAttribute", "currency": currency, "amount": amount])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Currency of currency amount
          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          /// Amount of currency amount in currency's minor unit
          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }
        }
      }
    }
  }
}
