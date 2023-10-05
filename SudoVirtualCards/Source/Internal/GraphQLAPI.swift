// swiftlint:disable all
//  This file was automatically generated and should not be edited.

import AWSAppSync

struct GraphQL {

internal enum KeyFormat: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case rsaPublicKey
  case spki
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "RSA_PUBLIC_KEY": self = .rsaPublicKey
      case "SPKI": self = .spki
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .rsaPublicKey: return "RSA_PUBLIC_KEY"
      case .spki: return "SPKI"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: KeyFormat, rhs: KeyFormat) -> Bool {
    switch (lhs, rhs) {
      case (.rsaPublicKey, .rsaPublicKey): return true
      case (.spki, .spki): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal enum FundingSourceType: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case bankAccount
  case creditCard
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "BANK_ACCOUNT": self = .bankAccount
      case "CREDIT_CARD": self = .creditCard
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .bankAccount: return "BANK_ACCOUNT"
      case .creditCard: return "CREDIT_CARD"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: FundingSourceType, rhs: FundingSourceType) -> Bool {
    switch (lhs, rhs) {
      case (.bankAccount, .bankAccount): return true
      case (.creditCard, .creditCard): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal enum ProvisionalFundingSourceState: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case completed
  case failed
  case pending
  case provisioning
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "COMPLETED": self = .completed
      case "FAILED": self = .failed
      case "PENDING": self = .pending
      case "PROVISIONING": self = .provisioning
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .completed: return "COMPLETED"
      case .failed: return "FAILED"
      case .pending: return "PENDING"
      case .provisioning: return "PROVISIONING"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: ProvisionalFundingSourceState, rhs: ProvisionalFundingSourceState) -> Bool {
    switch (lhs, rhs) {
      case (.completed, .completed): return true
      case (.failed, .failed): return true
      case (.pending, .pending): return true
      case (.provisioning, .provisioning): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal enum FundingSourceState: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case active
  case inactive
  case refresh
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "ACTIVE": self = .active
      case "INACTIVE": self = .inactive
      case "REFRESH": self = .refresh
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .active: return "ACTIVE"
      case .inactive: return "INACTIVE"
      case .refresh: return "REFRESH"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: FundingSourceState, rhs: FundingSourceState) -> Bool {
    switch (lhs, rhs) {
      case (.active, .active): return true
      case (.inactive, .inactive): return true
      case (.refresh, .refresh): return true
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
  case other
  case unionpay
  case visa
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "AMEX": self = .amex
      case "DINERS": self = .diners
      case "DISCOVER": self = .discover
      case "JCB": self = .jcb
      case "MASTERCARD": self = .mastercard
      case "OTHER": self = .other
      case "UNIONPAY": self = .unionpay
      case "VISA": self = .visa
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
      case .other: return "OTHER"
      case .unionpay: return "UNIONPAY"
      case .visa: return "VISA"
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
      case (.other, .other): return true
      case (.unionpay, .unionpay): return true
      case (.visa, .visa): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal enum CardType: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case credit
  case debit
  case other
  case prepaid
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "CREDIT": self = .credit
      case "DEBIT": self = .debit
      case "OTHER": self = .other
      case "PREPAID": self = .prepaid
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .credit: return "CREDIT"
      case .debit: return "DEBIT"
      case .other: return "OTHER"
      case .prepaid: return "PREPAID"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: CardType, rhs: CardType) -> Bool {
    switch (lhs, rhs) {
      case (.credit, .credit): return true
      case (.debit, .debit): return true
      case (.other, .other): return true
      case (.prepaid, .prepaid): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal enum BankAccountType: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case checking
  case other
  case savings
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "CHECKING": self = .checking
      case "OTHER": self = .other
      case "SAVINGS": self = .savings
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .checking: return "CHECKING"
      case .other: return "OTHER"
      case .savings: return "SAVINGS"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: BankAccountType, rhs: BankAccountType) -> Bool {
    switch (lhs, rhs) {
      case (.checking, .checking): return true
      case (.other, .other): return true
      case (.savings, .savings): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal enum ProvisioningState: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case completed
  case failed
  case provisioning
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "COMPLETED": self = .completed
      case "FAILED": self = .failed
      case "PROVISIONING": self = .provisioning
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .completed: return "COMPLETED"
      case .failed: return "FAILED"
      case .provisioning: return "PROVISIONING"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: ProvisioningState, rhs: ProvisioningState) -> Bool {
    switch (lhs, rhs) {
      case (.completed, .completed): return true
      case (.failed, .failed): return true
      case (.provisioning, .provisioning): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal enum CardState: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case closed
  case failed
  case issued
  case suspended
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "CLOSED": self = .closed
      case "FAILED": self = .failed
      case "ISSUED": self = .issued
      case "SUSPENDED": self = .suspended
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .closed: return "CLOSED"
      case .failed: return "FAILED"
      case .issued: return "ISSUED"
      case .suspended: return "SUSPENDED"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: CardState, rhs: CardState) -> Bool {
    switch (lhs, rhs) {
      case (.closed, .closed): return true
      case (.failed, .failed): return true
      case (.issued, .issued): return true
      case (.suspended, .suspended): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal enum TransactionType: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case complete
  case decline
  case pending
  case refund
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "COMPLETE": self = .complete
      case "DECLINE": self = .decline
      case "PENDING": self = .pending
      case "REFUND": self = .refund
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .complete: return "COMPLETE"
      case .decline: return "DECLINE"
      case .pending: return "PENDING"
      case .refund: return "REFUND"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: TransactionType, rhs: TransactionType) -> Bool {
    switch (lhs, rhs) {
      case (.complete, .complete): return true
      case (.decline, .decline): return true
      case (.pending, .pending): return true
      case (.refund, .refund): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal struct CreatePublicKeyInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(algorithm: String, keyFormat: Optional<KeyFormat?> = nil, keyId: String, keyRingId: String, publicKey: String) {
    graphQLMap = ["algorithm": algorithm, "keyFormat": keyFormat, "keyId": keyId, "keyRingId": keyRingId, "publicKey": publicKey]
  }

  internal var algorithm: String {
    get {
      return graphQLMap["algorithm"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "algorithm")
    }
  }

  internal var keyFormat: Optional<KeyFormat?> {
    get {
      return graphQLMap["keyFormat"] as! Optional<KeyFormat?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "keyFormat")
    }
  }

  internal var keyId: String {
    get {
      return graphQLMap["keyId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "keyId")
    }
  }

  internal var keyRingId: String {
    get {
      return graphQLMap["keyRingId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "keyRingId")
    }
  }

  internal var publicKey: String {
    get {
      return graphQLMap["publicKey"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "publicKey")
    }
  }
}

internal struct SetupFundingSourceRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(currency: String, language: Optional<String?> = nil, setupData: Optional<GraphQLID?> = nil, supportedProviders: Optional<[String]?> = nil, type: FundingSourceType) {
    graphQLMap = ["currency": currency, "language": language, "setupData": setupData, "supportedProviders": supportedProviders, "type": type]
  }

  internal var currency: String {
    get {
      return graphQLMap["currency"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "currency")
    }
  }

  internal var language: Optional<String?> {
    get {
      return graphQLMap["language"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "language")
    }
  }

  internal var setupData: Optional<GraphQLID?> {
    get {
      return graphQLMap["setupData"] as! Optional<GraphQLID?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "setupData")
    }
  }

  internal var supportedProviders: Optional<[String]?> {
    get {
      return graphQLMap["supportedProviders"] as! Optional<[String]?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "supportedProviders")
    }
  }

  internal var type: FundingSourceType {
    get {
      return graphQLMap["type"] as! FundingSourceType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }
}

internal struct CompleteFundingSourceRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(completionData: GraphQLID, id: GraphQLID, updateCardFundingSource: Optional<Bool?> = nil) {
    graphQLMap = ["completionData": completionData, "id": id, "updateCardFundingSource": updateCardFundingSource]
  }

  internal var completionData: GraphQLID {
    get {
      return graphQLMap["completionData"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "completionData")
    }
  }

  internal var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  internal var updateCardFundingSource: Optional<Bool?> {
    get {
      return graphQLMap["updateCardFundingSource"] as! Optional<Bool?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "updateCardFundingSource")
    }
  }
}

internal struct RefreshFundingSourceRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(id: GraphQLID, language: Optional<String?> = nil, refreshData: GraphQLID) {
    graphQLMap = ["id": id, "language": language, "refreshData": refreshData]
  }

  internal var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  internal var language: Optional<String?> {
    get {
      return graphQLMap["language"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "language")
    }
  }

  internal var refreshData: GraphQLID {
    get {
      return graphQLMap["refreshData"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "refreshData")
    }
  }
}

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

internal struct CardProvisionRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(alias: Optional<String?> = nil, billingAddress: Optional<AddressInput?> = nil, cardHolder: String, clientRefId: String, currency: String, fundingSourceId: GraphQLID, keyRingId: GraphQLID, metadata: Optional<SealedAttributeInput?> = nil, ownerProofs: [GraphQLID]) {
    graphQLMap = ["alias": alias, "billingAddress": billingAddress, "cardHolder": cardHolder, "clientRefId": clientRefId, "currency": currency, "fundingSourceId": fundingSourceId, "keyRingId": keyRingId, "metadata": metadata, "ownerProofs": ownerProofs]
  }

  internal var alias: Optional<String?> {
    get {
      return graphQLMap["alias"] as! Optional<String?>
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

  internal var cardHolder: String {
    get {
      return graphQLMap["cardHolder"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cardHolder")
    }
  }

  internal var clientRefId: String {
    get {
      return graphQLMap["clientRefId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "clientRefId")
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

  internal var fundingSourceId: GraphQLID {
    get {
      return graphQLMap["fundingSourceId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fundingSourceId")
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

  internal var metadata: Optional<SealedAttributeInput?> {
    get {
      return graphQLMap["metadata"] as! Optional<SealedAttributeInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "metadata")
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
}

internal struct AddressInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(addressLine1: String, addressLine2: Optional<String?> = nil, city: String, country: String, postalCode: String, state: String) {
    graphQLMap = ["addressLine1": addressLine1, "addressLine2": addressLine2, "city": city, "country": country, "postalCode": postalCode, "state": state]
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

  internal var country: String {
    get {
      return graphQLMap["country"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "country")
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

  internal var state: String {
    get {
      return graphQLMap["state"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "state")
    }
  }
}

internal struct SealedAttributeInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(algorithm: String, base64EncodedSealedData: String, keyId: String, plainTextType: String) {
    graphQLMap = ["algorithm": algorithm, "base64EncodedSealedData": base64EncodedSealedData, "keyId": keyId, "plainTextType": plainTextType]
  }

  internal var algorithm: String {
    get {
      return graphQLMap["algorithm"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "algorithm")
    }
  }

  internal var base64EncodedSealedData: String {
    get {
      return graphQLMap["base64EncodedSealedData"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "base64EncodedSealedData")
    }
  }

  internal var keyId: String {
    get {
      return graphQLMap["keyId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "keyId")
    }
  }

  internal var plainTextType: String {
    get {
      return graphQLMap["plainTextType"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "plainTextType")
    }
  }
}

internal struct CardUpdateRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(alias: Optional<String?> = nil, billingAddress: Optional<AddressInput?> = nil, cardHolder: Optional<String?> = nil, expectedVersion: Optional<Int?> = nil, id: GraphQLID, keyId: Optional<String?> = nil, metadata: Optional<SealedAttributeInput?> = nil) {
    graphQLMap = ["alias": alias, "billingAddress": billingAddress, "cardHolder": cardHolder, "expectedVersion": expectedVersion, "id": id, "keyId": keyId, "metadata": metadata]
  }

  internal var alias: Optional<String?> {
    get {
      return graphQLMap["alias"] as! Optional<String?>
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

  internal var cardHolder: Optional<String?> {
    get {
      return graphQLMap["cardHolder"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cardHolder")
    }
  }

  internal var expectedVersion: Optional<Int?> {
    get {
      return graphQLMap["expectedVersion"] as! Optional<Int?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "expectedVersion")
    }
  }

  internal var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  internal var keyId: Optional<String?> {
    get {
      return graphQLMap["keyId"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "keyId")
    }
  }

  internal var metadata: Optional<SealedAttributeInput?> {
    get {
      return graphQLMap["metadata"] as! Optional<SealedAttributeInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "metadata")
    }
  }
}

internal struct CardCancelRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(id: GraphQLID, keyId: Optional<String?> = nil) {
    graphQLMap = ["id": id, "keyId": keyId]
  }

  internal var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  internal var keyId: Optional<String?> {
    get {
      return graphQLMap["keyId"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "keyId")
    }
  }
}

internal struct SandboxSetFundingSourceToRequireRefreshRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(fundingSourceId: String) {
    graphQLMap = ["fundingSourceId": fundingSourceId]
  }

  internal var fundingSourceId: String {
    get {
      return graphQLMap["fundingSourceId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fundingSourceId")
    }
  }
}

internal struct ProvisionalCardFilterInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(clientRefId: Optional<IDFilterInput?> = nil) {
    graphQLMap = ["clientRefId": clientRefId]
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

  internal init(beginsWith: Optional<GraphQLID?> = nil, between: Optional<[GraphQLID?]?> = nil, contains: Optional<GraphQLID?> = nil, eq: Optional<GraphQLID?> = nil, ge: Optional<GraphQLID?> = nil, gt: Optional<GraphQLID?> = nil, le: Optional<GraphQLID?> = nil, lt: Optional<GraphQLID?> = nil, ne: Optional<GraphQLID?> = nil, notContains: Optional<GraphQLID?> = nil) {
    graphQLMap = ["beginsWith": beginsWith, "between": between, "contains": contains, "eq": eq, "ge": ge, "gt": gt, "le": le, "lt": lt, "ne": ne, "notContains": notContains]
  }

  internal var beginsWith: Optional<GraphQLID?> {
    get {
      return graphQLMap["beginsWith"] as! Optional<GraphQLID?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
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

  internal var contains: Optional<GraphQLID?> {
    get {
      return graphQLMap["contains"] as! Optional<GraphQLID?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
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

  internal var ne: Optional<GraphQLID?> {
    get {
      return graphQLMap["ne"] as! Optional<GraphQLID?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
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
}

internal struct DateRangeInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(endDateEpochMs: Double, startDateEpochMs: Double) {
    graphQLMap = ["endDateEpochMs": endDateEpochMs, "startDateEpochMs": startDateEpochMs]
  }

  internal var endDateEpochMs: Double {
    get {
      return graphQLMap["endDateEpochMs"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "endDateEpochMs")
    }
  }

  internal var startDateEpochMs: Double {
    get {
      return graphQLMap["startDateEpochMs"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "startDateEpochMs")
    }
  }
}

internal enum SortOrder: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case asc
  case desc
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "ASC": self = .asc
      case "DESC": self = .desc
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .asc: return "ASC"
      case .desc: return "DESC"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: SortOrder, rhs: SortOrder) -> Bool {
    switch (lhs, rhs) {
      case (.asc, .asc): return true
      case (.desc, .desc): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

/// Request to generate and retrieve the internal token and bank account id
/// required to complete bank account funding source provisioning in a sandbox context.
/// 
/// List of supported sandbox institutionId: https://plaid.com/docs/sandbox/institutions/
internal struct SandboxGetPlaidDataRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(institutionId: String, username: String) {
    graphQLMap = ["institutionId": institutionId, "username": username]
  }

  internal var institutionId: String {
    get {
      return graphQLMap["institutionId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "institutionId")
    }
  }

  internal var username: String {
    get {
      return graphQLMap["username"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }
}

internal final class CreatePublicKeyMutation: GraphQLMutation {
  internal static let operationString =
    "mutation CreatePublicKey($input: CreatePublicKeyInput!) {\n  createPublicKeyForVirtualCards(input: $input) {\n    __typename\n    ...PublicKey\n  }\n}"

  internal static var requestString: String { return operationString.appending(PublicKey.fragmentString) }

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
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyRingId", type: .nonNull(.scalar(String.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyFormat", type: .scalar(KeyFormat.self)),
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

      internal init(id: GraphQLID, keyId: String, keyRingId: String, algorithm: String, keyFormat: KeyFormat? = nil, publicKey: String, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double) {
        self.init(snapshot: ["__typename": "PublicKey", "id": id, "keyId": keyId, "keyRingId": keyRingId, "algorithm": algorithm, "keyFormat": keyFormat, "publicKey": publicKey, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      internal var keyRingId: String {
        get {
          return snapshot["keyRingId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyRingId")
        }
      }

      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      internal var keyFormat: KeyFormat? {
        get {
          return snapshot["keyFormat"] as? KeyFormat
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyFormat")
        }
      }

      internal var publicKey: String {
        get {
          return snapshot["publicKey"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "publicKey")
        }
      }

      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var publicKey: PublicKey {
          get {
            return PublicKey(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

internal final class SetupFundingSourceMutation: GraphQLMutation {
  internal static let operationString =
    "mutation SetupFundingSource($input: SetupFundingSourceRequest!) {\n  setupFundingSource(input: $input) {\n    __typename\n    ...ProvisionalFundingSource\n  }\n}"

  internal static var requestString: String { return operationString.appending(ProvisionalFundingSource.fragmentString) }

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
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("type", type: .nonNull(.scalar(FundingSourceType.self))),
        GraphQLField("provisioningData", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("state", type: .nonNull(.scalar(ProvisionalFundingSourceState.self))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, type: FundingSourceType, provisioningData: GraphQLID, state: ProvisionalFundingSourceState) {
        self.init(snapshot: ["__typename": "ProvisionalFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "type": type, "provisioningData": provisioningData, "state": state])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      internal var type: FundingSourceType {
        get {
          return snapshot["type"]! as! FundingSourceType
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      internal var provisioningData: GraphQLID {
        get {
          return snapshot["provisioningData"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "provisioningData")
        }
      }

      internal var state: ProvisionalFundingSourceState {
        get {
          return snapshot["state"]! as! ProvisionalFundingSourceState
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var provisionalFundingSource: ProvisionalFundingSource {
          get {
            return ProvisionalFundingSource(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

internal final class CompleteFundingSourceMutation: GraphQLMutation {
  internal static let operationString =
    "mutation CompleteFundingSource($input: CompleteFundingSourceRequest!) {\n  completeFundingSource(input: $input) {\n    __typename\n    ... on CreditCardFundingSource {\n      ...CreditCardFundingSource\n    }\n    ... on BankAccountFundingSource {\n      ...BankAccountFundingSource\n    }\n  }\n}"

  internal static var requestString: String { return operationString.appending(CreditCardFundingSource.fragmentString).appending(BankAccountFundingSource.fragmentString).appending(SealedAttribute.fragmentString) }

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

    internal var completeFundingSource: CompleteFundingSource {
      get {
        return CompleteFundingSource(snapshot: snapshot["completeFundingSource"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "completeFundingSource")
      }
    }

    internal struct CompleteFundingSource: GraphQLSelectionSet {
      internal static let possibleTypes = ["BankAccountFundingSource", "CreditCardFundingSource"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLTypeCase(
          variants: ["CreditCardFundingSource": AsCreditCardFundingSource.selections, "BankAccountFundingSource": AsBankAccountFundingSource.selections],
          default: [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          ]
        )
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal static func makeCreditCardFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: AsCreditCardFundingSource.TransactionVelocity? = nil, last4: String, network: CreditCardNetwork, cardType: CardType) -> CompleteFundingSource {
        return CompleteFundingSource(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "last4": last4, "network": network, "cardType": cardType])
      }

      internal static func makeBankAccountFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: AsBankAccountFundingSource.TransactionVelocity? = nil, bankAccountType: BankAccountType, authorization: AsBankAccountFundingSource.Authorization, last4: String, institutionName: AsBankAccountFundingSource.InstitutionName, institutionLogo: AsBankAccountFundingSource.InstitutionLogo? = nil) -> CompleteFundingSource {
        return CompleteFundingSource(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "bankAccountType": bankAccountType, "authorization": authorization.snapshot, "last4": last4, "institutionName": institutionName.snapshot, "institutionLogo": institutionLogo.flatMap { $0.snapshot }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var asCreditCardFundingSource: AsCreditCardFundingSource? {
        get {
          if !AsCreditCardFundingSource.possibleTypes.contains(__typename) { return nil }
          return AsCreditCardFundingSource(snapshot: snapshot)
        }
        set {
          guard let newValue = newValue else { return }
          snapshot = newValue.snapshot
        }
      }

      internal struct AsCreditCardFundingSource: GraphQLSelectionSet {
        internal static let possibleTypes = ["CreditCardFundingSource"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("transactionVelocity", type: .object(TransactionVelocity.selections)),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("network", type: .nonNull(.scalar(CreditCardNetwork.self))),
          GraphQLField("cardType", type: .nonNull(.scalar(CardType.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: TransactionVelocity? = nil, last4: String, network: CreditCardNetwork, cardType: CardType) {
          self.init(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "last4": last4, "network": network, "cardType": cardType])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var state: FundingSourceState {
          get {
            return snapshot["state"]! as! FundingSourceState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var transactionVelocity: TransactionVelocity? {
          get {
            return (snapshot["transactionVelocity"] as? Snapshot).flatMap { TransactionVelocity(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "transactionVelocity")
          }
        }

        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        internal var network: CreditCardNetwork {
          get {
            return snapshot["network"]! as! CreditCardNetwork
          }
          set {
            snapshot.updateValue(newValue, forKey: "network")
          }
        }

        internal var cardType: CardType {
          get {
            return snapshot["cardType"]! as! CardType
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardType")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var creditCardFundingSource: CreditCardFundingSource {
            get {
              return CreditCardFundingSource(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct TransactionVelocity: GraphQLSelectionSet {
          internal static let possibleTypes = ["TransactionVelocity"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("maximum", type: .scalar(Int.self)),
            GraphQLField("velocity", type: .list(.nonNull(.scalar(String.self)))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(maximum: Int? = nil, velocity: [String]? = nil) {
            self.init(snapshot: ["__typename": "TransactionVelocity", "maximum": maximum, "velocity": velocity])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var maximum: Int? {
            get {
              return snapshot["maximum"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "maximum")
            }
          }

          internal var velocity: [String]? {
            get {
              return snapshot["velocity"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "velocity")
            }
          }
        }
      }

      internal var asBankAccountFundingSource: AsBankAccountFundingSource? {
        get {
          if !AsBankAccountFundingSource.possibleTypes.contains(__typename) { return nil }
          return AsBankAccountFundingSource(snapshot: snapshot)
        }
        set {
          guard let newValue = newValue else { return }
          snapshot = newValue.snapshot
        }
      }

      internal struct AsBankAccountFundingSource: GraphQLSelectionSet {
        internal static let possibleTypes = ["BankAccountFundingSource"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("transactionVelocity", type: .object(TransactionVelocity.selections)),
          GraphQLField("bankAccountType", type: .nonNull(.scalar(BankAccountType.self))),
          GraphQLField("authorization", type: .nonNull(.object(Authorization.selections))),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("institutionName", type: .nonNull(.object(InstitutionName.selections))),
          GraphQLField("institutionLogo", type: .object(InstitutionLogo.selections)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: TransactionVelocity? = nil, bankAccountType: BankAccountType, authorization: Authorization, last4: String, institutionName: InstitutionName, institutionLogo: InstitutionLogo? = nil) {
          self.init(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "bankAccountType": bankAccountType, "authorization": authorization.snapshot, "last4": last4, "institutionName": institutionName.snapshot, "institutionLogo": institutionLogo.flatMap { $0.snapshot }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var state: FundingSourceState {
          get {
            return snapshot["state"]! as! FundingSourceState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var transactionVelocity: TransactionVelocity? {
          get {
            return (snapshot["transactionVelocity"] as? Snapshot).flatMap { TransactionVelocity(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "transactionVelocity")
          }
        }

        internal var bankAccountType: BankAccountType {
          get {
            return snapshot["bankAccountType"]! as! BankAccountType
          }
          set {
            snapshot.updateValue(newValue, forKey: "bankAccountType")
          }
        }

        internal var authorization: Authorization {
          get {
            return Authorization(snapshot: snapshot["authorization"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "authorization")
          }
        }

        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        internal var institutionName: InstitutionName {
          get {
            return InstitutionName(snapshot: snapshot["institutionName"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "institutionName")
          }
        }

        internal var institutionLogo: InstitutionLogo? {
          get {
            return (snapshot["institutionLogo"] as? Snapshot).flatMap { InstitutionLogo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "institutionLogo")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var bankAccountFundingSource: BankAccountFundingSource {
            get {
              return BankAccountFundingSource(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct TransactionVelocity: GraphQLSelectionSet {
          internal static let possibleTypes = ["TransactionVelocity"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("maximum", type: .scalar(Int.self)),
            GraphQLField("velocity", type: .list(.nonNull(.scalar(String.self)))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(maximum: Int? = nil, velocity: [String]? = nil) {
            self.init(snapshot: ["__typename": "TransactionVelocity", "maximum": maximum, "velocity": velocity])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var maximum: Int? {
            get {
              return snapshot["maximum"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "maximum")
            }
          }

          internal var velocity: [String]? {
            get {
              return snapshot["velocity"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "velocity")
            }
          }
        }

        internal struct Authorization: GraphQLSelectionSet {
          internal static let possibleTypes = ["SignedAuthorizationText"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("language", type: .nonNull(.scalar(String.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("contentType", type: .nonNull(.scalar(String.self))),
            GraphQLField("signature", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("data", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(language: String, content: String, contentType: String, signature: String, keyId: String, algorithm: String, data: String) {
            self.init(snapshot: ["__typename": "SignedAuthorizationText", "language": language, "content": content, "contentType": contentType, "signature": signature, "keyId": keyId, "algorithm": algorithm, "data": data])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var language: String {
            get {
              return snapshot["language"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "language")
            }
          }

          internal var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          internal var contentType: String {
            get {
              return snapshot["contentType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "contentType")
            }
          }

          internal var signature: String {
            get {
              return snapshot["signature"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "signature")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var data: String {
            get {
              return snapshot["data"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "data")
            }
          }
        }

        internal struct InstitutionName: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var plainTextType: String {
            get {
              return snapshot["plainTextType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "plainTextType")
            }
          }

          internal var base64EncodedSealedData: String {
            get {
              return snapshot["base64EncodedSealedData"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAttribute: SealedAttribute {
              get {
                return SealedAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct InstitutionLogo: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var plainTextType: String {
            get {
              return snapshot["plainTextType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "plainTextType")
            }
          }

          internal var base64EncodedSealedData: String {
            get {
              return snapshot["base64EncodedSealedData"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAttribute: SealedAttribute {
              get {
                return SealedAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

internal final class RefreshFundingSourceMutation: GraphQLMutation {
  internal static let operationString =
    "mutation RefreshFundingSource($input: RefreshFundingSourceRequest!) {\n  refreshFundingSource(input: $input) {\n    __typename\n    ... on CreditCardFundingSource {\n      ...CreditCardFundingSource\n    }\n    ... on BankAccountFundingSource {\n      ...BankAccountFundingSource\n    }\n  }\n}"

  internal static var requestString: String { return operationString.appending(CreditCardFundingSource.fragmentString).appending(BankAccountFundingSource.fragmentString).appending(SealedAttribute.fragmentString) }

  internal var input: RefreshFundingSourceRequest

  internal init(input: RefreshFundingSourceRequest) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("refreshFundingSource", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(RefreshFundingSource.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(refreshFundingSource: RefreshFundingSource) {
      self.init(snapshot: ["__typename": "Mutation", "refreshFundingSource": refreshFundingSource.snapshot])
    }

    internal var refreshFundingSource: RefreshFundingSource {
      get {
        return RefreshFundingSource(snapshot: snapshot["refreshFundingSource"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "refreshFundingSource")
      }
    }

    internal struct RefreshFundingSource: GraphQLSelectionSet {
      internal static let possibleTypes = ["BankAccountFundingSource", "CreditCardFundingSource"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLTypeCase(
          variants: ["CreditCardFundingSource": AsCreditCardFundingSource.selections, "BankAccountFundingSource": AsBankAccountFundingSource.selections],
          default: [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          ]
        )
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal static func makeCreditCardFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: AsCreditCardFundingSource.TransactionVelocity? = nil, last4: String, network: CreditCardNetwork, cardType: CardType) -> RefreshFundingSource {
        return RefreshFundingSource(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "last4": last4, "network": network, "cardType": cardType])
      }

      internal static func makeBankAccountFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: AsBankAccountFundingSource.TransactionVelocity? = nil, bankAccountType: BankAccountType, authorization: AsBankAccountFundingSource.Authorization, last4: String, institutionName: AsBankAccountFundingSource.InstitutionName, institutionLogo: AsBankAccountFundingSource.InstitutionLogo? = nil) -> RefreshFundingSource {
        return RefreshFundingSource(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "bankAccountType": bankAccountType, "authorization": authorization.snapshot, "last4": last4, "institutionName": institutionName.snapshot, "institutionLogo": institutionLogo.flatMap { $0.snapshot }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var asCreditCardFundingSource: AsCreditCardFundingSource? {
        get {
          if !AsCreditCardFundingSource.possibleTypes.contains(__typename) { return nil }
          return AsCreditCardFundingSource(snapshot: snapshot)
        }
        set {
          guard let newValue = newValue else { return }
          snapshot = newValue.snapshot
        }
      }

      internal struct AsCreditCardFundingSource: GraphQLSelectionSet {
        internal static let possibleTypes = ["CreditCardFundingSource"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("transactionVelocity", type: .object(TransactionVelocity.selections)),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("network", type: .nonNull(.scalar(CreditCardNetwork.self))),
          GraphQLField("cardType", type: .nonNull(.scalar(CardType.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: TransactionVelocity? = nil, last4: String, network: CreditCardNetwork, cardType: CardType) {
          self.init(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "last4": last4, "network": network, "cardType": cardType])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var state: FundingSourceState {
          get {
            return snapshot["state"]! as! FundingSourceState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var transactionVelocity: TransactionVelocity? {
          get {
            return (snapshot["transactionVelocity"] as? Snapshot).flatMap { TransactionVelocity(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "transactionVelocity")
          }
        }

        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        internal var network: CreditCardNetwork {
          get {
            return snapshot["network"]! as! CreditCardNetwork
          }
          set {
            snapshot.updateValue(newValue, forKey: "network")
          }
        }

        internal var cardType: CardType {
          get {
            return snapshot["cardType"]! as! CardType
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardType")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var creditCardFundingSource: CreditCardFundingSource {
            get {
              return CreditCardFundingSource(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct TransactionVelocity: GraphQLSelectionSet {
          internal static let possibleTypes = ["TransactionVelocity"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("maximum", type: .scalar(Int.self)),
            GraphQLField("velocity", type: .list(.nonNull(.scalar(String.self)))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(maximum: Int? = nil, velocity: [String]? = nil) {
            self.init(snapshot: ["__typename": "TransactionVelocity", "maximum": maximum, "velocity": velocity])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var maximum: Int? {
            get {
              return snapshot["maximum"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "maximum")
            }
          }

          internal var velocity: [String]? {
            get {
              return snapshot["velocity"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "velocity")
            }
          }
        }
      }

      internal var asBankAccountFundingSource: AsBankAccountFundingSource? {
        get {
          if !AsBankAccountFundingSource.possibleTypes.contains(__typename) { return nil }
          return AsBankAccountFundingSource(snapshot: snapshot)
        }
        set {
          guard let newValue = newValue else { return }
          snapshot = newValue.snapshot
        }
      }

      internal struct AsBankAccountFundingSource: GraphQLSelectionSet {
        internal static let possibleTypes = ["BankAccountFundingSource"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("transactionVelocity", type: .object(TransactionVelocity.selections)),
          GraphQLField("bankAccountType", type: .nonNull(.scalar(BankAccountType.self))),
          GraphQLField("authorization", type: .nonNull(.object(Authorization.selections))),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("institutionName", type: .nonNull(.object(InstitutionName.selections))),
          GraphQLField("institutionLogo", type: .object(InstitutionLogo.selections)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: TransactionVelocity? = nil, bankAccountType: BankAccountType, authorization: Authorization, last4: String, institutionName: InstitutionName, institutionLogo: InstitutionLogo? = nil) {
          self.init(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "bankAccountType": bankAccountType, "authorization": authorization.snapshot, "last4": last4, "institutionName": institutionName.snapshot, "institutionLogo": institutionLogo.flatMap { $0.snapshot }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var state: FundingSourceState {
          get {
            return snapshot["state"]! as! FundingSourceState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var transactionVelocity: TransactionVelocity? {
          get {
            return (snapshot["transactionVelocity"] as? Snapshot).flatMap { TransactionVelocity(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "transactionVelocity")
          }
        }

        internal var bankAccountType: BankAccountType {
          get {
            return snapshot["bankAccountType"]! as! BankAccountType
          }
          set {
            snapshot.updateValue(newValue, forKey: "bankAccountType")
          }
        }

        internal var authorization: Authorization {
          get {
            return Authorization(snapshot: snapshot["authorization"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "authorization")
          }
        }

        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        internal var institutionName: InstitutionName {
          get {
            return InstitutionName(snapshot: snapshot["institutionName"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "institutionName")
          }
        }

        internal var institutionLogo: InstitutionLogo? {
          get {
            return (snapshot["institutionLogo"] as? Snapshot).flatMap { InstitutionLogo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "institutionLogo")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var bankAccountFundingSource: BankAccountFundingSource {
            get {
              return BankAccountFundingSource(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct TransactionVelocity: GraphQLSelectionSet {
          internal static let possibleTypes = ["TransactionVelocity"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("maximum", type: .scalar(Int.self)),
            GraphQLField("velocity", type: .list(.nonNull(.scalar(String.self)))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(maximum: Int? = nil, velocity: [String]? = nil) {
            self.init(snapshot: ["__typename": "TransactionVelocity", "maximum": maximum, "velocity": velocity])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var maximum: Int? {
            get {
              return snapshot["maximum"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "maximum")
            }
          }

          internal var velocity: [String]? {
            get {
              return snapshot["velocity"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "velocity")
            }
          }
        }

        internal struct Authorization: GraphQLSelectionSet {
          internal static let possibleTypes = ["SignedAuthorizationText"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("language", type: .nonNull(.scalar(String.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("contentType", type: .nonNull(.scalar(String.self))),
            GraphQLField("signature", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("data", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(language: String, content: String, contentType: String, signature: String, keyId: String, algorithm: String, data: String) {
            self.init(snapshot: ["__typename": "SignedAuthorizationText", "language": language, "content": content, "contentType": contentType, "signature": signature, "keyId": keyId, "algorithm": algorithm, "data": data])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var language: String {
            get {
              return snapshot["language"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "language")
            }
          }

          internal var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          internal var contentType: String {
            get {
              return snapshot["contentType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "contentType")
            }
          }

          internal var signature: String {
            get {
              return snapshot["signature"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "signature")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var data: String {
            get {
              return snapshot["data"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "data")
            }
          }
        }

        internal struct InstitutionName: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var plainTextType: String {
            get {
              return snapshot["plainTextType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "plainTextType")
            }
          }

          internal var base64EncodedSealedData: String {
            get {
              return snapshot["base64EncodedSealedData"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAttribute: SealedAttribute {
              get {
                return SealedAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct InstitutionLogo: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var plainTextType: String {
            get {
              return snapshot["plainTextType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "plainTextType")
            }
          }

          internal var base64EncodedSealedData: String {
            get {
              return snapshot["base64EncodedSealedData"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAttribute: SealedAttribute {
              get {
                return SealedAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

internal final class CancelFundingSourceMutation: GraphQLMutation {
  internal static let operationString =
    "mutation CancelFundingSource($input: IdInput!) {\n  cancelFundingSource(input: $input) {\n    __typename\n    ... on CreditCardFundingSource {\n      ...CreditCardFundingSource\n    }\n    ... on BankAccountFundingSource {\n      ...BankAccountFundingSource\n    }\n  }\n}"

  internal static var requestString: String { return operationString.appending(CreditCardFundingSource.fragmentString).appending(BankAccountFundingSource.fragmentString).appending(SealedAttribute.fragmentString) }

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

    internal var cancelFundingSource: CancelFundingSource {
      get {
        return CancelFundingSource(snapshot: snapshot["cancelFundingSource"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "cancelFundingSource")
      }
    }

    internal struct CancelFundingSource: GraphQLSelectionSet {
      internal static let possibleTypes = ["BankAccountFundingSource", "CreditCardFundingSource"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLTypeCase(
          variants: ["CreditCardFundingSource": AsCreditCardFundingSource.selections, "BankAccountFundingSource": AsBankAccountFundingSource.selections],
          default: [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          ]
        )
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal static func makeCreditCardFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: AsCreditCardFundingSource.TransactionVelocity? = nil, last4: String, network: CreditCardNetwork, cardType: CardType) -> CancelFundingSource {
        return CancelFundingSource(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "last4": last4, "network": network, "cardType": cardType])
      }

      internal static func makeBankAccountFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: AsBankAccountFundingSource.TransactionVelocity? = nil, bankAccountType: BankAccountType, authorization: AsBankAccountFundingSource.Authorization, last4: String, institutionName: AsBankAccountFundingSource.InstitutionName, institutionLogo: AsBankAccountFundingSource.InstitutionLogo? = nil) -> CancelFundingSource {
        return CancelFundingSource(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "bankAccountType": bankAccountType, "authorization": authorization.snapshot, "last4": last4, "institutionName": institutionName.snapshot, "institutionLogo": institutionLogo.flatMap { $0.snapshot }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var asCreditCardFundingSource: AsCreditCardFundingSource? {
        get {
          if !AsCreditCardFundingSource.possibleTypes.contains(__typename) { return nil }
          return AsCreditCardFundingSource(snapshot: snapshot)
        }
        set {
          guard let newValue = newValue else { return }
          snapshot = newValue.snapshot
        }
      }

      internal struct AsCreditCardFundingSource: GraphQLSelectionSet {
        internal static let possibleTypes = ["CreditCardFundingSource"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("transactionVelocity", type: .object(TransactionVelocity.selections)),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("network", type: .nonNull(.scalar(CreditCardNetwork.self))),
          GraphQLField("cardType", type: .nonNull(.scalar(CardType.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: TransactionVelocity? = nil, last4: String, network: CreditCardNetwork, cardType: CardType) {
          self.init(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "last4": last4, "network": network, "cardType": cardType])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var state: FundingSourceState {
          get {
            return snapshot["state"]! as! FundingSourceState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var transactionVelocity: TransactionVelocity? {
          get {
            return (snapshot["transactionVelocity"] as? Snapshot).flatMap { TransactionVelocity(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "transactionVelocity")
          }
        }

        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        internal var network: CreditCardNetwork {
          get {
            return snapshot["network"]! as! CreditCardNetwork
          }
          set {
            snapshot.updateValue(newValue, forKey: "network")
          }
        }

        internal var cardType: CardType {
          get {
            return snapshot["cardType"]! as! CardType
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardType")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var creditCardFundingSource: CreditCardFundingSource {
            get {
              return CreditCardFundingSource(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct TransactionVelocity: GraphQLSelectionSet {
          internal static let possibleTypes = ["TransactionVelocity"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("maximum", type: .scalar(Int.self)),
            GraphQLField("velocity", type: .list(.nonNull(.scalar(String.self)))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(maximum: Int? = nil, velocity: [String]? = nil) {
            self.init(snapshot: ["__typename": "TransactionVelocity", "maximum": maximum, "velocity": velocity])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var maximum: Int? {
            get {
              return snapshot["maximum"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "maximum")
            }
          }

          internal var velocity: [String]? {
            get {
              return snapshot["velocity"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "velocity")
            }
          }
        }
      }

      internal var asBankAccountFundingSource: AsBankAccountFundingSource? {
        get {
          if !AsBankAccountFundingSource.possibleTypes.contains(__typename) { return nil }
          return AsBankAccountFundingSource(snapshot: snapshot)
        }
        set {
          guard let newValue = newValue else { return }
          snapshot = newValue.snapshot
        }
      }

      internal struct AsBankAccountFundingSource: GraphQLSelectionSet {
        internal static let possibleTypes = ["BankAccountFundingSource"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("transactionVelocity", type: .object(TransactionVelocity.selections)),
          GraphQLField("bankAccountType", type: .nonNull(.scalar(BankAccountType.self))),
          GraphQLField("authorization", type: .nonNull(.object(Authorization.selections))),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("institutionName", type: .nonNull(.object(InstitutionName.selections))),
          GraphQLField("institutionLogo", type: .object(InstitutionLogo.selections)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: TransactionVelocity? = nil, bankAccountType: BankAccountType, authorization: Authorization, last4: String, institutionName: InstitutionName, institutionLogo: InstitutionLogo? = nil) {
          self.init(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "bankAccountType": bankAccountType, "authorization": authorization.snapshot, "last4": last4, "institutionName": institutionName.snapshot, "institutionLogo": institutionLogo.flatMap { $0.snapshot }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var state: FundingSourceState {
          get {
            return snapshot["state"]! as! FundingSourceState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var transactionVelocity: TransactionVelocity? {
          get {
            return (snapshot["transactionVelocity"] as? Snapshot).flatMap { TransactionVelocity(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "transactionVelocity")
          }
        }

        internal var bankAccountType: BankAccountType {
          get {
            return snapshot["bankAccountType"]! as! BankAccountType
          }
          set {
            snapshot.updateValue(newValue, forKey: "bankAccountType")
          }
        }

        internal var authorization: Authorization {
          get {
            return Authorization(snapshot: snapshot["authorization"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "authorization")
          }
        }

        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        internal var institutionName: InstitutionName {
          get {
            return InstitutionName(snapshot: snapshot["institutionName"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "institutionName")
          }
        }

        internal var institutionLogo: InstitutionLogo? {
          get {
            return (snapshot["institutionLogo"] as? Snapshot).flatMap { InstitutionLogo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "institutionLogo")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var bankAccountFundingSource: BankAccountFundingSource {
            get {
              return BankAccountFundingSource(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct TransactionVelocity: GraphQLSelectionSet {
          internal static let possibleTypes = ["TransactionVelocity"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("maximum", type: .scalar(Int.self)),
            GraphQLField("velocity", type: .list(.nonNull(.scalar(String.self)))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(maximum: Int? = nil, velocity: [String]? = nil) {
            self.init(snapshot: ["__typename": "TransactionVelocity", "maximum": maximum, "velocity": velocity])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var maximum: Int? {
            get {
              return snapshot["maximum"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "maximum")
            }
          }

          internal var velocity: [String]? {
            get {
              return snapshot["velocity"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "velocity")
            }
          }
        }

        internal struct Authorization: GraphQLSelectionSet {
          internal static let possibleTypes = ["SignedAuthorizationText"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("language", type: .nonNull(.scalar(String.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("contentType", type: .nonNull(.scalar(String.self))),
            GraphQLField("signature", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("data", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(language: String, content: String, contentType: String, signature: String, keyId: String, algorithm: String, data: String) {
            self.init(snapshot: ["__typename": "SignedAuthorizationText", "language": language, "content": content, "contentType": contentType, "signature": signature, "keyId": keyId, "algorithm": algorithm, "data": data])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var language: String {
            get {
              return snapshot["language"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "language")
            }
          }

          internal var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          internal var contentType: String {
            get {
              return snapshot["contentType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "contentType")
            }
          }

          internal var signature: String {
            get {
              return snapshot["signature"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "signature")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var data: String {
            get {
              return snapshot["data"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "data")
            }
          }
        }

        internal struct InstitutionName: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var plainTextType: String {
            get {
              return snapshot["plainTextType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "plainTextType")
            }
          }

          internal var base64EncodedSealedData: String {
            get {
              return snapshot["base64EncodedSealedData"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAttribute: SealedAttribute {
              get {
                return SealedAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct InstitutionLogo: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var plainTextType: String {
            get {
              return snapshot["plainTextType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "plainTextType")
            }
          }

          internal var base64EncodedSealedData: String {
            get {
              return snapshot["base64EncodedSealedData"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAttribute: SealedAttribute {
              get {
                return SealedAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

internal final class ProvisionVirtualCardMutation: GraphQLMutation {
  internal static let operationString =
    "mutation ProvisionVirtualCard($input: CardProvisionRequest!) {\n  cardProvision(input: $input) {\n    __typename\n    ...ProvisionalCard\n  }\n}"

  internal static var requestString: String { return operationString.appending(ProvisionalCard.fragmentString).appending(SealedCard.fragmentString).appending(Owner.fragmentString).appending(SealedAddressAttribute.fragmentString).appending(SealedExpiryAttribute.fragmentString).appending(SealedAttribute.fragmentString) }

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
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("clientRefId", type: .nonNull(.scalar(String.self))),
        GraphQLField("provisioningState", type: .nonNull(.scalar(ProvisioningState.self))),
        GraphQLField("card", type: .list(.nonNull(.object(Card.selections)))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, clientRefId: String, provisioningState: ProvisioningState, card: [Card]? = nil) {
        self.init(snapshot: ["__typename": "ProvisionalCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "clientRefId": clientRefId, "provisioningState": provisioningState, "card": card.flatMap { $0.map { $0.snapshot } }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      internal var clientRefId: String {
        get {
          return snapshot["clientRefId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "clientRefId")
        }
      }

      internal var provisioningState: ProvisioningState {
        get {
          return snapshot["provisioningState"]! as! ProvisioningState
        }
        set {
          snapshot.updateValue(newValue, forKey: "provisioningState")
        }
      }

      internal var card: [Card]? {
        get {
          return (snapshot["card"] as? [Snapshot]).flatMap { $0.map { Card(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "card")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var provisionalCard: ProvisionalCard {
          get {
            return ProvisionalCard(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      internal struct Card: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCard"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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
          GraphQLField("alias", type: .scalar(String.self)),
          GraphQLField("pan", type: .nonNull(.scalar(String.self))),
          GraphQLField("csc", type: .nonNull(.scalar(String.self))),
          GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
          GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
          GraphQLField("metadata", type: .object(Metadatum.selections)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, metadata: Metadatum? = nil) {
          self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "metadata": metadata.flatMap { $0.snapshot }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        internal var keyRingId: GraphQLID {
          get {
            return snapshot["keyRingId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyRingId")
          }
        }

        internal var owners: [Owner] {
          get {
            return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
          }
        }

        internal var fundingSourceId: GraphQLID {
          get {
            return snapshot["fundingSourceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fundingSourceId")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var state: CardState {
          get {
            return snapshot["state"]! as! CardState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var activeToEpochMs: Double {
          get {
            return snapshot["activeToEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "activeToEpochMs")
          }
        }

        internal var cancelledAtEpochMs: Double? {
          get {
            return snapshot["cancelledAtEpochMs"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
          }
        }

        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        internal var cardHolder: String {
          get {
            return snapshot["cardHolder"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardHolder")
          }
        }

        internal var alias: String? {
          get {
            return snapshot["alias"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "alias")
          }
        }

        internal var pan: String {
          get {
            return snapshot["pan"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pan")
          }
        }

        internal var csc: String {
          get {
            return snapshot["csc"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "csc")
          }
        }

        internal var billingAddress: BillingAddress? {
          get {
            return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
          }
        }

        internal var expiry: Expiry {
          get {
            return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "expiry")
          }
        }

        internal var metadata: Metadatum? {
          get {
            return (snapshot["metadata"] as? Snapshot).flatMap { Metadatum(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "metadata")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedCard: SealedCard {
            get {
              return SealedCard(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct Owner: GraphQLSelectionSet {
          internal static let possibleTypes = ["Owner"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var owner: Owner {
              get {
                return Owner(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct BillingAddress: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAddressAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAddressAttribute: SealedAddressAttribute {
              get {
                return SealedAddressAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct Expiry: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedExpiryAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedExpiryAttribute: SealedExpiryAttribute {
              get {
                return SealedExpiryAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct Metadatum: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var plainTextType: String {
            get {
              return snapshot["plainTextType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "plainTextType")
            }
          }

          internal var base64EncodedSealedData: String {
            get {
              return snapshot["base64EncodedSealedData"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAttribute: SealedAttribute {
              get {
                return SealedAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

internal final class UpdateVirtualCardMutation: GraphQLMutation {
  internal static let operationString =
    "mutation UpdateVirtualCard($input: CardUpdateRequest!) {\n  updateCard(input: $input) {\n    __typename\n    ...SealedCardWithLastTransaction\n  }\n}"

  internal static var requestString: String { return operationString.appending(SealedCardWithLastTransaction.fragmentString).appending(SealedCard.fragmentString).appending(Owner.fragmentString).appending(SealedAddressAttribute.fragmentString).appending(SealedExpiryAttribute.fragmentString).appending(SealedAttribute.fragmentString).appending(SealedTransaction.fragmentString).appending(SealedCurrencyAmountAttribute.fragmentString).appending(SealedTransactionDetailChargeAttribute.fragmentString).appending(SealedMarkupAttribute.fragmentString) }

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
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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
        GraphQLField("alias", type: .scalar(String.self)),
        GraphQLField("pan", type: .nonNull(.scalar(String.self))),
        GraphQLField("csc", type: .nonNull(.scalar(String.self))),
        GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
        GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
        GraphQLField("metadata", type: .object(Metadatum.selections)),
        GraphQLField("lastTransaction", type: .object(LastTransaction.selections)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, metadata: Metadatum? = nil, lastTransaction: LastTransaction? = nil) {
        self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "metadata": metadata.flatMap { $0.snapshot }, "lastTransaction": lastTransaction.flatMap { $0.snapshot }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      internal var keyRingId: GraphQLID {
        get {
          return snapshot["keyRingId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyRingId")
        }
      }

      internal var owners: [Owner] {
        get {
          return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
        }
      }

      internal var fundingSourceId: GraphQLID {
        get {
          return snapshot["fundingSourceId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "fundingSourceId")
        }
      }

      internal var currency: String {
        get {
          return snapshot["currency"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      internal var state: CardState {
        get {
          return snapshot["state"]! as! CardState
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      internal var activeToEpochMs: Double {
        get {
          return snapshot["activeToEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "activeToEpochMs")
        }
      }

      internal var cancelledAtEpochMs: Double? {
        get {
          return snapshot["cancelledAtEpochMs"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
        }
      }

      internal var last4: String {
        get {
          return snapshot["last4"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last4")
        }
      }

      internal var cardHolder: String {
        get {
          return snapshot["cardHolder"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "cardHolder")
        }
      }

      internal var alias: String? {
        get {
          return snapshot["alias"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "alias")
        }
      }

      internal var pan: String {
        get {
          return snapshot["pan"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "pan")
        }
      }

      internal var csc: String {
        get {
          return snapshot["csc"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "csc")
        }
      }

      internal var billingAddress: BillingAddress? {
        get {
          return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
        }
      }

      internal var expiry: Expiry {
        get {
          return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "expiry")
        }
      }

      internal var metadata: Metadatum? {
        get {
          return (snapshot["metadata"] as? Snapshot).flatMap { Metadatum(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "metadata")
        }
      }

      internal var lastTransaction: LastTransaction? {
        get {
          return (snapshot["lastTransaction"] as? Snapshot).flatMap { LastTransaction(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "lastTransaction")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var sealedCardWithLastTransaction: SealedCardWithLastTransaction {
          get {
            return SealedCardWithLastTransaction(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal var sealedCard: SealedCard {
          get {
            return SealedCard(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      internal struct Owner: GraphQLSelectionSet {
        internal static let possibleTypes = ["Owner"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var owner: Owner {
            get {
              return Owner(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct BillingAddress: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedAddressAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedAddressAttribute: SealedAddressAttribute {
            get {
              return SealedAddressAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct Expiry: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedExpiryAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedExpiryAttribute: SealedExpiryAttribute {
            get {
              return SealedExpiryAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct Metadatum: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
          GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
          self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        internal var plainTextType: String {
          get {
            return snapshot["plainTextType"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "plainTextType")
          }
        }

        internal var base64EncodedSealedData: String {
          get {
            return snapshot["base64EncodedSealedData"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedAttribute: SealedAttribute {
            get {
              return SealedAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct LastTransaction: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedTransaction"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("cardId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("sequenceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
          GraphQLField("transactedAtEpochMs", type: .nonNull(.scalar(String.self))),
          GraphQLField("settledAtEpochMs", type: .scalar(String.self)),
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

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
          self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var sortDateEpochMs: Double {
          get {
            return snapshot["sortDateEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "sortDateEpochMs")
          }
        }

        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        internal var cardId: GraphQLID {
          get {
            return snapshot["cardId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardId")
          }
        }

        internal var sequenceId: GraphQLID {
          get {
            return snapshot["sequenceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "sequenceId")
          }
        }

        internal var type: TransactionType {
          get {
            return snapshot["type"]! as! TransactionType
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        internal var transactedAtEpochMs: String {
          get {
            return snapshot["transactedAtEpochMs"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "transactedAtEpochMs")
          }
        }

        internal var settledAtEpochMs: String? {
          get {
            return snapshot["settledAtEpochMs"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "settledAtEpochMs")
          }
        }

        internal var billedAmount: BilledAmount {
          get {
            return BilledAmount(snapshot: snapshot["billedAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "billedAmount")
          }
        }

        internal var transactedAmount: TransactedAmount {
          get {
            return TransactedAmount(snapshot: snapshot["transactedAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "transactedAmount")
          }
        }

        internal var description: String {
          get {
            return snapshot["description"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "description")
          }
        }

        internal var declineReason: String? {
          get {
            return snapshot["declineReason"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "declineReason")
          }
        }

        internal var detail: [Detail]? {
          get {
            return (snapshot["detail"] as? [Snapshot]).flatMap { $0.map { Detail(snapshot: $0) } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "detail")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedTransaction: SealedTransaction {
            get {
              return SealedTransaction(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct BilledAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct TransactedAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct Detail: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedTransactionDetailChargeAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("virtualCardAmount", type: .nonNull(.object(VirtualCardAmount.selections))),
            GraphQLField("markup", type: .nonNull(.object(Markup.selections))),
            GraphQLField("markupAmount", type: .nonNull(.object(MarkupAmount.selections))),
            GraphQLField("fundingSourceAmount", type: .nonNull(.object(FundingSourceAmount.selections))),
            GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("state", type: .scalar(String.self)),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(virtualCardAmount: VirtualCardAmount, markup: Markup, markupAmount: MarkupAmount, fundingSourceAmount: FundingSourceAmount, fundingSourceId: GraphQLID, description: String, state: String? = nil) {
            self.init(snapshot: ["__typename": "SealedTransactionDetailChargeAttribute", "virtualCardAmount": virtualCardAmount.snapshot, "markup": markup.snapshot, "markupAmount": markupAmount.snapshot, "fundingSourceAmount": fundingSourceAmount.snapshot, "fundingSourceId": fundingSourceId, "description": description, "state": state])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var virtualCardAmount: VirtualCardAmount {
            get {
              return VirtualCardAmount(snapshot: snapshot["virtualCardAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "virtualCardAmount")
            }
          }

          internal var markup: Markup {
            get {
              return Markup(snapshot: snapshot["markup"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "markup")
            }
          }

          internal var markupAmount: MarkupAmount {
            get {
              return MarkupAmount(snapshot: snapshot["markupAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "markupAmount")
            }
          }

          internal var fundingSourceAmount: FundingSourceAmount {
            get {
              return FundingSourceAmount(snapshot: snapshot["fundingSourceAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "fundingSourceAmount")
            }
          }

          internal var fundingSourceId: GraphQLID {
            get {
              return snapshot["fundingSourceId"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "fundingSourceId")
            }
          }

          internal var description: String {
            get {
              return snapshot["description"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "description")
            }
          }

          internal var state: String? {
            get {
              return snapshot["state"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedTransactionDetailChargeAttribute: SealedTransactionDetailChargeAttribute {
              get {
                return SealedTransactionDetailChargeAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          internal struct VirtualCardAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct Markup: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedMarkupAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var percent: String {
              get {
                return snapshot["percent"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "percent")
              }
            }

            internal var flat: String {
              get {
                return snapshot["flat"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "flat")
              }
            }

            internal var minCharge: String? {
              get {
                return snapshot["minCharge"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "minCharge")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedMarkupAttribute: SealedMarkupAttribute {
                get {
                  return SealedMarkupAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct MarkupAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct FundingSourceAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }
        }
      }
    }
  }
}

internal final class CancelVirtualCardMutation: GraphQLMutation {
  internal static let operationString =
    "mutation CancelVirtualCard($input: CardCancelRequest!) {\n  cancelCard(input: $input) {\n    __typename\n    ...SealedCardWithLastTransaction\n  }\n}"

  internal static var requestString: String { return operationString.appending(SealedCardWithLastTransaction.fragmentString).appending(SealedCard.fragmentString).appending(Owner.fragmentString).appending(SealedAddressAttribute.fragmentString).appending(SealedExpiryAttribute.fragmentString).appending(SealedAttribute.fragmentString).appending(SealedTransaction.fragmentString).appending(SealedCurrencyAmountAttribute.fragmentString).appending(SealedTransactionDetailChargeAttribute.fragmentString).appending(SealedMarkupAttribute.fragmentString) }

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
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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
        GraphQLField("alias", type: .scalar(String.self)),
        GraphQLField("pan", type: .nonNull(.scalar(String.self))),
        GraphQLField("csc", type: .nonNull(.scalar(String.self))),
        GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
        GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
        GraphQLField("metadata", type: .object(Metadatum.selections)),
        GraphQLField("lastTransaction", type: .object(LastTransaction.selections)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, metadata: Metadatum? = nil, lastTransaction: LastTransaction? = nil) {
        self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "metadata": metadata.flatMap { $0.snapshot }, "lastTransaction": lastTransaction.flatMap { $0.snapshot }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      internal var keyRingId: GraphQLID {
        get {
          return snapshot["keyRingId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyRingId")
        }
      }

      internal var owners: [Owner] {
        get {
          return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
        }
      }

      internal var fundingSourceId: GraphQLID {
        get {
          return snapshot["fundingSourceId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "fundingSourceId")
        }
      }

      internal var currency: String {
        get {
          return snapshot["currency"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      internal var state: CardState {
        get {
          return snapshot["state"]! as! CardState
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      internal var activeToEpochMs: Double {
        get {
          return snapshot["activeToEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "activeToEpochMs")
        }
      }

      internal var cancelledAtEpochMs: Double? {
        get {
          return snapshot["cancelledAtEpochMs"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
        }
      }

      internal var last4: String {
        get {
          return snapshot["last4"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last4")
        }
      }

      internal var cardHolder: String {
        get {
          return snapshot["cardHolder"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "cardHolder")
        }
      }

      internal var alias: String? {
        get {
          return snapshot["alias"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "alias")
        }
      }

      internal var pan: String {
        get {
          return snapshot["pan"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "pan")
        }
      }

      internal var csc: String {
        get {
          return snapshot["csc"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "csc")
        }
      }

      internal var billingAddress: BillingAddress? {
        get {
          return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
        }
      }

      internal var expiry: Expiry {
        get {
          return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "expiry")
        }
      }

      internal var metadata: Metadatum? {
        get {
          return (snapshot["metadata"] as? Snapshot).flatMap { Metadatum(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "metadata")
        }
      }

      internal var lastTransaction: LastTransaction? {
        get {
          return (snapshot["lastTransaction"] as? Snapshot).flatMap { LastTransaction(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "lastTransaction")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var sealedCardWithLastTransaction: SealedCardWithLastTransaction {
          get {
            return SealedCardWithLastTransaction(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal var sealedCard: SealedCard {
          get {
            return SealedCard(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      internal struct Owner: GraphQLSelectionSet {
        internal static let possibleTypes = ["Owner"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var owner: Owner {
            get {
              return Owner(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct BillingAddress: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedAddressAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedAddressAttribute: SealedAddressAttribute {
            get {
              return SealedAddressAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct Expiry: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedExpiryAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedExpiryAttribute: SealedExpiryAttribute {
            get {
              return SealedExpiryAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct Metadatum: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
          GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
          self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        internal var plainTextType: String {
          get {
            return snapshot["plainTextType"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "plainTextType")
          }
        }

        internal var base64EncodedSealedData: String {
          get {
            return snapshot["base64EncodedSealedData"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedAttribute: SealedAttribute {
            get {
              return SealedAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct LastTransaction: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedTransaction"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("cardId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("sequenceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
          GraphQLField("transactedAtEpochMs", type: .nonNull(.scalar(String.self))),
          GraphQLField("settledAtEpochMs", type: .scalar(String.self)),
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

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
          self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var sortDateEpochMs: Double {
          get {
            return snapshot["sortDateEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "sortDateEpochMs")
          }
        }

        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        internal var cardId: GraphQLID {
          get {
            return snapshot["cardId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardId")
          }
        }

        internal var sequenceId: GraphQLID {
          get {
            return snapshot["sequenceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "sequenceId")
          }
        }

        internal var type: TransactionType {
          get {
            return snapshot["type"]! as! TransactionType
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        internal var transactedAtEpochMs: String {
          get {
            return snapshot["transactedAtEpochMs"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "transactedAtEpochMs")
          }
        }

        internal var settledAtEpochMs: String? {
          get {
            return snapshot["settledAtEpochMs"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "settledAtEpochMs")
          }
        }

        internal var billedAmount: BilledAmount {
          get {
            return BilledAmount(snapshot: snapshot["billedAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "billedAmount")
          }
        }

        internal var transactedAmount: TransactedAmount {
          get {
            return TransactedAmount(snapshot: snapshot["transactedAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "transactedAmount")
          }
        }

        internal var description: String {
          get {
            return snapshot["description"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "description")
          }
        }

        internal var declineReason: String? {
          get {
            return snapshot["declineReason"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "declineReason")
          }
        }

        internal var detail: [Detail]? {
          get {
            return (snapshot["detail"] as? [Snapshot]).flatMap { $0.map { Detail(snapshot: $0) } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "detail")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedTransaction: SealedTransaction {
            get {
              return SealedTransaction(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct BilledAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct TransactedAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct Detail: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedTransactionDetailChargeAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("virtualCardAmount", type: .nonNull(.object(VirtualCardAmount.selections))),
            GraphQLField("markup", type: .nonNull(.object(Markup.selections))),
            GraphQLField("markupAmount", type: .nonNull(.object(MarkupAmount.selections))),
            GraphQLField("fundingSourceAmount", type: .nonNull(.object(FundingSourceAmount.selections))),
            GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("state", type: .scalar(String.self)),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(virtualCardAmount: VirtualCardAmount, markup: Markup, markupAmount: MarkupAmount, fundingSourceAmount: FundingSourceAmount, fundingSourceId: GraphQLID, description: String, state: String? = nil) {
            self.init(snapshot: ["__typename": "SealedTransactionDetailChargeAttribute", "virtualCardAmount": virtualCardAmount.snapshot, "markup": markup.snapshot, "markupAmount": markupAmount.snapshot, "fundingSourceAmount": fundingSourceAmount.snapshot, "fundingSourceId": fundingSourceId, "description": description, "state": state])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var virtualCardAmount: VirtualCardAmount {
            get {
              return VirtualCardAmount(snapshot: snapshot["virtualCardAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "virtualCardAmount")
            }
          }

          internal var markup: Markup {
            get {
              return Markup(snapshot: snapshot["markup"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "markup")
            }
          }

          internal var markupAmount: MarkupAmount {
            get {
              return MarkupAmount(snapshot: snapshot["markupAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "markupAmount")
            }
          }

          internal var fundingSourceAmount: FundingSourceAmount {
            get {
              return FundingSourceAmount(snapshot: snapshot["fundingSourceAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "fundingSourceAmount")
            }
          }

          internal var fundingSourceId: GraphQLID {
            get {
              return snapshot["fundingSourceId"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "fundingSourceId")
            }
          }

          internal var description: String {
            get {
              return snapshot["description"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "description")
            }
          }

          internal var state: String? {
            get {
              return snapshot["state"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedTransactionDetailChargeAttribute: SealedTransactionDetailChargeAttribute {
              get {
                return SealedTransactionDetailChargeAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          internal struct VirtualCardAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct Markup: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedMarkupAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var percent: String {
              get {
                return snapshot["percent"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "percent")
              }
            }

            internal var flat: String {
              get {
                return snapshot["flat"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "flat")
              }
            }

            internal var minCharge: String? {
              get {
                return snapshot["minCharge"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "minCharge")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedMarkupAttribute: SealedMarkupAttribute {
                get {
                  return SealedMarkupAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct MarkupAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct FundingSourceAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }
        }
      }
    }
  }
}

internal final class SandboxSetFundingSourceToRequireRefreshMutation: GraphQLMutation {
  internal static let operationString =
    "mutation SandboxSetFundingSourceToRequireRefresh($input: SandboxSetFundingSourceToRequireRefreshRequest!) {\n  sandboxSetFundingSourceToRequireRefresh(input: $input) {\n    __typename\n    ... on CreditCardFundingSource {\n      ...CreditCardFundingSource\n    }\n    ... on BankAccountFundingSource {\n      ...BankAccountFundingSource\n    }\n  }\n}"

  internal static var requestString: String { return operationString.appending(CreditCardFundingSource.fragmentString).appending(BankAccountFundingSource.fragmentString).appending(SealedAttribute.fragmentString) }

  internal var input: SandboxSetFundingSourceToRequireRefreshRequest

  internal init(input: SandboxSetFundingSourceToRequireRefreshRequest) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("sandboxSetFundingSourceToRequireRefresh", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(SandboxSetFundingSourceToRequireRefresh.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(sandboxSetFundingSourceToRequireRefresh: SandboxSetFundingSourceToRequireRefresh) {
      self.init(snapshot: ["__typename": "Mutation", "sandboxSetFundingSourceToRequireRefresh": sandboxSetFundingSourceToRequireRefresh.snapshot])
    }

    /// Sets a funding source to state requiring refresh.
    /// Allows testing without requiring occurrence of specific
    /// event that would require refresh.
    /// 
    /// SANDBOX ONLY
    internal var sandboxSetFundingSourceToRequireRefresh: SandboxSetFundingSourceToRequireRefresh {
      get {
        return SandboxSetFundingSourceToRequireRefresh(snapshot: snapshot["sandboxSetFundingSourceToRequireRefresh"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "sandboxSetFundingSourceToRequireRefresh")
      }
    }

    internal struct SandboxSetFundingSourceToRequireRefresh: GraphQLSelectionSet {
      internal static let possibleTypes = ["BankAccountFundingSource", "CreditCardFundingSource"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLTypeCase(
          variants: ["CreditCardFundingSource": AsCreditCardFundingSource.selections, "BankAccountFundingSource": AsBankAccountFundingSource.selections],
          default: [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          ]
        )
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal static func makeCreditCardFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: AsCreditCardFundingSource.TransactionVelocity? = nil, last4: String, network: CreditCardNetwork, cardType: CardType) -> SandboxSetFundingSourceToRequireRefresh {
        return SandboxSetFundingSourceToRequireRefresh(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "last4": last4, "network": network, "cardType": cardType])
      }

      internal static func makeBankAccountFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: AsBankAccountFundingSource.TransactionVelocity? = nil, bankAccountType: BankAccountType, authorization: AsBankAccountFundingSource.Authorization, last4: String, institutionName: AsBankAccountFundingSource.InstitutionName, institutionLogo: AsBankAccountFundingSource.InstitutionLogo? = nil) -> SandboxSetFundingSourceToRequireRefresh {
        return SandboxSetFundingSourceToRequireRefresh(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "bankAccountType": bankAccountType, "authorization": authorization.snapshot, "last4": last4, "institutionName": institutionName.snapshot, "institutionLogo": institutionLogo.flatMap { $0.snapshot }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var asCreditCardFundingSource: AsCreditCardFundingSource? {
        get {
          if !AsCreditCardFundingSource.possibleTypes.contains(__typename) { return nil }
          return AsCreditCardFundingSource(snapshot: snapshot)
        }
        set {
          guard let newValue = newValue else { return }
          snapshot = newValue.snapshot
        }
      }

      internal struct AsCreditCardFundingSource: GraphQLSelectionSet {
        internal static let possibleTypes = ["CreditCardFundingSource"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("transactionVelocity", type: .object(TransactionVelocity.selections)),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("network", type: .nonNull(.scalar(CreditCardNetwork.self))),
          GraphQLField("cardType", type: .nonNull(.scalar(CardType.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: TransactionVelocity? = nil, last4: String, network: CreditCardNetwork, cardType: CardType) {
          self.init(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "last4": last4, "network": network, "cardType": cardType])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var state: FundingSourceState {
          get {
            return snapshot["state"]! as! FundingSourceState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var transactionVelocity: TransactionVelocity? {
          get {
            return (snapshot["transactionVelocity"] as? Snapshot).flatMap { TransactionVelocity(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "transactionVelocity")
          }
        }

        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        internal var network: CreditCardNetwork {
          get {
            return snapshot["network"]! as! CreditCardNetwork
          }
          set {
            snapshot.updateValue(newValue, forKey: "network")
          }
        }

        internal var cardType: CardType {
          get {
            return snapshot["cardType"]! as! CardType
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardType")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var creditCardFundingSource: CreditCardFundingSource {
            get {
              return CreditCardFundingSource(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct TransactionVelocity: GraphQLSelectionSet {
          internal static let possibleTypes = ["TransactionVelocity"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("maximum", type: .scalar(Int.self)),
            GraphQLField("velocity", type: .list(.nonNull(.scalar(String.self)))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(maximum: Int? = nil, velocity: [String]? = nil) {
            self.init(snapshot: ["__typename": "TransactionVelocity", "maximum": maximum, "velocity": velocity])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var maximum: Int? {
            get {
              return snapshot["maximum"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "maximum")
            }
          }

          internal var velocity: [String]? {
            get {
              return snapshot["velocity"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "velocity")
            }
          }
        }
      }

      internal var asBankAccountFundingSource: AsBankAccountFundingSource? {
        get {
          if !AsBankAccountFundingSource.possibleTypes.contains(__typename) { return nil }
          return AsBankAccountFundingSource(snapshot: snapshot)
        }
        set {
          guard let newValue = newValue else { return }
          snapshot = newValue.snapshot
        }
      }

      internal struct AsBankAccountFundingSource: GraphQLSelectionSet {
        internal static let possibleTypes = ["BankAccountFundingSource"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("transactionVelocity", type: .object(TransactionVelocity.selections)),
          GraphQLField("bankAccountType", type: .nonNull(.scalar(BankAccountType.self))),
          GraphQLField("authorization", type: .nonNull(.object(Authorization.selections))),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("institutionName", type: .nonNull(.object(InstitutionName.selections))),
          GraphQLField("institutionLogo", type: .object(InstitutionLogo.selections)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: TransactionVelocity? = nil, bankAccountType: BankAccountType, authorization: Authorization, last4: String, institutionName: InstitutionName, institutionLogo: InstitutionLogo? = nil) {
          self.init(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "bankAccountType": bankAccountType, "authorization": authorization.snapshot, "last4": last4, "institutionName": institutionName.snapshot, "institutionLogo": institutionLogo.flatMap { $0.snapshot }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var state: FundingSourceState {
          get {
            return snapshot["state"]! as! FundingSourceState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var transactionVelocity: TransactionVelocity? {
          get {
            return (snapshot["transactionVelocity"] as? Snapshot).flatMap { TransactionVelocity(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "transactionVelocity")
          }
        }

        internal var bankAccountType: BankAccountType {
          get {
            return snapshot["bankAccountType"]! as! BankAccountType
          }
          set {
            snapshot.updateValue(newValue, forKey: "bankAccountType")
          }
        }

        internal var authorization: Authorization {
          get {
            return Authorization(snapshot: snapshot["authorization"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "authorization")
          }
        }

        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        internal var institutionName: InstitutionName {
          get {
            return InstitutionName(snapshot: snapshot["institutionName"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "institutionName")
          }
        }

        internal var institutionLogo: InstitutionLogo? {
          get {
            return (snapshot["institutionLogo"] as? Snapshot).flatMap { InstitutionLogo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "institutionLogo")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var bankAccountFundingSource: BankAccountFundingSource {
            get {
              return BankAccountFundingSource(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct TransactionVelocity: GraphQLSelectionSet {
          internal static let possibleTypes = ["TransactionVelocity"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("maximum", type: .scalar(Int.self)),
            GraphQLField("velocity", type: .list(.nonNull(.scalar(String.self)))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(maximum: Int? = nil, velocity: [String]? = nil) {
            self.init(snapshot: ["__typename": "TransactionVelocity", "maximum": maximum, "velocity": velocity])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var maximum: Int? {
            get {
              return snapshot["maximum"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "maximum")
            }
          }

          internal var velocity: [String]? {
            get {
              return snapshot["velocity"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "velocity")
            }
          }
        }

        internal struct Authorization: GraphQLSelectionSet {
          internal static let possibleTypes = ["SignedAuthorizationText"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("language", type: .nonNull(.scalar(String.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("contentType", type: .nonNull(.scalar(String.self))),
            GraphQLField("signature", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("data", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(language: String, content: String, contentType: String, signature: String, keyId: String, algorithm: String, data: String) {
            self.init(snapshot: ["__typename": "SignedAuthorizationText", "language": language, "content": content, "contentType": contentType, "signature": signature, "keyId": keyId, "algorithm": algorithm, "data": data])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var language: String {
            get {
              return snapshot["language"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "language")
            }
          }

          internal var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          internal var contentType: String {
            get {
              return snapshot["contentType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "contentType")
            }
          }

          internal var signature: String {
            get {
              return snapshot["signature"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "signature")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var data: String {
            get {
              return snapshot["data"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "data")
            }
          }
        }

        internal struct InstitutionName: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var plainTextType: String {
            get {
              return snapshot["plainTextType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "plainTextType")
            }
          }

          internal var base64EncodedSealedData: String {
            get {
              return snapshot["base64EncodedSealedData"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAttribute: SealedAttribute {
              get {
                return SealedAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct InstitutionLogo: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var plainTextType: String {
            get {
              return snapshot["plainTextType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "plainTextType")
            }
          }

          internal var base64EncodedSealedData: String {
            get {
              return snapshot["base64EncodedSealedData"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAttribute: SealedAttribute {
              get {
                return SealedAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

internal final class GetVirtualCardsConfigQuery: GraphQLQuery {
  internal static let operationString =
    "query GetVirtualCardsConfig {\n  getVirtualCardsConfig {\n    __typename\n    ...VirtualCardsConfig\n  }\n}"

  internal static var requestString: String { return operationString.appending(VirtualCardsConfig.fragmentString).appending(FundingSourceSupportInfo.fragmentString).appending(FundingSourceSupportDetail.fragmentString) }

  internal init() {
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("getVirtualCardsConfig", type: .nonNull(.object(GetVirtualCardsConfig.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(getVirtualCardsConfig: GetVirtualCardsConfig) {
      self.init(snapshot: ["__typename": "Query", "getVirtualCardsConfig": getVirtualCardsConfig.snapshot])
    }

    internal var getVirtualCardsConfig: GetVirtualCardsConfig {
      get {
        return GetVirtualCardsConfig(snapshot: snapshot["getVirtualCardsConfig"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "getVirtualCardsConfig")
      }
    }

    internal struct GetVirtualCardsConfig: GraphQLSelectionSet {
      internal static let possibleTypes = ["VirtualCardsConfig"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("maxFundingSourceVelocity", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
        GraphQLField("maxFundingSourceFailureVelocity", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
        GraphQLField("maxCardCreationVelocity", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
        GraphQLField("maxTransactionVelocity", type: .nonNull(.list(.nonNull(.object(MaxTransactionVelocity.selections))))),
        GraphQLField("maxTransactionAmount", type: .nonNull(.list(.nonNull(.object(MaxTransactionAmount.selections))))),
        GraphQLField("virtualCardCurrencies", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
        GraphQLField("fundingSourceSupportInfo", type: .nonNull(.list(.nonNull(.object(FundingSourceSupportInfo.selections))))),
        GraphQLField("bankAccountFundingSourceExpendableEnabled", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("bankAccountFundingSourceCreationEnabled", type: .scalar(Bool.self)),
        GraphQLField("fundingSourceClientConfiguration", type: .object(FundingSourceClientConfiguration.selections)),
        GraphQLField("clientApplicationsConfiguration", type: .object(ClientApplicationsConfiguration.selections)),
        GraphQLField("pricingPolicy", type: .object(PricingPolicy.selections)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(maxFundingSourceVelocity: [String], maxFundingSourceFailureVelocity: [String], maxCardCreationVelocity: [String], maxTransactionVelocity: [MaxTransactionVelocity], maxTransactionAmount: [MaxTransactionAmount], virtualCardCurrencies: [String], fundingSourceSupportInfo: [FundingSourceSupportInfo], bankAccountFundingSourceExpendableEnabled: Bool, bankAccountFundingSourceCreationEnabled: Bool? = nil, fundingSourceClientConfiguration: FundingSourceClientConfiguration? = nil, clientApplicationsConfiguration: ClientApplicationsConfiguration? = nil, pricingPolicy: PricingPolicy? = nil) {
        self.init(snapshot: ["__typename": "VirtualCardsConfig", "maxFundingSourceVelocity": maxFundingSourceVelocity, "maxFundingSourceFailureVelocity": maxFundingSourceFailureVelocity, "maxCardCreationVelocity": maxCardCreationVelocity, "maxTransactionVelocity": maxTransactionVelocity.map { $0.snapshot }, "maxTransactionAmount": maxTransactionAmount.map { $0.snapshot }, "virtualCardCurrencies": virtualCardCurrencies, "fundingSourceSupportInfo": fundingSourceSupportInfo.map { $0.snapshot }, "bankAccountFundingSourceExpendableEnabled": bankAccountFundingSourceExpendableEnabled, "bankAccountFundingSourceCreationEnabled": bankAccountFundingSourceCreationEnabled, "fundingSourceClientConfiguration": fundingSourceClientConfiguration.flatMap { $0.snapshot }, "clientApplicationsConfiguration": clientApplicationsConfiguration.flatMap { $0.snapshot }, "pricingPolicy": pricingPolicy.flatMap { $0.snapshot }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var maxFundingSourceVelocity: [String] {
        get {
          return snapshot["maxFundingSourceVelocity"]! as! [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "maxFundingSourceVelocity")
        }
      }

      internal var maxFundingSourceFailureVelocity: [String] {
        get {
          return snapshot["maxFundingSourceFailureVelocity"]! as! [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "maxFundingSourceFailureVelocity")
        }
      }

      internal var maxCardCreationVelocity: [String] {
        get {
          return snapshot["maxCardCreationVelocity"]! as! [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "maxCardCreationVelocity")
        }
      }

      internal var maxTransactionVelocity: [MaxTransactionVelocity] {
        get {
          return (snapshot["maxTransactionVelocity"] as! [Snapshot]).map { MaxTransactionVelocity(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "maxTransactionVelocity")
        }
      }

      internal var maxTransactionAmount: [MaxTransactionAmount] {
        get {
          return (snapshot["maxTransactionAmount"] as! [Snapshot]).map { MaxTransactionAmount(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "maxTransactionAmount")
        }
      }

      internal var virtualCardCurrencies: [String] {
        get {
          return snapshot["virtualCardCurrencies"]! as! [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "virtualCardCurrencies")
        }
      }

      internal var fundingSourceSupportInfo: [FundingSourceSupportInfo] {
        get {
          return (snapshot["fundingSourceSupportInfo"] as! [Snapshot]).map { FundingSourceSupportInfo(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "fundingSourceSupportInfo")
        }
      }

      internal var bankAccountFundingSourceExpendableEnabled: Bool {
        get {
          return snapshot["bankAccountFundingSourceExpendableEnabled"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "bankAccountFundingSourceExpendableEnabled")
        }
      }

      internal var bankAccountFundingSourceCreationEnabled: Bool? {
        get {
          return snapshot["bankAccountFundingSourceCreationEnabled"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "bankAccountFundingSourceCreationEnabled")
        }
      }

      internal var fundingSourceClientConfiguration: FundingSourceClientConfiguration? {
        get {
          return (snapshot["fundingSourceClientConfiguration"] as? Snapshot).flatMap { FundingSourceClientConfiguration(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "fundingSourceClientConfiguration")
        }
      }

      internal var clientApplicationsConfiguration: ClientApplicationsConfiguration? {
        get {
          return (snapshot["clientApplicationsConfiguration"] as? Snapshot).flatMap { ClientApplicationsConfiguration(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "clientApplicationsConfiguration")
        }
      }

      internal var pricingPolicy: PricingPolicy? {
        get {
          return (snapshot["pricingPolicy"] as? Snapshot).flatMap { PricingPolicy(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "pricingPolicy")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var virtualCardsConfig: VirtualCardsConfig {
          get {
            return VirtualCardsConfig(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      internal struct MaxTransactionVelocity: GraphQLSelectionSet {
        internal static let possibleTypes = ["CurrencyVelocity"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("velocity", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(currency: String, velocity: [String]) {
          self.init(snapshot: ["__typename": "CurrencyVelocity", "currency": currency, "velocity": velocity])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var velocity: [String] {
          get {
            return snapshot["velocity"]! as! [String]
          }
          set {
            snapshot.updateValue(newValue, forKey: "velocity")
          }
        }
      }

      internal struct MaxTransactionAmount: GraphQLSelectionSet {
        internal static let possibleTypes = ["CurrencyAmount"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(currency: String, amount: Int) {
          self.init(snapshot: ["__typename": "CurrencyAmount", "currency": currency, "amount": amount])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var amount: Int {
          get {
            return snapshot["amount"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "amount")
          }
        }
      }

      internal struct FundingSourceSupportInfo: GraphQLSelectionSet {
        internal static let possibleTypes = ["FundingSourceSupportInfo"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("providerType", type: .nonNull(.scalar(String.self))),
          GraphQLField("fundingSourceType", type: .nonNull(.scalar(String.self))),
          GraphQLField("network", type: .nonNull(.scalar(String.self))),
          GraphQLField("detail", type: .nonNull(.list(.nonNull(.object(Detail.selections))))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(providerType: String, fundingSourceType: String, network: String, detail: [Detail]) {
          self.init(snapshot: ["__typename": "FundingSourceSupportInfo", "providerType": providerType, "fundingSourceType": fundingSourceType, "network": network, "detail": detail.map { $0.snapshot }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var providerType: String {
          get {
            return snapshot["providerType"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "providerType")
          }
        }

        internal var fundingSourceType: String {
          get {
            return snapshot["fundingSourceType"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "fundingSourceType")
          }
        }

        internal var network: String {
          get {
            return snapshot["network"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "network")
          }
        }

        internal var detail: [Detail] {
          get {
            return (snapshot["detail"] as! [Snapshot]).map { Detail(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "detail")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var fundingSourceSupportInfo: FundingSourceSupportInfo {
            get {
              return FundingSourceSupportInfo(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct Detail: GraphQLSelectionSet {
          internal static let possibleTypes = ["FundingSourceSupportDetail"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("cardType", type: .nonNull(.scalar(CardType.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(cardType: CardType) {
            self.init(snapshot: ["__typename": "FundingSourceSupportDetail", "cardType": cardType])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var cardType: CardType {
            get {
              return snapshot["cardType"]! as! CardType
            }
            set {
              snapshot.updateValue(newValue, forKey: "cardType")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var fundingSourceSupportDetail: FundingSourceSupportDetail {
              get {
                return FundingSourceSupportDetail(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      internal struct FundingSourceClientConfiguration: GraphQLSelectionSet {
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

        internal var data: GraphQLID {
          get {
            return snapshot["data"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "data")
          }
        }
      }

      internal struct ClientApplicationsConfiguration: GraphQLSelectionSet {
        internal static let possibleTypes = ["VirtualCardApplicationsConfiguration"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("data", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(data: GraphQLID) {
          self.init(snapshot: ["__typename": "VirtualCardApplicationsConfiguration", "data": data])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var data: GraphQLID {
          get {
            return snapshot["data"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "data")
          }
        }
      }

      internal struct PricingPolicy: GraphQLSelectionSet {
        internal static let possibleTypes = ["VirtualCardPricingPolicy"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("data", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(data: GraphQLID) {
          self.init(snapshot: ["__typename": "VirtualCardPricingPolicy", "data": data])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

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
}

internal final class GetPublicKeyQuery: GraphQLQuery {
  internal static let operationString =
    "query GetPublicKey($keyId: String!, $keyFormats: [KeyFormat!]) {\n  getPublicKeyForVirtualCards(keyId: $keyId, keyFormats: $keyFormats) {\n    __typename\n    ...PublicKey\n  }\n}"

  internal static var requestString: String { return operationString.appending(PublicKey.fragmentString) }

  internal var keyId: String
  internal var keyFormats: [KeyFormat]?

  internal init(keyId: String, keyFormats: [KeyFormat]?) {
    self.keyId = keyId
    self.keyFormats = keyFormats
  }

  internal var variables: GraphQLMap? {
    return ["keyId": keyId, "keyFormats": keyFormats]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("getPublicKeyForVirtualCards", arguments: ["keyId": GraphQLVariable("keyId"), "keyFormats": GraphQLVariable("keyFormats")], type: .object(GetPublicKeyForVirtualCard.selections)),
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
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyRingId", type: .nonNull(.scalar(String.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyFormat", type: .scalar(KeyFormat.self)),
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

      internal init(id: GraphQLID, keyId: String, keyRingId: String, algorithm: String, keyFormat: KeyFormat? = nil, publicKey: String, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double) {
        self.init(snapshot: ["__typename": "PublicKey", "id": id, "keyId": keyId, "keyRingId": keyRingId, "algorithm": algorithm, "keyFormat": keyFormat, "publicKey": publicKey, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      internal var keyRingId: String {
        get {
          return snapshot["keyRingId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyRingId")
        }
      }

      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      internal var keyFormat: KeyFormat? {
        get {
          return snapshot["keyFormat"] as? KeyFormat
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyFormat")
        }
      }

      internal var publicKey: String {
        get {
          return snapshot["publicKey"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "publicKey")
        }
      }

      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var publicKey: PublicKey {
          get {
            return PublicKey(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

internal final class GetPublicKeysQuery: GraphQLQuery {
  internal static let operationString =
    "query GetPublicKeys($limit: Int, $nextToken: String) {\n  getPublicKeysForVirtualCards(limit: $limit, nextToken: $nextToken) {\n    __typename\n    ...PaginatedPublicKey\n  }\n}"

  internal static var requestString: String { return operationString.appending(PaginatedPublicKey.fragmentString).appending(PublicKey.fragmentString) }

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

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var paginatedPublicKey: PaginatedPublicKey {
          get {
            return PaginatedPublicKey(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      internal struct Item: GraphQLSelectionSet {
        internal static let possibleTypes = ["PublicKey"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyRingId", type: .nonNull(.scalar(String.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyFormat", type: .scalar(KeyFormat.self)),
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

        internal init(id: GraphQLID, keyId: String, keyRingId: String, algorithm: String, keyFormat: KeyFormat? = nil, publicKey: String, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double) {
          self.init(snapshot: ["__typename": "PublicKey", "id": id, "keyId": keyId, "keyRingId": keyRingId, "algorithm": algorithm, "keyFormat": keyFormat, "publicKey": publicKey, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        internal var keyRingId: String {
          get {
            return snapshot["keyRingId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyRingId")
          }
        }

        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        internal var keyFormat: KeyFormat? {
          get {
            return snapshot["keyFormat"] as? KeyFormat
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyFormat")
          }
        }

        internal var publicKey: String {
          get {
            return snapshot["publicKey"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "publicKey")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var publicKey: PublicKey {
            get {
              return PublicKey(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

internal final class GetKeyRingQuery: GraphQLQuery {
  internal static let operationString =
    "query GetKeyRing($keyRingId: String!, $limit: Int, $nextToken: String, $keyFormats: [KeyFormat!]) {\n  getKeyRingForVirtualCards(keyRingId: $keyRingId, limit: $limit, nextToken: $nextToken, keyFormats: $keyFormats) {\n    __typename\n    ...PaginatedPublicKey\n  }\n}"

  internal static var requestString: String { return operationString.appending(PaginatedPublicKey.fragmentString).appending(PublicKey.fragmentString) }

  internal var keyRingId: String
  internal var limit: Int?
  internal var nextToken: String?
  internal var keyFormats: [KeyFormat]?

  internal init(keyRingId: String, limit: Int? = nil, nextToken: String? = nil, keyFormats: [KeyFormat]?) {
    self.keyRingId = keyRingId
    self.limit = limit
    self.nextToken = nextToken
    self.keyFormats = keyFormats
  }

  internal var variables: GraphQLMap? {
    return ["keyRingId": keyRingId, "limit": limit, "nextToken": nextToken, "keyFormats": keyFormats]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("getKeyRingForVirtualCards", arguments: ["keyRingId": GraphQLVariable("keyRingId"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken"), "keyFormats": GraphQLVariable("keyFormats")], type: .nonNull(.object(GetKeyRingForVirtualCard.selections))),
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

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var paginatedPublicKey: PaginatedPublicKey {
          get {
            return PaginatedPublicKey(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      internal struct Item: GraphQLSelectionSet {
        internal static let possibleTypes = ["PublicKey"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyRingId", type: .nonNull(.scalar(String.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyFormat", type: .scalar(KeyFormat.self)),
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

        internal init(id: GraphQLID, keyId: String, keyRingId: String, algorithm: String, keyFormat: KeyFormat? = nil, publicKey: String, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double) {
          self.init(snapshot: ["__typename": "PublicKey", "id": id, "keyId": keyId, "keyRingId": keyRingId, "algorithm": algorithm, "keyFormat": keyFormat, "publicKey": publicKey, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        internal var keyRingId: String {
          get {
            return snapshot["keyRingId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyRingId")
          }
        }

        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        internal var keyFormat: KeyFormat? {
          get {
            return snapshot["keyFormat"] as? KeyFormat
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyFormat")
          }
        }

        internal var publicKey: String {
          get {
            return snapshot["publicKey"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "publicKey")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var publicKey: PublicKey {
            get {
              return PublicKey(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
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
    "query GetFundingSource($id: ID!) {\n  getFundingSource(id: $id) {\n    __typename\n    ... on CreditCardFundingSource {\n      ...CreditCardFundingSource\n    }\n    ... on BankAccountFundingSource {\n      ...BankAccountFundingSource\n    }\n  }\n}"

  internal static var requestString: String { return operationString.appending(CreditCardFundingSource.fragmentString).appending(BankAccountFundingSource.fragmentString).appending(SealedAttribute.fragmentString) }

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
      internal static let possibleTypes = ["BankAccountFundingSource", "CreditCardFundingSource"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLTypeCase(
          variants: ["CreditCardFundingSource": AsCreditCardFundingSource.selections, "BankAccountFundingSource": AsBankAccountFundingSource.selections],
          default: [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          ]
        )
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal static func makeCreditCardFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: AsCreditCardFundingSource.TransactionVelocity? = nil, last4: String, network: CreditCardNetwork, cardType: CardType) -> GetFundingSource {
        return GetFundingSource(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "last4": last4, "network": network, "cardType": cardType])
      }

      internal static func makeBankAccountFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: AsBankAccountFundingSource.TransactionVelocity? = nil, bankAccountType: BankAccountType, authorization: AsBankAccountFundingSource.Authorization, last4: String, institutionName: AsBankAccountFundingSource.InstitutionName, institutionLogo: AsBankAccountFundingSource.InstitutionLogo? = nil) -> GetFundingSource {
        return GetFundingSource(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "bankAccountType": bankAccountType, "authorization": authorization.snapshot, "last4": last4, "institutionName": institutionName.snapshot, "institutionLogo": institutionLogo.flatMap { $0.snapshot }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var asCreditCardFundingSource: AsCreditCardFundingSource? {
        get {
          if !AsCreditCardFundingSource.possibleTypes.contains(__typename) { return nil }
          return AsCreditCardFundingSource(snapshot: snapshot)
        }
        set {
          guard let newValue = newValue else { return }
          snapshot = newValue.snapshot
        }
      }

      internal struct AsCreditCardFundingSource: GraphQLSelectionSet {
        internal static let possibleTypes = ["CreditCardFundingSource"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("transactionVelocity", type: .object(TransactionVelocity.selections)),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("network", type: .nonNull(.scalar(CreditCardNetwork.self))),
          GraphQLField("cardType", type: .nonNull(.scalar(CardType.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: TransactionVelocity? = nil, last4: String, network: CreditCardNetwork, cardType: CardType) {
          self.init(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "last4": last4, "network": network, "cardType": cardType])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var state: FundingSourceState {
          get {
            return snapshot["state"]! as! FundingSourceState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var transactionVelocity: TransactionVelocity? {
          get {
            return (snapshot["transactionVelocity"] as? Snapshot).flatMap { TransactionVelocity(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "transactionVelocity")
          }
        }

        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        internal var network: CreditCardNetwork {
          get {
            return snapshot["network"]! as! CreditCardNetwork
          }
          set {
            snapshot.updateValue(newValue, forKey: "network")
          }
        }

        internal var cardType: CardType {
          get {
            return snapshot["cardType"]! as! CardType
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardType")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var creditCardFundingSource: CreditCardFundingSource {
            get {
              return CreditCardFundingSource(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct TransactionVelocity: GraphQLSelectionSet {
          internal static let possibleTypes = ["TransactionVelocity"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("maximum", type: .scalar(Int.self)),
            GraphQLField("velocity", type: .list(.nonNull(.scalar(String.self)))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(maximum: Int? = nil, velocity: [String]? = nil) {
            self.init(snapshot: ["__typename": "TransactionVelocity", "maximum": maximum, "velocity": velocity])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var maximum: Int? {
            get {
              return snapshot["maximum"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "maximum")
            }
          }

          internal var velocity: [String]? {
            get {
              return snapshot["velocity"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "velocity")
            }
          }
        }
      }

      internal var asBankAccountFundingSource: AsBankAccountFundingSource? {
        get {
          if !AsBankAccountFundingSource.possibleTypes.contains(__typename) { return nil }
          return AsBankAccountFundingSource(snapshot: snapshot)
        }
        set {
          guard let newValue = newValue else { return }
          snapshot = newValue.snapshot
        }
      }

      internal struct AsBankAccountFundingSource: GraphQLSelectionSet {
        internal static let possibleTypes = ["BankAccountFundingSource"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("transactionVelocity", type: .object(TransactionVelocity.selections)),
          GraphQLField("bankAccountType", type: .nonNull(.scalar(BankAccountType.self))),
          GraphQLField("authorization", type: .nonNull(.object(Authorization.selections))),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("institutionName", type: .nonNull(.object(InstitutionName.selections))),
          GraphQLField("institutionLogo", type: .object(InstitutionLogo.selections)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: TransactionVelocity? = nil, bankAccountType: BankAccountType, authorization: Authorization, last4: String, institutionName: InstitutionName, institutionLogo: InstitutionLogo? = nil) {
          self.init(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "bankAccountType": bankAccountType, "authorization": authorization.snapshot, "last4": last4, "institutionName": institutionName.snapshot, "institutionLogo": institutionLogo.flatMap { $0.snapshot }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var state: FundingSourceState {
          get {
            return snapshot["state"]! as! FundingSourceState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var transactionVelocity: TransactionVelocity? {
          get {
            return (snapshot["transactionVelocity"] as? Snapshot).flatMap { TransactionVelocity(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "transactionVelocity")
          }
        }

        internal var bankAccountType: BankAccountType {
          get {
            return snapshot["bankAccountType"]! as! BankAccountType
          }
          set {
            snapshot.updateValue(newValue, forKey: "bankAccountType")
          }
        }

        internal var authorization: Authorization {
          get {
            return Authorization(snapshot: snapshot["authorization"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "authorization")
          }
        }

        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        internal var institutionName: InstitutionName {
          get {
            return InstitutionName(snapshot: snapshot["institutionName"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "institutionName")
          }
        }

        internal var institutionLogo: InstitutionLogo? {
          get {
            return (snapshot["institutionLogo"] as? Snapshot).flatMap { InstitutionLogo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "institutionLogo")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var bankAccountFundingSource: BankAccountFundingSource {
            get {
              return BankAccountFundingSource(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct TransactionVelocity: GraphQLSelectionSet {
          internal static let possibleTypes = ["TransactionVelocity"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("maximum", type: .scalar(Int.self)),
            GraphQLField("velocity", type: .list(.nonNull(.scalar(String.self)))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(maximum: Int? = nil, velocity: [String]? = nil) {
            self.init(snapshot: ["__typename": "TransactionVelocity", "maximum": maximum, "velocity": velocity])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var maximum: Int? {
            get {
              return snapshot["maximum"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "maximum")
            }
          }

          internal var velocity: [String]? {
            get {
              return snapshot["velocity"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "velocity")
            }
          }
        }

        internal struct Authorization: GraphQLSelectionSet {
          internal static let possibleTypes = ["SignedAuthorizationText"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("language", type: .nonNull(.scalar(String.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("contentType", type: .nonNull(.scalar(String.self))),
            GraphQLField("signature", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("data", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(language: String, content: String, contentType: String, signature: String, keyId: String, algorithm: String, data: String) {
            self.init(snapshot: ["__typename": "SignedAuthorizationText", "language": language, "content": content, "contentType": contentType, "signature": signature, "keyId": keyId, "algorithm": algorithm, "data": data])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var language: String {
            get {
              return snapshot["language"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "language")
            }
          }

          internal var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          internal var contentType: String {
            get {
              return snapshot["contentType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "contentType")
            }
          }

          internal var signature: String {
            get {
              return snapshot["signature"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "signature")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var data: String {
            get {
              return snapshot["data"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "data")
            }
          }
        }

        internal struct InstitutionName: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var plainTextType: String {
            get {
              return snapshot["plainTextType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "plainTextType")
            }
          }

          internal var base64EncodedSealedData: String {
            get {
              return snapshot["base64EncodedSealedData"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAttribute: SealedAttribute {
              get {
                return SealedAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct InstitutionLogo: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var plainTextType: String {
            get {
              return snapshot["plainTextType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "plainTextType")
            }
          }

          internal var base64EncodedSealedData: String {
            get {
              return snapshot["base64EncodedSealedData"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAttribute: SealedAttribute {
              get {
                return SealedAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

internal final class ListFundingSourcesQuery: GraphQLQuery {
  internal static let operationString =
    "query ListFundingSources($limit: Int, $nextToken: String) {\n  listFundingSources(limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      ... on CreditCardFundingSource {\n        ...CreditCardFundingSource\n      }\n      ... on BankAccountFundingSource {\n        ...BankAccountFundingSource\n      }\n    }\n    nextToken\n  }\n}"

  internal static var requestString: String { return operationString.appending(CreditCardFundingSource.fragmentString).appending(BankAccountFundingSource.fragmentString).appending(SealedAttribute.fragmentString) }

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
      GraphQLField("listFundingSources", arguments: ["limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .nonNull(.object(ListFundingSource.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(listFundingSources: ListFundingSource) {
      self.init(snapshot: ["__typename": "Query", "listFundingSources": listFundingSources.snapshot])
    }

    internal var listFundingSources: ListFundingSource {
      get {
        return ListFundingSource(snapshot: snapshot["listFundingSources"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "listFundingSources")
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
        internal static let possibleTypes = ["BankAccountFundingSource", "CreditCardFundingSource"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLTypeCase(
            variants: ["CreditCardFundingSource": AsCreditCardFundingSource.selections, "BankAccountFundingSource": AsBankAccountFundingSource.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            ]
          )
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal static func makeCreditCardFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: AsCreditCardFundingSource.TransactionVelocity? = nil, last4: String, network: CreditCardNetwork, cardType: CardType) -> Item {
          return Item(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "last4": last4, "network": network, "cardType": cardType])
        }

        internal static func makeBankAccountFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: AsBankAccountFundingSource.TransactionVelocity? = nil, bankAccountType: BankAccountType, authorization: AsBankAccountFundingSource.Authorization, last4: String, institutionName: AsBankAccountFundingSource.InstitutionName, institutionLogo: AsBankAccountFundingSource.InstitutionLogo? = nil) -> Item {
          return Item(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "bankAccountType": bankAccountType, "authorization": authorization.snapshot, "last4": last4, "institutionName": institutionName.snapshot, "institutionLogo": institutionLogo.flatMap { $0.snapshot }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var asCreditCardFundingSource: AsCreditCardFundingSource? {
          get {
            if !AsCreditCardFundingSource.possibleTypes.contains(__typename) { return nil }
            return AsCreditCardFundingSource(snapshot: snapshot)
          }
          set {
            guard let newValue = newValue else { return }
            snapshot = newValue.snapshot
          }
        }

        internal struct AsCreditCardFundingSource: GraphQLSelectionSet {
          internal static let possibleTypes = ["CreditCardFundingSource"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("version", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("transactionVelocity", type: .object(TransactionVelocity.selections)),
            GraphQLField("last4", type: .nonNull(.scalar(String.self))),
            GraphQLField("network", type: .nonNull(.scalar(CreditCardNetwork.self))),
            GraphQLField("cardType", type: .nonNull(.scalar(CardType.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: TransactionVelocity? = nil, last4: String, network: CreditCardNetwork, cardType: CardType) {
            self.init(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "last4": last4, "network": network, "cardType": cardType])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          internal var owner: GraphQLID {
            get {
              return snapshot["owner"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "owner")
            }
          }

          internal var version: Int {
            get {
              return snapshot["version"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "version")
            }
          }

          internal var createdAtEpochMs: Double {
            get {
              return snapshot["createdAtEpochMs"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
            }
          }

          internal var updatedAtEpochMs: Double {
            get {
              return snapshot["updatedAtEpochMs"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
            }
          }

          internal var state: FundingSourceState {
            get {
              return snapshot["state"]! as! FundingSourceState
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var transactionVelocity: TransactionVelocity? {
            get {
              return (snapshot["transactionVelocity"] as? Snapshot).flatMap { TransactionVelocity(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "transactionVelocity")
            }
          }

          internal var last4: String {
            get {
              return snapshot["last4"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "last4")
            }
          }

          internal var network: CreditCardNetwork {
            get {
              return snapshot["network"]! as! CreditCardNetwork
            }
            set {
              snapshot.updateValue(newValue, forKey: "network")
            }
          }

          internal var cardType: CardType {
            get {
              return snapshot["cardType"]! as! CardType
            }
            set {
              snapshot.updateValue(newValue, forKey: "cardType")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var creditCardFundingSource: CreditCardFundingSource {
              get {
                return CreditCardFundingSource(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          internal struct TransactionVelocity: GraphQLSelectionSet {
            internal static let possibleTypes = ["TransactionVelocity"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("maximum", type: .scalar(Int.self)),
              GraphQLField("velocity", type: .list(.nonNull(.scalar(String.self)))),
            ]

            internal var snapshot: Snapshot

            internal init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            internal init(maximum: Int? = nil, velocity: [String]? = nil) {
              self.init(snapshot: ["__typename": "TransactionVelocity", "maximum": maximum, "velocity": velocity])
            }

            internal var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            internal var maximum: Int? {
              get {
                return snapshot["maximum"] as? Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "maximum")
              }
            }

            internal var velocity: [String]? {
              get {
                return snapshot["velocity"] as? [String]
              }
              set {
                snapshot.updateValue(newValue, forKey: "velocity")
              }
            }
          }
        }

        internal var asBankAccountFundingSource: AsBankAccountFundingSource? {
          get {
            if !AsBankAccountFundingSource.possibleTypes.contains(__typename) { return nil }
            return AsBankAccountFundingSource(snapshot: snapshot)
          }
          set {
            guard let newValue = newValue else { return }
            snapshot = newValue.snapshot
          }
        }

        internal struct AsBankAccountFundingSource: GraphQLSelectionSet {
          internal static let possibleTypes = ["BankAccountFundingSource"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("version", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("transactionVelocity", type: .object(TransactionVelocity.selections)),
            GraphQLField("bankAccountType", type: .nonNull(.scalar(BankAccountType.self))),
            GraphQLField("authorization", type: .nonNull(.object(Authorization.selections))),
            GraphQLField("last4", type: .nonNull(.scalar(String.self))),
            GraphQLField("institutionName", type: .nonNull(.object(InstitutionName.selections))),
            GraphQLField("institutionLogo", type: .object(InstitutionLogo.selections)),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: TransactionVelocity? = nil, bankAccountType: BankAccountType, authorization: Authorization, last4: String, institutionName: InstitutionName, institutionLogo: InstitutionLogo? = nil) {
            self.init(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "bankAccountType": bankAccountType, "authorization": authorization.snapshot, "last4": last4, "institutionName": institutionName.snapshot, "institutionLogo": institutionLogo.flatMap { $0.snapshot }])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          internal var owner: GraphQLID {
            get {
              return snapshot["owner"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "owner")
            }
          }

          internal var version: Int {
            get {
              return snapshot["version"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "version")
            }
          }

          internal var createdAtEpochMs: Double {
            get {
              return snapshot["createdAtEpochMs"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
            }
          }

          internal var updatedAtEpochMs: Double {
            get {
              return snapshot["updatedAtEpochMs"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
            }
          }

          internal var state: FundingSourceState {
            get {
              return snapshot["state"]! as! FundingSourceState
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var transactionVelocity: TransactionVelocity? {
            get {
              return (snapshot["transactionVelocity"] as? Snapshot).flatMap { TransactionVelocity(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "transactionVelocity")
            }
          }

          internal var bankAccountType: BankAccountType {
            get {
              return snapshot["bankAccountType"]! as! BankAccountType
            }
            set {
              snapshot.updateValue(newValue, forKey: "bankAccountType")
            }
          }

          internal var authorization: Authorization {
            get {
              return Authorization(snapshot: snapshot["authorization"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "authorization")
            }
          }

          internal var last4: String {
            get {
              return snapshot["last4"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "last4")
            }
          }

          internal var institutionName: InstitutionName {
            get {
              return InstitutionName(snapshot: snapshot["institutionName"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "institutionName")
            }
          }

          internal var institutionLogo: InstitutionLogo? {
            get {
              return (snapshot["institutionLogo"] as? Snapshot).flatMap { InstitutionLogo(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "institutionLogo")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var bankAccountFundingSource: BankAccountFundingSource {
              get {
                return BankAccountFundingSource(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          internal struct TransactionVelocity: GraphQLSelectionSet {
            internal static let possibleTypes = ["TransactionVelocity"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("maximum", type: .scalar(Int.self)),
              GraphQLField("velocity", type: .list(.nonNull(.scalar(String.self)))),
            ]

            internal var snapshot: Snapshot

            internal init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            internal init(maximum: Int? = nil, velocity: [String]? = nil) {
              self.init(snapshot: ["__typename": "TransactionVelocity", "maximum": maximum, "velocity": velocity])
            }

            internal var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            internal var maximum: Int? {
              get {
                return snapshot["maximum"] as? Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "maximum")
              }
            }

            internal var velocity: [String]? {
              get {
                return snapshot["velocity"] as? [String]
              }
              set {
                snapshot.updateValue(newValue, forKey: "velocity")
              }
            }
          }

          internal struct Authorization: GraphQLSelectionSet {
            internal static let possibleTypes = ["SignedAuthorizationText"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("language", type: .nonNull(.scalar(String.self))),
              GraphQLField("content", type: .nonNull(.scalar(String.self))),
              GraphQLField("contentType", type: .nonNull(.scalar(String.self))),
              GraphQLField("signature", type: .nonNull(.scalar(String.self))),
              GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
              GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
              GraphQLField("data", type: .nonNull(.scalar(String.self))),
            ]

            internal var snapshot: Snapshot

            internal init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            internal init(language: String, content: String, contentType: String, signature: String, keyId: String, algorithm: String, data: String) {
              self.init(snapshot: ["__typename": "SignedAuthorizationText", "language": language, "content": content, "contentType": contentType, "signature": signature, "keyId": keyId, "algorithm": algorithm, "data": data])
            }

            internal var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            internal var language: String {
              get {
                return snapshot["language"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "language")
              }
            }

            internal var content: String {
              get {
                return snapshot["content"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "content")
              }
            }

            internal var contentType: String {
              get {
                return snapshot["contentType"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "contentType")
              }
            }

            internal var signature: String {
              get {
                return snapshot["signature"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "signature")
              }
            }

            internal var keyId: String {
              get {
                return snapshot["keyId"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "keyId")
              }
            }

            internal var algorithm: String {
              get {
                return snapshot["algorithm"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "algorithm")
              }
            }

            internal var data: String {
              get {
                return snapshot["data"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "data")
              }
            }
          }

          internal struct InstitutionName: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
              GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
              GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
              GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
            ]

            internal var snapshot: Snapshot

            internal init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
              self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
            }

            internal var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            internal var keyId: String {
              get {
                return snapshot["keyId"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "keyId")
              }
            }

            internal var algorithm: String {
              get {
                return snapshot["algorithm"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "algorithm")
              }
            }

            internal var plainTextType: String {
              get {
                return snapshot["plainTextType"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "plainTextType")
              }
            }

            internal var base64EncodedSealedData: String {
              get {
                return snapshot["base64EncodedSealedData"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedAttribute: SealedAttribute {
                get {
                  return SealedAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct InstitutionLogo: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
              GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
              GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
              GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
            ]

            internal var snapshot: Snapshot

            internal init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
              self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
            }

            internal var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            internal var keyId: String {
              get {
                return snapshot["keyId"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "keyId")
              }
            }

            internal var algorithm: String {
              get {
                return snapshot["algorithm"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "algorithm")
              }
            }

            internal var plainTextType: String {
              get {
                return snapshot["plainTextType"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "plainTextType")
              }
            }

            internal var base64EncodedSealedData: String {
              get {
                return snapshot["base64EncodedSealedData"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedAttribute: SealedAttribute {
                get {
                  return SealedAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }
        }
      }
    }
  }
}

internal final class GetProvisionalCardQuery: GraphQLQuery {
  internal static let operationString =
    "query GetProvisionalCard($id: ID!) {\n  getProvisionalCard(id: $id) {\n    __typename\n    ...ProvisionalCard\n  }\n}"

  internal static var requestString: String { return operationString.appending(ProvisionalCard.fragmentString).appending(SealedCard.fragmentString).appending(Owner.fragmentString).appending(SealedAddressAttribute.fragmentString).appending(SealedExpiryAttribute.fragmentString).appending(SealedAttribute.fragmentString) }

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
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("clientRefId", type: .nonNull(.scalar(String.self))),
        GraphQLField("provisioningState", type: .nonNull(.scalar(ProvisioningState.self))),
        GraphQLField("card", type: .list(.nonNull(.object(Card.selections)))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, clientRefId: String, provisioningState: ProvisioningState, card: [Card]? = nil) {
        self.init(snapshot: ["__typename": "ProvisionalCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "clientRefId": clientRefId, "provisioningState": provisioningState, "card": card.flatMap { $0.map { $0.snapshot } }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      internal var clientRefId: String {
        get {
          return snapshot["clientRefId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "clientRefId")
        }
      }

      internal var provisioningState: ProvisioningState {
        get {
          return snapshot["provisioningState"]! as! ProvisioningState
        }
        set {
          snapshot.updateValue(newValue, forKey: "provisioningState")
        }
      }

      internal var card: [Card]? {
        get {
          return (snapshot["card"] as? [Snapshot]).flatMap { $0.map { Card(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "card")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var provisionalCard: ProvisionalCard {
          get {
            return ProvisionalCard(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      internal struct Card: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCard"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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
          GraphQLField("alias", type: .scalar(String.self)),
          GraphQLField("pan", type: .nonNull(.scalar(String.self))),
          GraphQLField("csc", type: .nonNull(.scalar(String.self))),
          GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
          GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
          GraphQLField("metadata", type: .object(Metadatum.selections)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, metadata: Metadatum? = nil) {
          self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "metadata": metadata.flatMap { $0.snapshot }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        internal var keyRingId: GraphQLID {
          get {
            return snapshot["keyRingId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyRingId")
          }
        }

        internal var owners: [Owner] {
          get {
            return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
          }
        }

        internal var fundingSourceId: GraphQLID {
          get {
            return snapshot["fundingSourceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fundingSourceId")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var state: CardState {
          get {
            return snapshot["state"]! as! CardState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var activeToEpochMs: Double {
          get {
            return snapshot["activeToEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "activeToEpochMs")
          }
        }

        internal var cancelledAtEpochMs: Double? {
          get {
            return snapshot["cancelledAtEpochMs"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
          }
        }

        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        internal var cardHolder: String {
          get {
            return snapshot["cardHolder"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardHolder")
          }
        }

        internal var alias: String? {
          get {
            return snapshot["alias"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "alias")
          }
        }

        internal var pan: String {
          get {
            return snapshot["pan"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pan")
          }
        }

        internal var csc: String {
          get {
            return snapshot["csc"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "csc")
          }
        }

        internal var billingAddress: BillingAddress? {
          get {
            return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
          }
        }

        internal var expiry: Expiry {
          get {
            return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "expiry")
          }
        }

        internal var metadata: Metadatum? {
          get {
            return (snapshot["metadata"] as? Snapshot).flatMap { Metadatum(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "metadata")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedCard: SealedCard {
            get {
              return SealedCard(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct Owner: GraphQLSelectionSet {
          internal static let possibleTypes = ["Owner"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var owner: Owner {
              get {
                return Owner(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct BillingAddress: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAddressAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAddressAttribute: SealedAddressAttribute {
              get {
                return SealedAddressAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct Expiry: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedExpiryAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedExpiryAttribute: SealedExpiryAttribute {
              get {
                return SealedExpiryAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct Metadatum: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var plainTextType: String {
            get {
              return snapshot["plainTextType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "plainTextType")
            }
          }

          internal var base64EncodedSealedData: String {
            get {
              return snapshot["base64EncodedSealedData"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAttribute: SealedAttribute {
              get {
                return SealedAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

internal final class ListProvisionalCardsQuery: GraphQLQuery {
  internal static let operationString =
    "query ListProvisionalCards($filter: ProvisionalCardFilterInput, $limit: Int, $nextToken: String) {\n  listProvisionalCards(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      ...ProvisionalCard\n    }\n    nextToken\n  }\n}"

  internal static var requestString: String { return operationString.appending(ProvisionalCard.fragmentString).appending(SealedCard.fragmentString).appending(Owner.fragmentString).appending(SealedAddressAttribute.fragmentString).appending(SealedExpiryAttribute.fragmentString).appending(SealedAttribute.fragmentString) }

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
      GraphQLField("listProvisionalCards", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .nonNull(.object(ListProvisionalCard.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(listProvisionalCards: ListProvisionalCard) {
      self.init(snapshot: ["__typename": "Query", "listProvisionalCards": listProvisionalCards.snapshot])
    }

    internal var listProvisionalCards: ListProvisionalCard {
      get {
        return ListProvisionalCard(snapshot: snapshot["listProvisionalCards"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "listProvisionalCards")
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
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("clientRefId", type: .nonNull(.scalar(String.self))),
          GraphQLField("provisioningState", type: .nonNull(.scalar(ProvisioningState.self))),
          GraphQLField("card", type: .list(.nonNull(.object(Card.selections)))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, clientRefId: String, provisioningState: ProvisioningState, card: [Card]? = nil) {
          self.init(snapshot: ["__typename": "ProvisionalCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "clientRefId": clientRefId, "provisioningState": provisioningState, "card": card.flatMap { $0.map { $0.snapshot } }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var clientRefId: String {
          get {
            return snapshot["clientRefId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "clientRefId")
          }
        }

        internal var provisioningState: ProvisioningState {
          get {
            return snapshot["provisioningState"]! as! ProvisioningState
          }
          set {
            snapshot.updateValue(newValue, forKey: "provisioningState")
          }
        }

        internal var card: [Card]? {
          get {
            return (snapshot["card"] as? [Snapshot]).flatMap { $0.map { Card(snapshot: $0) } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "card")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var provisionalCard: ProvisionalCard {
            get {
              return ProvisionalCard(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct Card: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCard"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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
            GraphQLField("alias", type: .scalar(String.self)),
            GraphQLField("pan", type: .nonNull(.scalar(String.self))),
            GraphQLField("csc", type: .nonNull(.scalar(String.self))),
            GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
            GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
            GraphQLField("metadata", type: .object(Metadatum.selections)),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, metadata: Metadatum? = nil) {
            self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "metadata": metadata.flatMap { $0.snapshot }])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          internal var owner: GraphQLID {
            get {
              return snapshot["owner"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "owner")
            }
          }

          internal var version: Int {
            get {
              return snapshot["version"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "version")
            }
          }

          internal var createdAtEpochMs: Double {
            get {
              return snapshot["createdAtEpochMs"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
            }
          }

          internal var updatedAtEpochMs: Double {
            get {
              return snapshot["updatedAtEpochMs"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var keyRingId: GraphQLID {
            get {
              return snapshot["keyRingId"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyRingId")
            }
          }

          internal var owners: [Owner] {
            get {
              return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
            }
          }

          internal var fundingSourceId: GraphQLID {
            get {
              return snapshot["fundingSourceId"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "fundingSourceId")
            }
          }

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var state: CardState {
            get {
              return snapshot["state"]! as! CardState
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          internal var activeToEpochMs: Double {
            get {
              return snapshot["activeToEpochMs"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "activeToEpochMs")
            }
          }

          internal var cancelledAtEpochMs: Double? {
            get {
              return snapshot["cancelledAtEpochMs"] as? Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
            }
          }

          internal var last4: String {
            get {
              return snapshot["last4"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "last4")
            }
          }

          internal var cardHolder: String {
            get {
              return snapshot["cardHolder"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "cardHolder")
            }
          }

          internal var alias: String? {
            get {
              return snapshot["alias"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "alias")
            }
          }

          internal var pan: String {
            get {
              return snapshot["pan"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "pan")
            }
          }

          internal var csc: String {
            get {
              return snapshot["csc"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "csc")
            }
          }

          internal var billingAddress: BillingAddress? {
            get {
              return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
            }
          }

          internal var expiry: Expiry {
            get {
              return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "expiry")
            }
          }

          internal var metadata: Metadatum? {
            get {
              return (snapshot["metadata"] as? Snapshot).flatMap { Metadatum(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "metadata")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCard: SealedCard {
              get {
                return SealedCard(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          internal struct Owner: GraphQLSelectionSet {
            internal static let possibleTypes = ["Owner"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var owner: Owner {
                get {
                  return Owner(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct BillingAddress: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedAddressAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedAddressAttribute: SealedAddressAttribute {
                get {
                  return SealedAddressAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct Expiry: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedExpiryAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedExpiryAttribute: SealedExpiryAttribute {
                get {
                  return SealedExpiryAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct Metadatum: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
              GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
              GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
              GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
            ]

            internal var snapshot: Snapshot

            internal init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
              self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
            }

            internal var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            internal var keyId: String {
              get {
                return snapshot["keyId"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "keyId")
              }
            }

            internal var algorithm: String {
              get {
                return snapshot["algorithm"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "algorithm")
              }
            }

            internal var plainTextType: String {
              get {
                return snapshot["plainTextType"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "plainTextType")
              }
            }

            internal var base64EncodedSealedData: String {
              get {
                return snapshot["base64EncodedSealedData"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedAttribute: SealedAttribute {
                get {
                  return SealedAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }
        }
      }
    }
  }
}

internal final class GetCardQuery: GraphQLQuery {
  internal static let operationString =
    "query GetCard($id: ID!, $keyId: String) {\n  getCard(id: $id, keyId: $keyId) {\n    __typename\n    ...SealedCardWithLastTransaction\n  }\n}"

  internal static var requestString: String { return operationString.appending(SealedCardWithLastTransaction.fragmentString).appending(SealedCard.fragmentString).appending(Owner.fragmentString).appending(SealedAddressAttribute.fragmentString).appending(SealedExpiryAttribute.fragmentString).appending(SealedAttribute.fragmentString).appending(SealedTransaction.fragmentString).appending(SealedCurrencyAmountAttribute.fragmentString).appending(SealedTransactionDetailChargeAttribute.fragmentString).appending(SealedMarkupAttribute.fragmentString) }

  internal var id: GraphQLID
  internal var keyId: String?

  internal init(id: GraphQLID, keyId: String? = nil) {
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
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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
        GraphQLField("alias", type: .scalar(String.self)),
        GraphQLField("pan", type: .nonNull(.scalar(String.self))),
        GraphQLField("csc", type: .nonNull(.scalar(String.self))),
        GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
        GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
        GraphQLField("metadata", type: .object(Metadatum.selections)),
        GraphQLField("lastTransaction", type: .object(LastTransaction.selections)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, metadata: Metadatum? = nil, lastTransaction: LastTransaction? = nil) {
        self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "metadata": metadata.flatMap { $0.snapshot }, "lastTransaction": lastTransaction.flatMap { $0.snapshot }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      internal var keyRingId: GraphQLID {
        get {
          return snapshot["keyRingId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyRingId")
        }
      }

      internal var owners: [Owner] {
        get {
          return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
        }
      }

      internal var fundingSourceId: GraphQLID {
        get {
          return snapshot["fundingSourceId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "fundingSourceId")
        }
      }

      internal var currency: String {
        get {
          return snapshot["currency"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      internal var state: CardState {
        get {
          return snapshot["state"]! as! CardState
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      internal var activeToEpochMs: Double {
        get {
          return snapshot["activeToEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "activeToEpochMs")
        }
      }

      internal var cancelledAtEpochMs: Double? {
        get {
          return snapshot["cancelledAtEpochMs"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
        }
      }

      internal var last4: String {
        get {
          return snapshot["last4"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last4")
        }
      }

      internal var cardHolder: String {
        get {
          return snapshot["cardHolder"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "cardHolder")
        }
      }

      internal var alias: String? {
        get {
          return snapshot["alias"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "alias")
        }
      }

      internal var pan: String {
        get {
          return snapshot["pan"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "pan")
        }
      }

      internal var csc: String {
        get {
          return snapshot["csc"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "csc")
        }
      }

      internal var billingAddress: BillingAddress? {
        get {
          return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
        }
      }

      internal var expiry: Expiry {
        get {
          return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "expiry")
        }
      }

      internal var metadata: Metadatum? {
        get {
          return (snapshot["metadata"] as? Snapshot).flatMap { Metadatum(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "metadata")
        }
      }

      internal var lastTransaction: LastTransaction? {
        get {
          return (snapshot["lastTransaction"] as? Snapshot).flatMap { LastTransaction(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "lastTransaction")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var sealedCardWithLastTransaction: SealedCardWithLastTransaction {
          get {
            return SealedCardWithLastTransaction(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal var sealedCard: SealedCard {
          get {
            return SealedCard(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      internal struct Owner: GraphQLSelectionSet {
        internal static let possibleTypes = ["Owner"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var owner: Owner {
            get {
              return Owner(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct BillingAddress: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedAddressAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedAddressAttribute: SealedAddressAttribute {
            get {
              return SealedAddressAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct Expiry: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedExpiryAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedExpiryAttribute: SealedExpiryAttribute {
            get {
              return SealedExpiryAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct Metadatum: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
          GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
          self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        internal var plainTextType: String {
          get {
            return snapshot["plainTextType"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "plainTextType")
          }
        }

        internal var base64EncodedSealedData: String {
          get {
            return snapshot["base64EncodedSealedData"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedAttribute: SealedAttribute {
            get {
              return SealedAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct LastTransaction: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedTransaction"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("cardId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("sequenceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
          GraphQLField("transactedAtEpochMs", type: .nonNull(.scalar(String.self))),
          GraphQLField("settledAtEpochMs", type: .scalar(String.self)),
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

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
          self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var sortDateEpochMs: Double {
          get {
            return snapshot["sortDateEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "sortDateEpochMs")
          }
        }

        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        internal var cardId: GraphQLID {
          get {
            return snapshot["cardId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardId")
          }
        }

        internal var sequenceId: GraphQLID {
          get {
            return snapshot["sequenceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "sequenceId")
          }
        }

        internal var type: TransactionType {
          get {
            return snapshot["type"]! as! TransactionType
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        internal var transactedAtEpochMs: String {
          get {
            return snapshot["transactedAtEpochMs"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "transactedAtEpochMs")
          }
        }

        internal var settledAtEpochMs: String? {
          get {
            return snapshot["settledAtEpochMs"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "settledAtEpochMs")
          }
        }

        internal var billedAmount: BilledAmount {
          get {
            return BilledAmount(snapshot: snapshot["billedAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "billedAmount")
          }
        }

        internal var transactedAmount: TransactedAmount {
          get {
            return TransactedAmount(snapshot: snapshot["transactedAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "transactedAmount")
          }
        }

        internal var description: String {
          get {
            return snapshot["description"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "description")
          }
        }

        internal var declineReason: String? {
          get {
            return snapshot["declineReason"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "declineReason")
          }
        }

        internal var detail: [Detail]? {
          get {
            return (snapshot["detail"] as? [Snapshot]).flatMap { $0.map { Detail(snapshot: $0) } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "detail")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedTransaction: SealedTransaction {
            get {
              return SealedTransaction(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct BilledAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct TransactedAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct Detail: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedTransactionDetailChargeAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("virtualCardAmount", type: .nonNull(.object(VirtualCardAmount.selections))),
            GraphQLField("markup", type: .nonNull(.object(Markup.selections))),
            GraphQLField("markupAmount", type: .nonNull(.object(MarkupAmount.selections))),
            GraphQLField("fundingSourceAmount", type: .nonNull(.object(FundingSourceAmount.selections))),
            GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("state", type: .scalar(String.self)),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(virtualCardAmount: VirtualCardAmount, markup: Markup, markupAmount: MarkupAmount, fundingSourceAmount: FundingSourceAmount, fundingSourceId: GraphQLID, description: String, state: String? = nil) {
            self.init(snapshot: ["__typename": "SealedTransactionDetailChargeAttribute", "virtualCardAmount": virtualCardAmount.snapshot, "markup": markup.snapshot, "markupAmount": markupAmount.snapshot, "fundingSourceAmount": fundingSourceAmount.snapshot, "fundingSourceId": fundingSourceId, "description": description, "state": state])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var virtualCardAmount: VirtualCardAmount {
            get {
              return VirtualCardAmount(snapshot: snapshot["virtualCardAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "virtualCardAmount")
            }
          }

          internal var markup: Markup {
            get {
              return Markup(snapshot: snapshot["markup"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "markup")
            }
          }

          internal var markupAmount: MarkupAmount {
            get {
              return MarkupAmount(snapshot: snapshot["markupAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "markupAmount")
            }
          }

          internal var fundingSourceAmount: FundingSourceAmount {
            get {
              return FundingSourceAmount(snapshot: snapshot["fundingSourceAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "fundingSourceAmount")
            }
          }

          internal var fundingSourceId: GraphQLID {
            get {
              return snapshot["fundingSourceId"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "fundingSourceId")
            }
          }

          internal var description: String {
            get {
              return snapshot["description"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "description")
            }
          }

          internal var state: String? {
            get {
              return snapshot["state"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedTransactionDetailChargeAttribute: SealedTransactionDetailChargeAttribute {
              get {
                return SealedTransactionDetailChargeAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          internal struct VirtualCardAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct Markup: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedMarkupAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var percent: String {
              get {
                return snapshot["percent"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "percent")
              }
            }

            internal var flat: String {
              get {
                return snapshot["flat"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "flat")
              }
            }

            internal var minCharge: String? {
              get {
                return snapshot["minCharge"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "minCharge")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedMarkupAttribute: SealedMarkupAttribute {
                get {
                  return SealedMarkupAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct MarkupAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct FundingSourceAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }
        }
      }
    }
  }
}

internal final class ListCardsQuery: GraphQLQuery {
  internal static let operationString =
    "query ListCards($limit: Int, $nextToken: String) {\n  listCards(limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      ...SealedCardWithLastTransaction\n    }\n    nextToken\n  }\n}"

  internal static var requestString: String { return operationString.appending(SealedCardWithLastTransaction.fragmentString).appending(SealedCard.fragmentString).appending(Owner.fragmentString).appending(SealedAddressAttribute.fragmentString).appending(SealedExpiryAttribute.fragmentString).appending(SealedAttribute.fragmentString).appending(SealedTransaction.fragmentString).appending(SealedCurrencyAmountAttribute.fragmentString).appending(SealedTransactionDetailChargeAttribute.fragmentString).appending(SealedMarkupAttribute.fragmentString) }

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
      GraphQLField("listCards", arguments: ["limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .nonNull(.object(ListCard.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(listCards: ListCard) {
      self.init(snapshot: ["__typename": "Query", "listCards": listCards.snapshot])
    }

    internal var listCards: ListCard {
      get {
        return ListCard(snapshot: snapshot["listCards"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "listCards")
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
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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
          GraphQLField("alias", type: .scalar(String.self)),
          GraphQLField("pan", type: .nonNull(.scalar(String.self))),
          GraphQLField("csc", type: .nonNull(.scalar(String.self))),
          GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
          GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
          GraphQLField("metadata", type: .object(Metadatum.selections)),
          GraphQLField("lastTransaction", type: .object(LastTransaction.selections)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, metadata: Metadatum? = nil, lastTransaction: LastTransaction? = nil) {
          self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "metadata": metadata.flatMap { $0.snapshot }, "lastTransaction": lastTransaction.flatMap { $0.snapshot }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        internal var keyRingId: GraphQLID {
          get {
            return snapshot["keyRingId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyRingId")
          }
        }

        internal var owners: [Owner] {
          get {
            return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
          }
        }

        internal var fundingSourceId: GraphQLID {
          get {
            return snapshot["fundingSourceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fundingSourceId")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var state: CardState {
          get {
            return snapshot["state"]! as! CardState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var activeToEpochMs: Double {
          get {
            return snapshot["activeToEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "activeToEpochMs")
          }
        }

        internal var cancelledAtEpochMs: Double? {
          get {
            return snapshot["cancelledAtEpochMs"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
          }
        }

        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        internal var cardHolder: String {
          get {
            return snapshot["cardHolder"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardHolder")
          }
        }

        internal var alias: String? {
          get {
            return snapshot["alias"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "alias")
          }
        }

        internal var pan: String {
          get {
            return snapshot["pan"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pan")
          }
        }

        internal var csc: String {
          get {
            return snapshot["csc"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "csc")
          }
        }

        internal var billingAddress: BillingAddress? {
          get {
            return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
          }
        }

        internal var expiry: Expiry {
          get {
            return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "expiry")
          }
        }

        internal var metadata: Metadatum? {
          get {
            return (snapshot["metadata"] as? Snapshot).flatMap { Metadatum(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "metadata")
          }
        }

        internal var lastTransaction: LastTransaction? {
          get {
            return (snapshot["lastTransaction"] as? Snapshot).flatMap { LastTransaction(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "lastTransaction")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedCardWithLastTransaction: SealedCardWithLastTransaction {
            get {
              return SealedCardWithLastTransaction(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal var sealedCard: SealedCard {
            get {
              return SealedCard(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct Owner: GraphQLSelectionSet {
          internal static let possibleTypes = ["Owner"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var owner: Owner {
              get {
                return Owner(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct BillingAddress: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAddressAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAddressAttribute: SealedAddressAttribute {
              get {
                return SealedAddressAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct Expiry: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedExpiryAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedExpiryAttribute: SealedExpiryAttribute {
              get {
                return SealedExpiryAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct Metadatum: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var plainTextType: String {
            get {
              return snapshot["plainTextType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "plainTextType")
            }
          }

          internal var base64EncodedSealedData: String {
            get {
              return snapshot["base64EncodedSealedData"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAttribute: SealedAttribute {
              get {
                return SealedAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct LastTransaction: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedTransaction"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("version", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("cardId", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("sequenceId", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
            GraphQLField("transactedAtEpochMs", type: .nonNull(.scalar(String.self))),
            GraphQLField("settledAtEpochMs", type: .scalar(String.self)),
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

          internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
            self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          internal var owner: GraphQLID {
            get {
              return snapshot["owner"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "owner")
            }
          }

          internal var version: Int {
            get {
              return snapshot["version"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "version")
            }
          }

          internal var createdAtEpochMs: Double {
            get {
              return snapshot["createdAtEpochMs"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
            }
          }

          internal var updatedAtEpochMs: Double {
            get {
              return snapshot["updatedAtEpochMs"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
            }
          }

          internal var sortDateEpochMs: Double {
            get {
              return snapshot["sortDateEpochMs"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "sortDateEpochMs")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var cardId: GraphQLID {
            get {
              return snapshot["cardId"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "cardId")
            }
          }

          internal var sequenceId: GraphQLID {
            get {
              return snapshot["sequenceId"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "sequenceId")
            }
          }

          internal var type: TransactionType {
            get {
              return snapshot["type"]! as! TransactionType
            }
            set {
              snapshot.updateValue(newValue, forKey: "type")
            }
          }

          internal var transactedAtEpochMs: String {
            get {
              return snapshot["transactedAtEpochMs"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "transactedAtEpochMs")
            }
          }

          internal var settledAtEpochMs: String? {
            get {
              return snapshot["settledAtEpochMs"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "settledAtEpochMs")
            }
          }

          internal var billedAmount: BilledAmount {
            get {
              return BilledAmount(snapshot: snapshot["billedAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "billedAmount")
            }
          }

          internal var transactedAmount: TransactedAmount {
            get {
              return TransactedAmount(snapshot: snapshot["transactedAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "transactedAmount")
            }
          }

          internal var description: String {
            get {
              return snapshot["description"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "description")
            }
          }

          internal var declineReason: String? {
            get {
              return snapshot["declineReason"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "declineReason")
            }
          }

          internal var detail: [Detail]? {
            get {
              return (snapshot["detail"] as? [Snapshot]).flatMap { $0.map { Detail(snapshot: $0) } }
            }
            set {
              snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "detail")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedTransaction: SealedTransaction {
              get {
                return SealedTransaction(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          internal struct BilledAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct TransactedAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct Detail: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedTransactionDetailChargeAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("virtualCardAmount", type: .nonNull(.object(VirtualCardAmount.selections))),
              GraphQLField("markup", type: .nonNull(.object(Markup.selections))),
              GraphQLField("markupAmount", type: .nonNull(.object(MarkupAmount.selections))),
              GraphQLField("fundingSourceAmount", type: .nonNull(.object(FundingSourceAmount.selections))),
              GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("description", type: .nonNull(.scalar(String.self))),
              GraphQLField("state", type: .scalar(String.self)),
            ]

            internal var snapshot: Snapshot

            internal init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            internal init(virtualCardAmount: VirtualCardAmount, markup: Markup, markupAmount: MarkupAmount, fundingSourceAmount: FundingSourceAmount, fundingSourceId: GraphQLID, description: String, state: String? = nil) {
              self.init(snapshot: ["__typename": "SealedTransactionDetailChargeAttribute", "virtualCardAmount": virtualCardAmount.snapshot, "markup": markup.snapshot, "markupAmount": markupAmount.snapshot, "fundingSourceAmount": fundingSourceAmount.snapshot, "fundingSourceId": fundingSourceId, "description": description, "state": state])
            }

            internal var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            internal var virtualCardAmount: VirtualCardAmount {
              get {
                return VirtualCardAmount(snapshot: snapshot["virtualCardAmount"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "virtualCardAmount")
              }
            }

            internal var markup: Markup {
              get {
                return Markup(snapshot: snapshot["markup"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "markup")
              }
            }

            internal var markupAmount: MarkupAmount {
              get {
                return MarkupAmount(snapshot: snapshot["markupAmount"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "markupAmount")
              }
            }

            internal var fundingSourceAmount: FundingSourceAmount {
              get {
                return FundingSourceAmount(snapshot: snapshot["fundingSourceAmount"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "fundingSourceAmount")
              }
            }

            internal var fundingSourceId: GraphQLID {
              get {
                return snapshot["fundingSourceId"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "fundingSourceId")
              }
            }

            internal var description: String {
              get {
                return snapshot["description"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "description")
              }
            }

            internal var state: String? {
              get {
                return snapshot["state"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "state")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedTransactionDetailChargeAttribute: SealedTransactionDetailChargeAttribute {
                get {
                  return SealedTransactionDetailChargeAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }

            internal struct VirtualCardAmount: GraphQLSelectionSet {
              internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

              internal static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

              internal var currency: String {
                get {
                  return snapshot["currency"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "currency")
                }
              }

              internal var amount: String {
                get {
                  return snapshot["amount"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "amount")
                }
              }

              internal var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              internal struct Fragments {
                internal var snapshot: Snapshot

                internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                  get {
                    return SealedCurrencyAmountAttribute(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
                  }
                }
              }
            }

            internal struct Markup: GraphQLSelectionSet {
              internal static let possibleTypes = ["SealedMarkupAttribute"]

              internal static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

              internal var percent: String {
                get {
                  return snapshot["percent"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "percent")
                }
              }

              internal var flat: String {
                get {
                  return snapshot["flat"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "flat")
                }
              }

              internal var minCharge: String? {
                get {
                  return snapshot["minCharge"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "minCharge")
                }
              }

              internal var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              internal struct Fragments {
                internal var snapshot: Snapshot

                internal var sealedMarkupAttribute: SealedMarkupAttribute {
                  get {
                    return SealedMarkupAttribute(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
                  }
                }
              }
            }

            internal struct MarkupAmount: GraphQLSelectionSet {
              internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

              internal static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

              internal var currency: String {
                get {
                  return snapshot["currency"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "currency")
                }
              }

              internal var amount: String {
                get {
                  return snapshot["amount"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "amount")
                }
              }

              internal var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              internal struct Fragments {
                internal var snapshot: Snapshot

                internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                  get {
                    return SealedCurrencyAmountAttribute(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
                  }
                }
              }
            }

            internal struct FundingSourceAmount: GraphQLSelectionSet {
              internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

              internal static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

              internal var currency: String {
                get {
                  return snapshot["currency"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "currency")
                }
              }

              internal var amount: String {
                get {
                  return snapshot["amount"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "amount")
                }
              }

              internal var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              internal struct Fragments {
                internal var snapshot: Snapshot

                internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                  get {
                    return SealedCurrencyAmountAttribute(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

internal final class GetTransactionQuery: GraphQLQuery {
  internal static let operationString =
    "query GetTransaction($id: ID!, $keyId: String) {\n  getTransaction(id: $id, keyId: $keyId) {\n    __typename\n    ...SealedTransaction\n  }\n}"

  internal static var requestString: String { return operationString.appending(SealedTransaction.fragmentString).appending(SealedCurrencyAmountAttribute.fragmentString).appending(SealedTransactionDetailChargeAttribute.fragmentString).appending(SealedMarkupAttribute.fragmentString) }

  internal var id: GraphQLID
  internal var keyId: String?

  internal init(id: GraphQLID, keyId: String? = nil) {
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
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("cardId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("sequenceId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
        GraphQLField("transactedAtEpochMs", type: .nonNull(.scalar(String.self))),
        GraphQLField("settledAtEpochMs", type: .scalar(String.self)),
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

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
        self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      internal var sortDateEpochMs: Double {
        get {
          return snapshot["sortDateEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "sortDateEpochMs")
        }
      }

      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      internal var cardId: GraphQLID {
        get {
          return snapshot["cardId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cardId")
        }
      }

      internal var sequenceId: GraphQLID {
        get {
          return snapshot["sequenceId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "sequenceId")
        }
      }

      internal var type: TransactionType {
        get {
          return snapshot["type"]! as! TransactionType
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      internal var transactedAtEpochMs: String {
        get {
          return snapshot["transactedAtEpochMs"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "transactedAtEpochMs")
        }
      }

      internal var settledAtEpochMs: String? {
        get {
          return snapshot["settledAtEpochMs"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "settledAtEpochMs")
        }
      }

      internal var billedAmount: BilledAmount {
        get {
          return BilledAmount(snapshot: snapshot["billedAmount"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "billedAmount")
        }
      }

      internal var transactedAmount: TransactedAmount {
        get {
          return TransactedAmount(snapshot: snapshot["transactedAmount"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "transactedAmount")
        }
      }

      internal var description: String {
        get {
          return snapshot["description"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      internal var declineReason: String? {
        get {
          return snapshot["declineReason"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "declineReason")
        }
      }

      internal var detail: [Detail]? {
        get {
          return (snapshot["detail"] as? [Snapshot]).flatMap { $0.map { Detail(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "detail")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var sealedTransaction: SealedTransaction {
          get {
            return SealedTransaction(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      internal struct BilledAmount: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var amount: String {
          get {
            return snapshot["amount"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "amount")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
            get {
              return SealedCurrencyAmountAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct TransactedAmount: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var amount: String {
          get {
            return snapshot["amount"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "amount")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
            get {
              return SealedCurrencyAmountAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct Detail: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedTransactionDetailChargeAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("virtualCardAmount", type: .nonNull(.object(VirtualCardAmount.selections))),
          GraphQLField("markup", type: .nonNull(.object(Markup.selections))),
          GraphQLField("markupAmount", type: .nonNull(.object(MarkupAmount.selections))),
          GraphQLField("fundingSourceAmount", type: .nonNull(.object(FundingSourceAmount.selections))),
          GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .scalar(String.self)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(virtualCardAmount: VirtualCardAmount, markup: Markup, markupAmount: MarkupAmount, fundingSourceAmount: FundingSourceAmount, fundingSourceId: GraphQLID, description: String, state: String? = nil) {
          self.init(snapshot: ["__typename": "SealedTransactionDetailChargeAttribute", "virtualCardAmount": virtualCardAmount.snapshot, "markup": markup.snapshot, "markupAmount": markupAmount.snapshot, "fundingSourceAmount": fundingSourceAmount.snapshot, "fundingSourceId": fundingSourceId, "description": description, "state": state])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var virtualCardAmount: VirtualCardAmount {
          get {
            return VirtualCardAmount(snapshot: snapshot["virtualCardAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "virtualCardAmount")
          }
        }

        internal var markup: Markup {
          get {
            return Markup(snapshot: snapshot["markup"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "markup")
          }
        }

        internal var markupAmount: MarkupAmount {
          get {
            return MarkupAmount(snapshot: snapshot["markupAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "markupAmount")
          }
        }

        internal var fundingSourceAmount: FundingSourceAmount {
          get {
            return FundingSourceAmount(snapshot: snapshot["fundingSourceAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "fundingSourceAmount")
          }
        }

        internal var fundingSourceId: GraphQLID {
          get {
            return snapshot["fundingSourceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fundingSourceId")
          }
        }

        internal var description: String {
          get {
            return snapshot["description"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "description")
          }
        }

        internal var state: String? {
          get {
            return snapshot["state"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedTransactionDetailChargeAttribute: SealedTransactionDetailChargeAttribute {
            get {
              return SealedTransactionDetailChargeAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct VirtualCardAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct Markup: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedMarkupAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var percent: String {
            get {
              return snapshot["percent"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "percent")
            }
          }

          internal var flat: String {
            get {
              return snapshot["flat"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "flat")
            }
          }

          internal var minCharge: String? {
            get {
              return snapshot["minCharge"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "minCharge")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedMarkupAttribute: SealedMarkupAttribute {
              get {
                return SealedMarkupAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct MarkupAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct FundingSourceAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

internal final class ListTransactionsQuery: GraphQLQuery {
  internal static let operationString =
    "query ListTransactions($limit: Int, $nextToken: String, $dateRange: DateRangeInput, $sortOrder: SortOrder) {\n  listTransactions2(limit: $limit, nextToken: $nextToken, dateRange: $dateRange, sortOrder: $sortOrder) {\n    __typename\n    items {\n      __typename\n      ...SealedTransaction\n    }\n    nextToken\n  }\n}"

  internal static var requestString: String { return operationString.appending(SealedTransaction.fragmentString).appending(SealedCurrencyAmountAttribute.fragmentString).appending(SealedTransactionDetailChargeAttribute.fragmentString).appending(SealedMarkupAttribute.fragmentString) }

  internal var limit: Int?
  internal var nextToken: String?
  internal var dateRange: DateRangeInput?
  internal var sortOrder: SortOrder?

  internal init(limit: Int? = nil, nextToken: String? = nil, dateRange: DateRangeInput? = nil, sortOrder: SortOrder? = nil) {
    self.limit = limit
    self.nextToken = nextToken
    self.dateRange = dateRange
    self.sortOrder = sortOrder
  }

  internal var variables: GraphQLMap? {
    return ["limit": limit, "nextToken": nextToken, "dateRange": dateRange, "sortOrder": sortOrder]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("listTransactions2", arguments: ["limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken"), "dateRange": GraphQLVariable("dateRange"), "sortOrder": GraphQLVariable("sortOrder")], type: .nonNull(.object(ListTransactions2.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(listTransactions2: ListTransactions2) {
      self.init(snapshot: ["__typename": "Query", "listTransactions2": listTransactions2.snapshot])
    }

    internal var listTransactions2: ListTransactions2 {
      get {
        return ListTransactions2(snapshot: snapshot["listTransactions2"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "listTransactions2")
      }
    }

    internal struct ListTransactions2: GraphQLSelectionSet {
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
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("cardId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("sequenceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
          GraphQLField("transactedAtEpochMs", type: .nonNull(.scalar(String.self))),
          GraphQLField("settledAtEpochMs", type: .scalar(String.self)),
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

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
          self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var sortDateEpochMs: Double {
          get {
            return snapshot["sortDateEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "sortDateEpochMs")
          }
        }

        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        internal var cardId: GraphQLID {
          get {
            return snapshot["cardId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardId")
          }
        }

        internal var sequenceId: GraphQLID {
          get {
            return snapshot["sequenceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "sequenceId")
          }
        }

        internal var type: TransactionType {
          get {
            return snapshot["type"]! as! TransactionType
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        internal var transactedAtEpochMs: String {
          get {
            return snapshot["transactedAtEpochMs"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "transactedAtEpochMs")
          }
        }

        internal var settledAtEpochMs: String? {
          get {
            return snapshot["settledAtEpochMs"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "settledAtEpochMs")
          }
        }

        internal var billedAmount: BilledAmount {
          get {
            return BilledAmount(snapshot: snapshot["billedAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "billedAmount")
          }
        }

        internal var transactedAmount: TransactedAmount {
          get {
            return TransactedAmount(snapshot: snapshot["transactedAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "transactedAmount")
          }
        }

        internal var description: String {
          get {
            return snapshot["description"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "description")
          }
        }

        internal var declineReason: String? {
          get {
            return snapshot["declineReason"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "declineReason")
          }
        }

        internal var detail: [Detail]? {
          get {
            return (snapshot["detail"] as? [Snapshot]).flatMap { $0.map { Detail(snapshot: $0) } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "detail")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedTransaction: SealedTransaction {
            get {
              return SealedTransaction(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct BilledAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct TransactedAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct Detail: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedTransactionDetailChargeAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("virtualCardAmount", type: .nonNull(.object(VirtualCardAmount.selections))),
            GraphQLField("markup", type: .nonNull(.object(Markup.selections))),
            GraphQLField("markupAmount", type: .nonNull(.object(MarkupAmount.selections))),
            GraphQLField("fundingSourceAmount", type: .nonNull(.object(FundingSourceAmount.selections))),
            GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("state", type: .scalar(String.self)),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(virtualCardAmount: VirtualCardAmount, markup: Markup, markupAmount: MarkupAmount, fundingSourceAmount: FundingSourceAmount, fundingSourceId: GraphQLID, description: String, state: String? = nil) {
            self.init(snapshot: ["__typename": "SealedTransactionDetailChargeAttribute", "virtualCardAmount": virtualCardAmount.snapshot, "markup": markup.snapshot, "markupAmount": markupAmount.snapshot, "fundingSourceAmount": fundingSourceAmount.snapshot, "fundingSourceId": fundingSourceId, "description": description, "state": state])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var virtualCardAmount: VirtualCardAmount {
            get {
              return VirtualCardAmount(snapshot: snapshot["virtualCardAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "virtualCardAmount")
            }
          }

          internal var markup: Markup {
            get {
              return Markup(snapshot: snapshot["markup"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "markup")
            }
          }

          internal var markupAmount: MarkupAmount {
            get {
              return MarkupAmount(snapshot: snapshot["markupAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "markupAmount")
            }
          }

          internal var fundingSourceAmount: FundingSourceAmount {
            get {
              return FundingSourceAmount(snapshot: snapshot["fundingSourceAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "fundingSourceAmount")
            }
          }

          internal var fundingSourceId: GraphQLID {
            get {
              return snapshot["fundingSourceId"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "fundingSourceId")
            }
          }

          internal var description: String {
            get {
              return snapshot["description"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "description")
            }
          }

          internal var state: String? {
            get {
              return snapshot["state"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedTransactionDetailChargeAttribute: SealedTransactionDetailChargeAttribute {
              get {
                return SealedTransactionDetailChargeAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          internal struct VirtualCardAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct Markup: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedMarkupAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var percent: String {
              get {
                return snapshot["percent"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "percent")
              }
            }

            internal var flat: String {
              get {
                return snapshot["flat"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "flat")
              }
            }

            internal var minCharge: String? {
              get {
                return snapshot["minCharge"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "minCharge")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedMarkupAttribute: SealedMarkupAttribute {
                get {
                  return SealedMarkupAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct MarkupAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct FundingSourceAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }
        }
      }
    }
  }
}

internal final class ListTransactionsByCardIdQuery: GraphQLQuery {
  internal static let operationString =
    "query ListTransactionsByCardId($cardId: ID!, $limit: Int, $nextToken: String, $dateRange: DateRangeInput, $sortOrder: SortOrder) {\n  listTransactionsByCardId2(cardId: $cardId, limit: $limit, nextToken: $nextToken, dateRange: $dateRange, sortOrder: $sortOrder) {\n    __typename\n    items {\n      __typename\n      ...SealedTransaction\n    }\n    nextToken\n  }\n}"

  internal static var requestString: String { return operationString.appending(SealedTransaction.fragmentString).appending(SealedCurrencyAmountAttribute.fragmentString).appending(SealedTransactionDetailChargeAttribute.fragmentString).appending(SealedMarkupAttribute.fragmentString) }

  internal var cardId: GraphQLID
  internal var limit: Int?
  internal var nextToken: String?
  internal var dateRange: DateRangeInput?
  internal var sortOrder: SortOrder?

  internal init(cardId: GraphQLID, limit: Int? = nil, nextToken: String? = nil, dateRange: DateRangeInput? = nil, sortOrder: SortOrder? = nil) {
    self.cardId = cardId
    self.limit = limit
    self.nextToken = nextToken
    self.dateRange = dateRange
    self.sortOrder = sortOrder
  }

  internal var variables: GraphQLMap? {
    return ["cardId": cardId, "limit": limit, "nextToken": nextToken, "dateRange": dateRange, "sortOrder": sortOrder]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("listTransactionsByCardId2", arguments: ["cardId": GraphQLVariable("cardId"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken"), "dateRange": GraphQLVariable("dateRange"), "sortOrder": GraphQLVariable("sortOrder")], type: .nonNull(.object(ListTransactionsByCardId2.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(listTransactionsByCardId2: ListTransactionsByCardId2) {
      self.init(snapshot: ["__typename": "Query", "listTransactionsByCardId2": listTransactionsByCardId2.snapshot])
    }

    internal var listTransactionsByCardId2: ListTransactionsByCardId2 {
      get {
        return ListTransactionsByCardId2(snapshot: snapshot["listTransactionsByCardId2"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "listTransactionsByCardId2")
      }
    }

    internal struct ListTransactionsByCardId2: GraphQLSelectionSet {
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
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("cardId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("sequenceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
          GraphQLField("transactedAtEpochMs", type: .nonNull(.scalar(String.self))),
          GraphQLField("settledAtEpochMs", type: .scalar(String.self)),
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

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
          self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var sortDateEpochMs: Double {
          get {
            return snapshot["sortDateEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "sortDateEpochMs")
          }
        }

        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        internal var cardId: GraphQLID {
          get {
            return snapshot["cardId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardId")
          }
        }

        internal var sequenceId: GraphQLID {
          get {
            return snapshot["sequenceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "sequenceId")
          }
        }

        internal var type: TransactionType {
          get {
            return snapshot["type"]! as! TransactionType
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        internal var transactedAtEpochMs: String {
          get {
            return snapshot["transactedAtEpochMs"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "transactedAtEpochMs")
          }
        }

        internal var settledAtEpochMs: String? {
          get {
            return snapshot["settledAtEpochMs"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "settledAtEpochMs")
          }
        }

        internal var billedAmount: BilledAmount {
          get {
            return BilledAmount(snapshot: snapshot["billedAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "billedAmount")
          }
        }

        internal var transactedAmount: TransactedAmount {
          get {
            return TransactedAmount(snapshot: snapshot["transactedAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "transactedAmount")
          }
        }

        internal var description: String {
          get {
            return snapshot["description"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "description")
          }
        }

        internal var declineReason: String? {
          get {
            return snapshot["declineReason"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "declineReason")
          }
        }

        internal var detail: [Detail]? {
          get {
            return (snapshot["detail"] as? [Snapshot]).flatMap { $0.map { Detail(snapshot: $0) } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "detail")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedTransaction: SealedTransaction {
            get {
              return SealedTransaction(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct BilledAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct TransactedAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct Detail: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedTransactionDetailChargeAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("virtualCardAmount", type: .nonNull(.object(VirtualCardAmount.selections))),
            GraphQLField("markup", type: .nonNull(.object(Markup.selections))),
            GraphQLField("markupAmount", type: .nonNull(.object(MarkupAmount.selections))),
            GraphQLField("fundingSourceAmount", type: .nonNull(.object(FundingSourceAmount.selections))),
            GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("state", type: .scalar(String.self)),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(virtualCardAmount: VirtualCardAmount, markup: Markup, markupAmount: MarkupAmount, fundingSourceAmount: FundingSourceAmount, fundingSourceId: GraphQLID, description: String, state: String? = nil) {
            self.init(snapshot: ["__typename": "SealedTransactionDetailChargeAttribute", "virtualCardAmount": virtualCardAmount.snapshot, "markup": markup.snapshot, "markupAmount": markupAmount.snapshot, "fundingSourceAmount": fundingSourceAmount.snapshot, "fundingSourceId": fundingSourceId, "description": description, "state": state])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var virtualCardAmount: VirtualCardAmount {
            get {
              return VirtualCardAmount(snapshot: snapshot["virtualCardAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "virtualCardAmount")
            }
          }

          internal var markup: Markup {
            get {
              return Markup(snapshot: snapshot["markup"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "markup")
            }
          }

          internal var markupAmount: MarkupAmount {
            get {
              return MarkupAmount(snapshot: snapshot["markupAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "markupAmount")
            }
          }

          internal var fundingSourceAmount: FundingSourceAmount {
            get {
              return FundingSourceAmount(snapshot: snapshot["fundingSourceAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "fundingSourceAmount")
            }
          }

          internal var fundingSourceId: GraphQLID {
            get {
              return snapshot["fundingSourceId"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "fundingSourceId")
            }
          }

          internal var description: String {
            get {
              return snapshot["description"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "description")
            }
          }

          internal var state: String? {
            get {
              return snapshot["state"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedTransactionDetailChargeAttribute: SealedTransactionDetailChargeAttribute {
              get {
                return SealedTransactionDetailChargeAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          internal struct VirtualCardAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct Markup: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedMarkupAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var percent: String {
              get {
                return snapshot["percent"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "percent")
              }
            }

            internal var flat: String {
              get {
                return snapshot["flat"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "flat")
              }
            }

            internal var minCharge: String? {
              get {
                return snapshot["minCharge"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "minCharge")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedMarkupAttribute: SealedMarkupAttribute {
                get {
                  return SealedMarkupAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct MarkupAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct FundingSourceAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }
        }
      }
    }
  }
}

internal final class ListTransactionsByCardIdAndTypeQuery: GraphQLQuery {
  internal static let operationString =
    "query ListTransactionsByCardIdAndType($cardId: ID!, $transactionType: TransactionType!, $limit: Int, $nextToken: String) {\n  listTransactionsByCardIdAndType(cardId: $cardId, transactionType: $transactionType, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      ...SealedTransaction\n    }\n    nextToken\n  }\n}"

  internal static var requestString: String { return operationString.appending(SealedTransaction.fragmentString).appending(SealedCurrencyAmountAttribute.fragmentString).appending(SealedTransactionDetailChargeAttribute.fragmentString).appending(SealedMarkupAttribute.fragmentString) }

  internal var cardId: GraphQLID
  internal var transactionType: TransactionType
  internal var limit: Int?
  internal var nextToken: String?

  internal init(cardId: GraphQLID, transactionType: TransactionType, limit: Int? = nil, nextToken: String? = nil) {
    self.cardId = cardId
    self.transactionType = transactionType
    self.limit = limit
    self.nextToken = nextToken
  }

  internal var variables: GraphQLMap? {
    return ["cardId": cardId, "transactionType": transactionType, "limit": limit, "nextToken": nextToken]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("listTransactionsByCardIdAndType", arguments: ["cardId": GraphQLVariable("cardId"), "transactionType": GraphQLVariable("transactionType"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .nonNull(.object(ListTransactionsByCardIdAndType.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(listTransactionsByCardIdAndType: ListTransactionsByCardIdAndType) {
      self.init(snapshot: ["__typename": "Query", "listTransactionsByCardIdAndType": listTransactionsByCardIdAndType.snapshot])
    }

    internal var listTransactionsByCardIdAndType: ListTransactionsByCardIdAndType {
      get {
        return ListTransactionsByCardIdAndType(snapshot: snapshot["listTransactionsByCardIdAndType"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "listTransactionsByCardIdAndType")
      }
    }

    internal struct ListTransactionsByCardIdAndType: GraphQLSelectionSet {
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
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("cardId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("sequenceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
          GraphQLField("transactedAtEpochMs", type: .nonNull(.scalar(String.self))),
          GraphQLField("settledAtEpochMs", type: .scalar(String.self)),
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

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
          self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var sortDateEpochMs: Double {
          get {
            return snapshot["sortDateEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "sortDateEpochMs")
          }
        }

        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        internal var cardId: GraphQLID {
          get {
            return snapshot["cardId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardId")
          }
        }

        internal var sequenceId: GraphQLID {
          get {
            return snapshot["sequenceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "sequenceId")
          }
        }

        internal var type: TransactionType {
          get {
            return snapshot["type"]! as! TransactionType
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        internal var transactedAtEpochMs: String {
          get {
            return snapshot["transactedAtEpochMs"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "transactedAtEpochMs")
          }
        }

        internal var settledAtEpochMs: String? {
          get {
            return snapshot["settledAtEpochMs"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "settledAtEpochMs")
          }
        }

        internal var billedAmount: BilledAmount {
          get {
            return BilledAmount(snapshot: snapshot["billedAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "billedAmount")
          }
        }

        internal var transactedAmount: TransactedAmount {
          get {
            return TransactedAmount(snapshot: snapshot["transactedAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "transactedAmount")
          }
        }

        internal var description: String {
          get {
            return snapshot["description"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "description")
          }
        }

        internal var declineReason: String? {
          get {
            return snapshot["declineReason"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "declineReason")
          }
        }

        internal var detail: [Detail]? {
          get {
            return (snapshot["detail"] as? [Snapshot]).flatMap { $0.map { Detail(snapshot: $0) } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "detail")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedTransaction: SealedTransaction {
            get {
              return SealedTransaction(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct BilledAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct TransactedAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct Detail: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedTransactionDetailChargeAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("virtualCardAmount", type: .nonNull(.object(VirtualCardAmount.selections))),
            GraphQLField("markup", type: .nonNull(.object(Markup.selections))),
            GraphQLField("markupAmount", type: .nonNull(.object(MarkupAmount.selections))),
            GraphQLField("fundingSourceAmount", type: .nonNull(.object(FundingSourceAmount.selections))),
            GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("state", type: .scalar(String.self)),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(virtualCardAmount: VirtualCardAmount, markup: Markup, markupAmount: MarkupAmount, fundingSourceAmount: FundingSourceAmount, fundingSourceId: GraphQLID, description: String, state: String? = nil) {
            self.init(snapshot: ["__typename": "SealedTransactionDetailChargeAttribute", "virtualCardAmount": virtualCardAmount.snapshot, "markup": markup.snapshot, "markupAmount": markupAmount.snapshot, "fundingSourceAmount": fundingSourceAmount.snapshot, "fundingSourceId": fundingSourceId, "description": description, "state": state])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var virtualCardAmount: VirtualCardAmount {
            get {
              return VirtualCardAmount(snapshot: snapshot["virtualCardAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "virtualCardAmount")
            }
          }

          internal var markup: Markup {
            get {
              return Markup(snapshot: snapshot["markup"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "markup")
            }
          }

          internal var markupAmount: MarkupAmount {
            get {
              return MarkupAmount(snapshot: snapshot["markupAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "markupAmount")
            }
          }

          internal var fundingSourceAmount: FundingSourceAmount {
            get {
              return FundingSourceAmount(snapshot: snapshot["fundingSourceAmount"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "fundingSourceAmount")
            }
          }

          internal var fundingSourceId: GraphQLID {
            get {
              return snapshot["fundingSourceId"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "fundingSourceId")
            }
          }

          internal var description: String {
            get {
              return snapshot["description"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "description")
            }
          }

          internal var state: String? {
            get {
              return snapshot["state"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedTransactionDetailChargeAttribute: SealedTransactionDetailChargeAttribute {
              get {
                return SealedTransactionDetailChargeAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          internal struct VirtualCardAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct Markup: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedMarkupAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var percent: String {
              get {
                return snapshot["percent"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "percent")
              }
            }

            internal var flat: String {
              get {
                return snapshot["flat"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "flat")
              }
            }

            internal var minCharge: String? {
              get {
                return snapshot["minCharge"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "minCharge")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedMarkupAttribute: SealedMarkupAttribute {
                get {
                  return SealedMarkupAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct MarkupAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }

          internal struct FundingSourceAmount: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

            internal var currency: String {
              get {
                return snapshot["currency"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "currency")
              }
            }

            internal var amount: String {
              get {
                return snapshot["amount"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "amount")
              }
            }

            internal var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            internal struct Fragments {
              internal var snapshot: Snapshot

              internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
                get {
                  return SealedCurrencyAmountAttribute(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }
        }
      }
    }
  }
}

internal final class SandboxGetPlaidDataQuery: GraphQLQuery {
  internal static let operationString =
    "query SandboxGetPlaidData($input: SandboxGetPlaidDataRequest!) {\n  sandboxGetPlaidData(input: $input) {\n    __typename\n    accountMetadata {\n      __typename\n      accountId\n      subtype\n    }\n    publicToken\n  }\n}"

  internal var input: SandboxGetPlaidDataRequest

  internal init(input: SandboxGetPlaidDataRequest) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("sandboxGetPlaidData", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(SandboxGetPlaidDatum.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(sandboxGetPlaidData: SandboxGetPlaidDatum) {
      self.init(snapshot: ["__typename": "Query", "sandboxGetPlaidData": sandboxGetPlaidData.snapshot])
    }

    /// Generates and returns the Plaid internal token and bank account id
    /// required to provide information to build the bank account funding source completion data. Allows testing without engaging full Plaid
    /// flow.
    /// 
    /// SANDBOX ONLY
    internal var sandboxGetPlaidData: SandboxGetPlaidDatum {
      get {
        return SandboxGetPlaidDatum(snapshot: snapshot["sandboxGetPlaidData"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "sandboxGetPlaidData")
      }
    }

    internal struct SandboxGetPlaidDatum: GraphQLSelectionSet {
      internal static let possibleTypes = ["SandboxGetPlaidDataResponse"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("accountMetadata", type: .nonNull(.list(.nonNull(.object(AccountMetadatum.selections))))),
        GraphQLField("publicToken", type: .nonNull(.scalar(String.self))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(accountMetadata: [AccountMetadatum], publicToken: String) {
        self.init(snapshot: ["__typename": "SandboxGetPlaidDataResponse", "accountMetadata": accountMetadata.map { $0.snapshot }, "publicToken": publicToken])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Metadata of the bank account including ID and subtype.
      internal var accountMetadata: [AccountMetadatum] {
        get {
          return (snapshot["accountMetadata"] as! [Snapshot]).map { AccountMetadatum(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "accountMetadata")
        }
      }

      /// The internal token that is required to build completion data for creating
      /// a bank account funding source.
      internal var publicToken: String {
        get {
          return snapshot["publicToken"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "publicToken")
        }
      }

      internal struct AccountMetadatum: GraphQLSelectionSet {
        internal static let possibleTypes = ["PlaidAccountMetadata"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("accountId", type: .nonNull(.scalar(String.self))),
          GraphQLField("subtype", type: .scalar(String.self)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(accountId: String, subtype: String? = nil) {
          self.init(snapshot: ["__typename": "PlaidAccountMetadata", "accountId": accountId, "subtype": subtype])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// ID of the bank account.
        internal var accountId: String {
          get {
            return snapshot["accountId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "accountId")
          }
        }

        /// Bank account subtype. E.g. checking, saving etc.
        internal var subtype: String? {
          get {
            return snapshot["subtype"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "subtype")
          }
        }
      }
    }
  }
}

internal final class OnTransactionUpdateSubscription: GraphQLSubscription {
  internal static let operationString =
    "subscription OnTransactionUpdate($owner: ID!) {\n  onTransactionUpdate(owner: $owner) {\n    __typename\n    ...SealedTransaction\n  }\n}"

  internal static var requestString: String { return operationString.appending(SealedTransaction.fragmentString).appending(SealedCurrencyAmountAttribute.fragmentString).appending(SealedTransactionDetailChargeAttribute.fragmentString).appending(SealedMarkupAttribute.fragmentString) }

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
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("cardId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("sequenceId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
        GraphQLField("transactedAtEpochMs", type: .nonNull(.scalar(String.self))),
        GraphQLField("settledAtEpochMs", type: .scalar(String.self)),
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

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
        self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      internal var sortDateEpochMs: Double {
        get {
          return snapshot["sortDateEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "sortDateEpochMs")
        }
      }

      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      internal var cardId: GraphQLID {
        get {
          return snapshot["cardId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cardId")
        }
      }

      internal var sequenceId: GraphQLID {
        get {
          return snapshot["sequenceId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "sequenceId")
        }
      }

      internal var type: TransactionType {
        get {
          return snapshot["type"]! as! TransactionType
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      internal var transactedAtEpochMs: String {
        get {
          return snapshot["transactedAtEpochMs"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "transactedAtEpochMs")
        }
      }

      internal var settledAtEpochMs: String? {
        get {
          return snapshot["settledAtEpochMs"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "settledAtEpochMs")
        }
      }

      internal var billedAmount: BilledAmount {
        get {
          return BilledAmount(snapshot: snapshot["billedAmount"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "billedAmount")
        }
      }

      internal var transactedAmount: TransactedAmount {
        get {
          return TransactedAmount(snapshot: snapshot["transactedAmount"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "transactedAmount")
        }
      }

      internal var description: String {
        get {
          return snapshot["description"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      internal var declineReason: String? {
        get {
          return snapshot["declineReason"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "declineReason")
        }
      }

      internal var detail: [Detail]? {
        get {
          return (snapshot["detail"] as? [Snapshot]).flatMap { $0.map { Detail(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "detail")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var sealedTransaction: SealedTransaction {
          get {
            return SealedTransaction(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      internal struct BilledAmount: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var amount: String {
          get {
            return snapshot["amount"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "amount")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
            get {
              return SealedCurrencyAmountAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct TransactedAmount: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var amount: String {
          get {
            return snapshot["amount"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "amount")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
            get {
              return SealedCurrencyAmountAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct Detail: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedTransactionDetailChargeAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("virtualCardAmount", type: .nonNull(.object(VirtualCardAmount.selections))),
          GraphQLField("markup", type: .nonNull(.object(Markup.selections))),
          GraphQLField("markupAmount", type: .nonNull(.object(MarkupAmount.selections))),
          GraphQLField("fundingSourceAmount", type: .nonNull(.object(FundingSourceAmount.selections))),
          GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .scalar(String.self)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(virtualCardAmount: VirtualCardAmount, markup: Markup, markupAmount: MarkupAmount, fundingSourceAmount: FundingSourceAmount, fundingSourceId: GraphQLID, description: String, state: String? = nil) {
          self.init(snapshot: ["__typename": "SealedTransactionDetailChargeAttribute", "virtualCardAmount": virtualCardAmount.snapshot, "markup": markup.snapshot, "markupAmount": markupAmount.snapshot, "fundingSourceAmount": fundingSourceAmount.snapshot, "fundingSourceId": fundingSourceId, "description": description, "state": state])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var virtualCardAmount: VirtualCardAmount {
          get {
            return VirtualCardAmount(snapshot: snapshot["virtualCardAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "virtualCardAmount")
          }
        }

        internal var markup: Markup {
          get {
            return Markup(snapshot: snapshot["markup"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "markup")
          }
        }

        internal var markupAmount: MarkupAmount {
          get {
            return MarkupAmount(snapshot: snapshot["markupAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "markupAmount")
          }
        }

        internal var fundingSourceAmount: FundingSourceAmount {
          get {
            return FundingSourceAmount(snapshot: snapshot["fundingSourceAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "fundingSourceAmount")
          }
        }

        internal var fundingSourceId: GraphQLID {
          get {
            return snapshot["fundingSourceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fundingSourceId")
          }
        }

        internal var description: String {
          get {
            return snapshot["description"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "description")
          }
        }

        internal var state: String? {
          get {
            return snapshot["state"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedTransactionDetailChargeAttribute: SealedTransactionDetailChargeAttribute {
            get {
              return SealedTransactionDetailChargeAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct VirtualCardAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct Markup: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedMarkupAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var percent: String {
            get {
              return snapshot["percent"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "percent")
            }
          }

          internal var flat: String {
            get {
              return snapshot["flat"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "flat")
            }
          }

          internal var minCharge: String? {
            get {
              return snapshot["minCharge"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "minCharge")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedMarkupAttribute: SealedMarkupAttribute {
              get {
                return SealedMarkupAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct MarkupAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct FundingSourceAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

internal final class OnTransactionDeleteSubscription: GraphQLSubscription {
  internal static let operationString =
    "subscription OnTransactionDelete($owner: ID!) {\n  onTransactionDelete(owner: $owner) {\n    __typename\n    ...SealedTransaction\n  }\n}"

  internal static var requestString: String { return operationString.appending(SealedTransaction.fragmentString).appending(SealedCurrencyAmountAttribute.fragmentString).appending(SealedTransactionDetailChargeAttribute.fragmentString).appending(SealedMarkupAttribute.fragmentString) }

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
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("cardId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("sequenceId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
        GraphQLField("transactedAtEpochMs", type: .nonNull(.scalar(String.self))),
        GraphQLField("settledAtEpochMs", type: .scalar(String.self)),
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

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
        self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      internal var sortDateEpochMs: Double {
        get {
          return snapshot["sortDateEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "sortDateEpochMs")
        }
      }

      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      internal var cardId: GraphQLID {
        get {
          return snapshot["cardId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cardId")
        }
      }

      internal var sequenceId: GraphQLID {
        get {
          return snapshot["sequenceId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "sequenceId")
        }
      }

      internal var type: TransactionType {
        get {
          return snapshot["type"]! as! TransactionType
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      internal var transactedAtEpochMs: String {
        get {
          return snapshot["transactedAtEpochMs"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "transactedAtEpochMs")
        }
      }

      internal var settledAtEpochMs: String? {
        get {
          return snapshot["settledAtEpochMs"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "settledAtEpochMs")
        }
      }

      internal var billedAmount: BilledAmount {
        get {
          return BilledAmount(snapshot: snapshot["billedAmount"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "billedAmount")
        }
      }

      internal var transactedAmount: TransactedAmount {
        get {
          return TransactedAmount(snapshot: snapshot["transactedAmount"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "transactedAmount")
        }
      }

      internal var description: String {
        get {
          return snapshot["description"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      internal var declineReason: String? {
        get {
          return snapshot["declineReason"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "declineReason")
        }
      }

      internal var detail: [Detail]? {
        get {
          return (snapshot["detail"] as? [Snapshot]).flatMap { $0.map { Detail(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "detail")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var sealedTransaction: SealedTransaction {
          get {
            return SealedTransaction(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      internal struct BilledAmount: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var amount: String {
          get {
            return snapshot["amount"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "amount")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
            get {
              return SealedCurrencyAmountAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct TransactedAmount: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var amount: String {
          get {
            return snapshot["amount"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "amount")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
            get {
              return SealedCurrencyAmountAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct Detail: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedTransactionDetailChargeAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("virtualCardAmount", type: .nonNull(.object(VirtualCardAmount.selections))),
          GraphQLField("markup", type: .nonNull(.object(Markup.selections))),
          GraphQLField("markupAmount", type: .nonNull(.object(MarkupAmount.selections))),
          GraphQLField("fundingSourceAmount", type: .nonNull(.object(FundingSourceAmount.selections))),
          GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .scalar(String.self)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(virtualCardAmount: VirtualCardAmount, markup: Markup, markupAmount: MarkupAmount, fundingSourceAmount: FundingSourceAmount, fundingSourceId: GraphQLID, description: String, state: String? = nil) {
          self.init(snapshot: ["__typename": "SealedTransactionDetailChargeAttribute", "virtualCardAmount": virtualCardAmount.snapshot, "markup": markup.snapshot, "markupAmount": markupAmount.snapshot, "fundingSourceAmount": fundingSourceAmount.snapshot, "fundingSourceId": fundingSourceId, "description": description, "state": state])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var virtualCardAmount: VirtualCardAmount {
          get {
            return VirtualCardAmount(snapshot: snapshot["virtualCardAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "virtualCardAmount")
          }
        }

        internal var markup: Markup {
          get {
            return Markup(snapshot: snapshot["markup"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "markup")
          }
        }

        internal var markupAmount: MarkupAmount {
          get {
            return MarkupAmount(snapshot: snapshot["markupAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "markupAmount")
          }
        }

        internal var fundingSourceAmount: FundingSourceAmount {
          get {
            return FundingSourceAmount(snapshot: snapshot["fundingSourceAmount"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "fundingSourceAmount")
          }
        }

        internal var fundingSourceId: GraphQLID {
          get {
            return snapshot["fundingSourceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fundingSourceId")
          }
        }

        internal var description: String {
          get {
            return snapshot["description"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "description")
          }
        }

        internal var state: String? {
          get {
            return snapshot["state"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedTransactionDetailChargeAttribute: SealedTransactionDetailChargeAttribute {
            get {
              return SealedTransactionDetailChargeAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct VirtualCardAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct Markup: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedMarkupAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var percent: String {
            get {
              return snapshot["percent"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "percent")
            }
          }

          internal var flat: String {
            get {
              return snapshot["flat"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "flat")
            }
          }

          internal var minCharge: String? {
            get {
              return snapshot["minCharge"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "minCharge")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedMarkupAttribute: SealedMarkupAttribute {
              get {
                return SealedMarkupAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct MarkupAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct FundingSourceAmount: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          internal var amount: String {
            get {
              return snapshot["amount"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "amount")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
              get {
                return SealedCurrencyAmountAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

internal final class OnUpdateCardProvisionStateSubscription: GraphQLSubscription {
  internal static let operationString =
    "subscription OnUpdateCardProvisionState($owner: ID!, $clientRefId: String) {\n  onUpdateCardProvisionState(owner: $owner, clientRefId: $clientRefId) {\n    __typename\n    ...ProvisionalCard\n  }\n}"

  internal static var requestString: String { return operationString.appending(ProvisionalCard.fragmentString).appending(SealedCard.fragmentString).appending(Owner.fragmentString).appending(SealedAddressAttribute.fragmentString).appending(SealedExpiryAttribute.fragmentString).appending(SealedAttribute.fragmentString) }

  internal var owner: GraphQLID
  internal var clientRefId: String?

  internal init(owner: GraphQLID, clientRefId: String? = nil) {
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
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("clientRefId", type: .nonNull(.scalar(String.self))),
        GraphQLField("provisioningState", type: .nonNull(.scalar(ProvisioningState.self))),
        GraphQLField("card", type: .list(.nonNull(.object(Card.selections)))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, clientRefId: String, provisioningState: ProvisioningState, card: [Card]? = nil) {
        self.init(snapshot: ["__typename": "ProvisionalCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "clientRefId": clientRefId, "provisioningState": provisioningState, "card": card.flatMap { $0.map { $0.snapshot } }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      internal var owner: GraphQLID {
        get {
          return snapshot["owner"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      internal var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      internal var createdAtEpochMs: Double {
        get {
          return snapshot["createdAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
        }
      }

      internal var updatedAtEpochMs: Double {
        get {
          return snapshot["updatedAtEpochMs"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
        }
      }

      internal var clientRefId: String {
        get {
          return snapshot["clientRefId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "clientRefId")
        }
      }

      internal var provisioningState: ProvisioningState {
        get {
          return snapshot["provisioningState"]! as! ProvisioningState
        }
        set {
          snapshot.updateValue(newValue, forKey: "provisioningState")
        }
      }

      internal var card: [Card]? {
        get {
          return (snapshot["card"] as? [Snapshot]).flatMap { $0.map { Card(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "card")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var provisionalCard: ProvisionalCard {
          get {
            return ProvisionalCard(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      internal struct Card: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCard"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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
          GraphQLField("alias", type: .scalar(String.self)),
          GraphQLField("pan", type: .nonNull(.scalar(String.self))),
          GraphQLField("csc", type: .nonNull(.scalar(String.self))),
          GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
          GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
          GraphQLField("metadata", type: .object(Metadatum.selections)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, metadata: Metadatum? = nil) {
          self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "metadata": metadata.flatMap { $0.snapshot }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var algorithm: String {
          get {
            return snapshot["algorithm"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "algorithm")
          }
        }

        internal var keyId: String {
          get {
            return snapshot["keyId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyId")
          }
        }

        internal var keyRingId: GraphQLID {
          get {
            return snapshot["keyRingId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "keyRingId")
          }
        }

        internal var owners: [Owner] {
          get {
            return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
          }
        }

        internal var fundingSourceId: GraphQLID {
          get {
            return snapshot["fundingSourceId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fundingSourceId")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var state: CardState {
          get {
            return snapshot["state"]! as! CardState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var activeToEpochMs: Double {
          get {
            return snapshot["activeToEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "activeToEpochMs")
          }
        }

        internal var cancelledAtEpochMs: Double? {
          get {
            return snapshot["cancelledAtEpochMs"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
          }
        }

        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        internal var cardHolder: String {
          get {
            return snapshot["cardHolder"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardHolder")
          }
        }

        internal var alias: String? {
          get {
            return snapshot["alias"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "alias")
          }
        }

        internal var pan: String {
          get {
            return snapshot["pan"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pan")
          }
        }

        internal var csc: String {
          get {
            return snapshot["csc"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "csc")
          }
        }

        internal var billingAddress: BillingAddress? {
          get {
            return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
          }
        }

        internal var expiry: Expiry {
          get {
            return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "expiry")
          }
        }

        internal var metadata: Metadatum? {
          get {
            return (snapshot["metadata"] as? Snapshot).flatMap { Metadatum(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "metadata")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedCard: SealedCard {
            get {
              return SealedCard(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct Owner: GraphQLSelectionSet {
          internal static let possibleTypes = ["Owner"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var owner: Owner {
              get {
                return Owner(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct BillingAddress: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAddressAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAddressAttribute: SealedAddressAttribute {
              get {
                return SealedAddressAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct Expiry: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedExpiryAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedExpiryAttribute: SealedExpiryAttribute {
              get {
                return SealedExpiryAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct Metadatum: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var plainTextType: String {
            get {
              return snapshot["plainTextType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "plainTextType")
            }
          }

          internal var base64EncodedSealedData: String {
            get {
              return snapshot["base64EncodedSealedData"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAttribute: SealedAttribute {
              get {
                return SealedAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

internal final class OnFundingSourceUpdateSubscription: GraphQLSubscription {
  internal static let operationString =
    "subscription OnFundingSourceUpdate($owner: ID!) {\n  onFundingSourceUpdate(owner: $owner) {\n    __typename\n    ... on CreditCardFundingSource {\n      ...CreditCardFundingSource\n    }\n    ... on BankAccountFundingSource {\n      ...BankAccountFundingSource\n    }\n  }\n}"

  internal static var requestString: String { return operationString.appending(CreditCardFundingSource.fragmentString).appending(BankAccountFundingSource.fragmentString).appending(SealedAttribute.fragmentString) }

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
      GraphQLField("onFundingSourceUpdate", arguments: ["owner": GraphQLVariable("owner")], type: .object(OnFundingSourceUpdate.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(onFundingSourceUpdate: OnFundingSourceUpdate? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onFundingSourceUpdate": onFundingSourceUpdate.flatMap { $0.snapshot }])
    }

    internal var onFundingSourceUpdate: OnFundingSourceUpdate? {
      get {
        return (snapshot["onFundingSourceUpdate"] as? Snapshot).flatMap { OnFundingSourceUpdate(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onFundingSourceUpdate")
      }
    }

    internal struct OnFundingSourceUpdate: GraphQLSelectionSet {
      internal static let possibleTypes = ["BankAccountFundingSource", "CreditCardFundingSource"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLTypeCase(
          variants: ["CreditCardFundingSource": AsCreditCardFundingSource.selections, "BankAccountFundingSource": AsBankAccountFundingSource.selections],
          default: [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          ]
        )
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal static func makeCreditCardFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: AsCreditCardFundingSource.TransactionVelocity? = nil, last4: String, network: CreditCardNetwork, cardType: CardType) -> OnFundingSourceUpdate {
        return OnFundingSourceUpdate(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "last4": last4, "network": network, "cardType": cardType])
      }

      internal static func makeBankAccountFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: AsBankAccountFundingSource.TransactionVelocity? = nil, bankAccountType: BankAccountType, authorization: AsBankAccountFundingSource.Authorization, last4: String, institutionName: AsBankAccountFundingSource.InstitutionName, institutionLogo: AsBankAccountFundingSource.InstitutionLogo? = nil) -> OnFundingSourceUpdate {
        return OnFundingSourceUpdate(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "bankAccountType": bankAccountType, "authorization": authorization.snapshot, "last4": last4, "institutionName": institutionName.snapshot, "institutionLogo": institutionLogo.flatMap { $0.snapshot }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var asCreditCardFundingSource: AsCreditCardFundingSource? {
        get {
          if !AsCreditCardFundingSource.possibleTypes.contains(__typename) { return nil }
          return AsCreditCardFundingSource(snapshot: snapshot)
        }
        set {
          guard let newValue = newValue else { return }
          snapshot = newValue.snapshot
        }
      }

      internal struct AsCreditCardFundingSource: GraphQLSelectionSet {
        internal static let possibleTypes = ["CreditCardFundingSource"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("transactionVelocity", type: .object(TransactionVelocity.selections)),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("network", type: .nonNull(.scalar(CreditCardNetwork.self))),
          GraphQLField("cardType", type: .nonNull(.scalar(CardType.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: TransactionVelocity? = nil, last4: String, network: CreditCardNetwork, cardType: CardType) {
          self.init(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "last4": last4, "network": network, "cardType": cardType])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var state: FundingSourceState {
          get {
            return snapshot["state"]! as! FundingSourceState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var transactionVelocity: TransactionVelocity? {
          get {
            return (snapshot["transactionVelocity"] as? Snapshot).flatMap { TransactionVelocity(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "transactionVelocity")
          }
        }

        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        internal var network: CreditCardNetwork {
          get {
            return snapshot["network"]! as! CreditCardNetwork
          }
          set {
            snapshot.updateValue(newValue, forKey: "network")
          }
        }

        internal var cardType: CardType {
          get {
            return snapshot["cardType"]! as! CardType
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardType")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var creditCardFundingSource: CreditCardFundingSource {
            get {
              return CreditCardFundingSource(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct TransactionVelocity: GraphQLSelectionSet {
          internal static let possibleTypes = ["TransactionVelocity"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("maximum", type: .scalar(Int.self)),
            GraphQLField("velocity", type: .list(.nonNull(.scalar(String.self)))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(maximum: Int? = nil, velocity: [String]? = nil) {
            self.init(snapshot: ["__typename": "TransactionVelocity", "maximum": maximum, "velocity": velocity])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var maximum: Int? {
            get {
              return snapshot["maximum"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "maximum")
            }
          }

          internal var velocity: [String]? {
            get {
              return snapshot["velocity"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "velocity")
            }
          }
        }
      }

      internal var asBankAccountFundingSource: AsBankAccountFundingSource? {
        get {
          if !AsBankAccountFundingSource.possibleTypes.contains(__typename) { return nil }
          return AsBankAccountFundingSource(snapshot: snapshot)
        }
        set {
          guard let newValue = newValue else { return }
          snapshot = newValue.snapshot
        }
      }

      internal struct AsBankAccountFundingSource: GraphQLSelectionSet {
        internal static let possibleTypes = ["BankAccountFundingSource"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("transactionVelocity", type: .object(TransactionVelocity.selections)),
          GraphQLField("bankAccountType", type: .nonNull(.scalar(BankAccountType.self))),
          GraphQLField("authorization", type: .nonNull(.object(Authorization.selections))),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("institutionName", type: .nonNull(.object(InstitutionName.selections))),
          GraphQLField("institutionLogo", type: .object(InstitutionLogo.selections)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: TransactionVelocity? = nil, bankAccountType: BankAccountType, authorization: Authorization, last4: String, institutionName: InstitutionName, institutionLogo: InstitutionLogo? = nil) {
          self.init(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "bankAccountType": bankAccountType, "authorization": authorization.snapshot, "last4": last4, "institutionName": institutionName.snapshot, "institutionLogo": institutionLogo.flatMap { $0.snapshot }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        internal var state: FundingSourceState {
          get {
            return snapshot["state"]! as! FundingSourceState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var transactionVelocity: TransactionVelocity? {
          get {
            return (snapshot["transactionVelocity"] as? Snapshot).flatMap { TransactionVelocity(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "transactionVelocity")
          }
        }

        internal var bankAccountType: BankAccountType {
          get {
            return snapshot["bankAccountType"]! as! BankAccountType
          }
          set {
            snapshot.updateValue(newValue, forKey: "bankAccountType")
          }
        }

        internal var authorization: Authorization {
          get {
            return Authorization(snapshot: snapshot["authorization"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "authorization")
          }
        }

        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        internal var institutionName: InstitutionName {
          get {
            return InstitutionName(snapshot: snapshot["institutionName"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "institutionName")
          }
        }

        internal var institutionLogo: InstitutionLogo? {
          get {
            return (snapshot["institutionLogo"] as? Snapshot).flatMap { InstitutionLogo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "institutionLogo")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var bankAccountFundingSource: BankAccountFundingSource {
            get {
              return BankAccountFundingSource(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct TransactionVelocity: GraphQLSelectionSet {
          internal static let possibleTypes = ["TransactionVelocity"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("maximum", type: .scalar(Int.self)),
            GraphQLField("velocity", type: .list(.nonNull(.scalar(String.self)))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(maximum: Int? = nil, velocity: [String]? = nil) {
            self.init(snapshot: ["__typename": "TransactionVelocity", "maximum": maximum, "velocity": velocity])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var maximum: Int? {
            get {
              return snapshot["maximum"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "maximum")
            }
          }

          internal var velocity: [String]? {
            get {
              return snapshot["velocity"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "velocity")
            }
          }
        }

        internal struct Authorization: GraphQLSelectionSet {
          internal static let possibleTypes = ["SignedAuthorizationText"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("language", type: .nonNull(.scalar(String.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("contentType", type: .nonNull(.scalar(String.self))),
            GraphQLField("signature", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("data", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(language: String, content: String, contentType: String, signature: String, keyId: String, algorithm: String, data: String) {
            self.init(snapshot: ["__typename": "SignedAuthorizationText", "language": language, "content": content, "contentType": contentType, "signature": signature, "keyId": keyId, "algorithm": algorithm, "data": data])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var language: String {
            get {
              return snapshot["language"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "language")
            }
          }

          internal var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          internal var contentType: String {
            get {
              return snapshot["contentType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "contentType")
            }
          }

          internal var signature: String {
            get {
              return snapshot["signature"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "signature")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var data: String {
            get {
              return snapshot["data"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "data")
            }
          }
        }

        internal struct InstitutionName: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var plainTextType: String {
            get {
              return snapshot["plainTextType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "plainTextType")
            }
          }

          internal var base64EncodedSealedData: String {
            get {
              return snapshot["base64EncodedSealedData"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAttribute: SealedAttribute {
              get {
                return SealedAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        internal struct InstitutionLogo: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          internal var plainTextType: String {
            get {
              return snapshot["plainTextType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "plainTextType")
            }
          }

          internal var base64EncodedSealedData: String {
            get {
              return snapshot["base64EncodedSealedData"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var sealedAttribute: SealedAttribute {
              get {
                return SealedAttribute(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

internal struct PublicKey: GraphQLFragment {
  internal static let fragmentString =
    "fragment PublicKey on PublicKey {\n  __typename\n  id\n  keyId\n  keyRingId\n  algorithm\n  keyFormat\n  publicKey\n  owner\n  version\n  createdAtEpochMs\n  updatedAtEpochMs\n}"

  internal static let possibleTypes = ["PublicKey"]

  internal static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
    GraphQLField("keyRingId", type: .nonNull(.scalar(String.self))),
    GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
    GraphQLField("keyFormat", type: .scalar(KeyFormat.self)),
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

  internal init(id: GraphQLID, keyId: String, keyRingId: String, algorithm: String, keyFormat: KeyFormat? = nil, publicKey: String, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double) {
    self.init(snapshot: ["__typename": "PublicKey", "id": id, "keyId": keyId, "keyRingId": keyRingId, "algorithm": algorithm, "keyFormat": keyFormat, "publicKey": publicKey, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  internal var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  internal var keyId: String {
    get {
      return snapshot["keyId"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "keyId")
    }
  }

  internal var keyRingId: String {
    get {
      return snapshot["keyRingId"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "keyRingId")
    }
  }

  internal var algorithm: String {
    get {
      return snapshot["algorithm"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "algorithm")
    }
  }

  internal var keyFormat: KeyFormat? {
    get {
      return snapshot["keyFormat"] as? KeyFormat
    }
    set {
      snapshot.updateValue(newValue, forKey: "keyFormat")
    }
  }

  internal var publicKey: String {
    get {
      return snapshot["publicKey"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "publicKey")
    }
  }

  internal var owner: GraphQLID {
    get {
      return snapshot["owner"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "owner")
    }
  }

  internal var version: Int {
    get {
      return snapshot["version"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "version")
    }
  }

  internal var createdAtEpochMs: Double {
    get {
      return snapshot["createdAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
    }
  }

  internal var updatedAtEpochMs: Double {
    get {
      return snapshot["updatedAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
    }
  }
}

internal struct PaginatedPublicKey: GraphQLFragment {
  internal static let fragmentString =
    "fragment PaginatedPublicKey on PaginatedPublicKey {\n  __typename\n  items {\n    __typename\n    ...PublicKey\n  }\n  nextToken\n}"

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
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
      GraphQLField("keyRingId", type: .nonNull(.scalar(String.self))),
      GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
      GraphQLField("keyFormat", type: .scalar(KeyFormat.self)),
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

    internal init(id: GraphQLID, keyId: String, keyRingId: String, algorithm: String, keyFormat: KeyFormat? = nil, publicKey: String, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double) {
      self.init(snapshot: ["__typename": "PublicKey", "id": id, "keyId": keyId, "keyRingId": keyRingId, "algorithm": algorithm, "keyFormat": keyFormat, "publicKey": publicKey, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    internal var keyId: String {
      get {
        return snapshot["keyId"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "keyId")
      }
    }

    internal var keyRingId: String {
      get {
        return snapshot["keyRingId"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "keyRingId")
      }
    }

    internal var algorithm: String {
      get {
        return snapshot["algorithm"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "algorithm")
      }
    }

    internal var keyFormat: KeyFormat? {
      get {
        return snapshot["keyFormat"] as? KeyFormat
      }
      set {
        snapshot.updateValue(newValue, forKey: "keyFormat")
      }
    }

    internal var publicKey: String {
      get {
        return snapshot["publicKey"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "publicKey")
      }
    }

    internal var owner: GraphQLID {
      get {
        return snapshot["owner"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "owner")
      }
    }

    internal var version: Int {
      get {
        return snapshot["version"]! as! Int
      }
      set {
        snapshot.updateValue(newValue, forKey: "version")
      }
    }

    internal var createdAtEpochMs: Double {
      get {
        return snapshot["createdAtEpochMs"]! as! Double
      }
      set {
        snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
      }
    }

    internal var updatedAtEpochMs: Double {
      get {
        return snapshot["updatedAtEpochMs"]! as! Double
      }
      set {
        snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var publicKey: PublicKey {
        get {
          return PublicKey(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }
}

internal struct Owner: GraphQLFragment {
  internal static let fragmentString =
    "fragment Owner on Owner {\n  __typename\n  id\n  issuer\n}"

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

internal struct SealedAttribute: GraphQLFragment {
  internal static let fragmentString =
    "fragment SealedAttribute on SealedAttribute {\n  __typename\n  keyId\n  algorithm\n  plainTextType\n  base64EncodedSealedData\n}"

  internal static let possibleTypes = ["SealedAttribute"]

  internal static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
    GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
    GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
    GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
  ]

  internal var snapshot: Snapshot

  internal init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
    self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  internal var keyId: String {
    get {
      return snapshot["keyId"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "keyId")
    }
  }

  internal var algorithm: String {
    get {
      return snapshot["algorithm"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "algorithm")
    }
  }

  internal var plainTextType: String {
    get {
      return snapshot["plainTextType"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "plainTextType")
    }
  }

  internal var base64EncodedSealedData: String {
    get {
      return snapshot["base64EncodedSealedData"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
    }
  }
}

internal struct ProvisionalFundingSource: GraphQLFragment {
  internal static let fragmentString =
    "fragment ProvisionalFundingSource on ProvisionalFundingSource {\n  __typename\n  id\n  owner\n  version\n  createdAtEpochMs\n  updatedAtEpochMs\n  type\n  provisioningData\n  state\n}"

  internal static let possibleTypes = ["ProvisionalFundingSource"]

  internal static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("version", type: .nonNull(.scalar(Int.self))),
    GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
    GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
    GraphQLField("type", type: .nonNull(.scalar(FundingSourceType.self))),
    GraphQLField("provisioningData", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("state", type: .nonNull(.scalar(ProvisionalFundingSourceState.self))),
  ]

  internal var snapshot: Snapshot

  internal init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, type: FundingSourceType, provisioningData: GraphQLID, state: ProvisionalFundingSourceState) {
    self.init(snapshot: ["__typename": "ProvisionalFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "type": type, "provisioningData": provisioningData, "state": state])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  internal var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  internal var owner: GraphQLID {
    get {
      return snapshot["owner"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "owner")
    }
  }

  internal var version: Int {
    get {
      return snapshot["version"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "version")
    }
  }

  internal var createdAtEpochMs: Double {
    get {
      return snapshot["createdAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
    }
  }

  internal var updatedAtEpochMs: Double {
    get {
      return snapshot["updatedAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
    }
  }

  internal var type: FundingSourceType {
    get {
      return snapshot["type"]! as! FundingSourceType
    }
    set {
      snapshot.updateValue(newValue, forKey: "type")
    }
  }

  internal var provisioningData: GraphQLID {
    get {
      return snapshot["provisioningData"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "provisioningData")
    }
  }

  internal var state: ProvisionalFundingSourceState {
    get {
      return snapshot["state"]! as! ProvisionalFundingSourceState
    }
    set {
      snapshot.updateValue(newValue, forKey: "state")
    }
  }
}

internal struct CreditCardFundingSource: GraphQLFragment {
  internal static let fragmentString =
    "fragment CreditCardFundingSource on CreditCardFundingSource {\n  __typename\n  id\n  owner\n  version\n  createdAtEpochMs\n  updatedAtEpochMs\n  state\n  currency\n  transactionVelocity {\n    __typename\n    maximum\n    velocity\n  }\n  last4\n  network\n  cardType\n}"

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
    GraphQLField("transactionVelocity", type: .object(TransactionVelocity.selections)),
    GraphQLField("last4", type: .nonNull(.scalar(String.self))),
    GraphQLField("network", type: .nonNull(.scalar(CreditCardNetwork.self))),
    GraphQLField("cardType", type: .nonNull(.scalar(CardType.self))),
  ]

  internal var snapshot: Snapshot

  internal init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: TransactionVelocity? = nil, last4: String, network: CreditCardNetwork, cardType: CardType) {
    self.init(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "last4": last4, "network": network, "cardType": cardType])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  internal var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  internal var owner: GraphQLID {
    get {
      return snapshot["owner"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "owner")
    }
  }

  internal var version: Int {
    get {
      return snapshot["version"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "version")
    }
  }

  internal var createdAtEpochMs: Double {
    get {
      return snapshot["createdAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
    }
  }

  internal var updatedAtEpochMs: Double {
    get {
      return snapshot["updatedAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
    }
  }

  internal var state: FundingSourceState {
    get {
      return snapshot["state"]! as! FundingSourceState
    }
    set {
      snapshot.updateValue(newValue, forKey: "state")
    }
  }

  internal var currency: String {
    get {
      return snapshot["currency"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "currency")
    }
  }

  internal var transactionVelocity: TransactionVelocity? {
    get {
      return (snapshot["transactionVelocity"] as? Snapshot).flatMap { TransactionVelocity(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "transactionVelocity")
    }
  }

  internal var last4: String {
    get {
      return snapshot["last4"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "last4")
    }
  }

  internal var network: CreditCardNetwork {
    get {
      return snapshot["network"]! as! CreditCardNetwork
    }
    set {
      snapshot.updateValue(newValue, forKey: "network")
    }
  }

  internal var cardType: CardType {
    get {
      return snapshot["cardType"]! as! CardType
    }
    set {
      snapshot.updateValue(newValue, forKey: "cardType")
    }
  }

  internal struct TransactionVelocity: GraphQLSelectionSet {
    internal static let possibleTypes = ["TransactionVelocity"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("maximum", type: .scalar(Int.self)),
      GraphQLField("velocity", type: .list(.nonNull(.scalar(String.self)))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(maximum: Int? = nil, velocity: [String]? = nil) {
      self.init(snapshot: ["__typename": "TransactionVelocity", "maximum": maximum, "velocity": velocity])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var maximum: Int? {
      get {
        return snapshot["maximum"] as? Int
      }
      set {
        snapshot.updateValue(newValue, forKey: "maximum")
      }
    }

    internal var velocity: [String]? {
      get {
        return snapshot["velocity"] as? [String]
      }
      set {
        snapshot.updateValue(newValue, forKey: "velocity")
      }
    }
  }
}

internal struct BankAccountFundingSource: GraphQLFragment {
  internal static let fragmentString =
    "fragment BankAccountFundingSource on BankAccountFundingSource {\n  __typename\n  id\n  owner\n  version\n  createdAtEpochMs\n  updatedAtEpochMs\n  state\n  currency\n  transactionVelocity {\n    __typename\n    maximum\n    velocity\n  }\n  bankAccountType\n  authorization {\n    __typename\n    language\n    content\n    contentType\n    signature\n    keyId\n    algorithm\n    data\n  }\n  last4\n  institutionName {\n    __typename\n    ...SealedAttribute\n  }\n  institutionLogo {\n    __typename\n    ...SealedAttribute\n  }\n}"

  internal static let possibleTypes = ["BankAccountFundingSource"]

  internal static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("version", type: .nonNull(.scalar(Int.self))),
    GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
    GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
    GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
    GraphQLField("currency", type: .nonNull(.scalar(String.self))),
    GraphQLField("transactionVelocity", type: .object(TransactionVelocity.selections)),
    GraphQLField("bankAccountType", type: .nonNull(.scalar(BankAccountType.self))),
    GraphQLField("authorization", type: .nonNull(.object(Authorization.selections))),
    GraphQLField("last4", type: .nonNull(.scalar(String.self))),
    GraphQLField("institutionName", type: .nonNull(.object(InstitutionName.selections))),
    GraphQLField("institutionLogo", type: .object(InstitutionLogo.selections)),
  ]

  internal var snapshot: Snapshot

  internal init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, transactionVelocity: TransactionVelocity? = nil, bankAccountType: BankAccountType, authorization: Authorization, last4: String, institutionName: InstitutionName, institutionLogo: InstitutionLogo? = nil) {
    self.init(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "transactionVelocity": transactionVelocity.flatMap { $0.snapshot }, "bankAccountType": bankAccountType, "authorization": authorization.snapshot, "last4": last4, "institutionName": institutionName.snapshot, "institutionLogo": institutionLogo.flatMap { $0.snapshot }])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  internal var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  internal var owner: GraphQLID {
    get {
      return snapshot["owner"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "owner")
    }
  }

  internal var version: Int {
    get {
      return snapshot["version"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "version")
    }
  }

  internal var createdAtEpochMs: Double {
    get {
      return snapshot["createdAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
    }
  }

  internal var updatedAtEpochMs: Double {
    get {
      return snapshot["updatedAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
    }
  }

  internal var state: FundingSourceState {
    get {
      return snapshot["state"]! as! FundingSourceState
    }
    set {
      snapshot.updateValue(newValue, forKey: "state")
    }
  }

  internal var currency: String {
    get {
      return snapshot["currency"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "currency")
    }
  }

  internal var transactionVelocity: TransactionVelocity? {
    get {
      return (snapshot["transactionVelocity"] as? Snapshot).flatMap { TransactionVelocity(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "transactionVelocity")
    }
  }

  internal var bankAccountType: BankAccountType {
    get {
      return snapshot["bankAccountType"]! as! BankAccountType
    }
    set {
      snapshot.updateValue(newValue, forKey: "bankAccountType")
    }
  }

  internal var authorization: Authorization {
    get {
      return Authorization(snapshot: snapshot["authorization"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "authorization")
    }
  }

  internal var last4: String {
    get {
      return snapshot["last4"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "last4")
    }
  }

  internal var institutionName: InstitutionName {
    get {
      return InstitutionName(snapshot: snapshot["institutionName"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "institutionName")
    }
  }

  internal var institutionLogo: InstitutionLogo? {
    get {
      return (snapshot["institutionLogo"] as? Snapshot).flatMap { InstitutionLogo(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "institutionLogo")
    }
  }

  internal struct TransactionVelocity: GraphQLSelectionSet {
    internal static let possibleTypes = ["TransactionVelocity"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("maximum", type: .scalar(Int.self)),
      GraphQLField("velocity", type: .list(.nonNull(.scalar(String.self)))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(maximum: Int? = nil, velocity: [String]? = nil) {
      self.init(snapshot: ["__typename": "TransactionVelocity", "maximum": maximum, "velocity": velocity])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var maximum: Int? {
      get {
        return snapshot["maximum"] as? Int
      }
      set {
        snapshot.updateValue(newValue, forKey: "maximum")
      }
    }

    internal var velocity: [String]? {
      get {
        return snapshot["velocity"] as? [String]
      }
      set {
        snapshot.updateValue(newValue, forKey: "velocity")
      }
    }
  }

  internal struct Authorization: GraphQLSelectionSet {
    internal static let possibleTypes = ["SignedAuthorizationText"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("language", type: .nonNull(.scalar(String.self))),
      GraphQLField("content", type: .nonNull(.scalar(String.self))),
      GraphQLField("contentType", type: .nonNull(.scalar(String.self))),
      GraphQLField("signature", type: .nonNull(.scalar(String.self))),
      GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
      GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
      GraphQLField("data", type: .nonNull(.scalar(String.self))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(language: String, content: String, contentType: String, signature: String, keyId: String, algorithm: String, data: String) {
      self.init(snapshot: ["__typename": "SignedAuthorizationText", "language": language, "content": content, "contentType": contentType, "signature": signature, "keyId": keyId, "algorithm": algorithm, "data": data])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var language: String {
      get {
        return snapshot["language"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "language")
      }
    }

    internal var content: String {
      get {
        return snapshot["content"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "content")
      }
    }

    internal var contentType: String {
      get {
        return snapshot["contentType"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "contentType")
      }
    }

    internal var signature: String {
      get {
        return snapshot["signature"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "signature")
      }
    }

    internal var keyId: String {
      get {
        return snapshot["keyId"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "keyId")
      }
    }

    internal var algorithm: String {
      get {
        return snapshot["algorithm"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "algorithm")
      }
    }

    internal var data: String {
      get {
        return snapshot["data"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "data")
      }
    }
  }

  internal struct InstitutionName: GraphQLSelectionSet {
    internal static let possibleTypes = ["SealedAttribute"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
      GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
      GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
      GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
      self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var keyId: String {
      get {
        return snapshot["keyId"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "keyId")
      }
    }

    internal var algorithm: String {
      get {
        return snapshot["algorithm"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "algorithm")
      }
    }

    internal var plainTextType: String {
      get {
        return snapshot["plainTextType"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "plainTextType")
      }
    }

    internal var base64EncodedSealedData: String {
      get {
        return snapshot["base64EncodedSealedData"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var sealedAttribute: SealedAttribute {
        get {
          return SealedAttribute(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }

  internal struct InstitutionLogo: GraphQLSelectionSet {
    internal static let possibleTypes = ["SealedAttribute"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
      GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
      GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
      GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
      self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var keyId: String {
      get {
        return snapshot["keyId"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "keyId")
      }
    }

    internal var algorithm: String {
      get {
        return snapshot["algorithm"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "algorithm")
      }
    }

    internal var plainTextType: String {
      get {
        return snapshot["plainTextType"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "plainTextType")
      }
    }

    internal var base64EncodedSealedData: String {
      get {
        return snapshot["base64EncodedSealedData"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var sealedAttribute: SealedAttribute {
        get {
          return SealedAttribute(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }
}

internal struct ProvisionalCard: GraphQLFragment {
  internal static let fragmentString =
    "fragment ProvisionalCard on ProvisionalCard {\n  __typename\n  id\n  owner\n  version\n  createdAtEpochMs\n  updatedAtEpochMs\n  clientRefId\n  provisioningState\n  card {\n    __typename\n    ...SealedCard\n  }\n}"

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
  ]

  internal var snapshot: Snapshot

  internal init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, clientRefId: String, provisioningState: ProvisioningState, card: [Card]? = nil) {
    self.init(snapshot: ["__typename": "ProvisionalCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "clientRefId": clientRefId, "provisioningState": provisioningState, "card": card.flatMap { $0.map { $0.snapshot } }])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  internal var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  internal var owner: GraphQLID {
    get {
      return snapshot["owner"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "owner")
    }
  }

  internal var version: Int {
    get {
      return snapshot["version"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "version")
    }
  }

  internal var createdAtEpochMs: Double {
    get {
      return snapshot["createdAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
    }
  }

  internal var updatedAtEpochMs: Double {
    get {
      return snapshot["updatedAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
    }
  }

  internal var clientRefId: String {
    get {
      return snapshot["clientRefId"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "clientRefId")
    }
  }

  internal var provisioningState: ProvisioningState {
    get {
      return snapshot["provisioningState"]! as! ProvisioningState
    }
    set {
      snapshot.updateValue(newValue, forKey: "provisioningState")
    }
  }

  internal var card: [Card]? {
    get {
      return (snapshot["card"] as? [Snapshot]).flatMap { $0.map { Card(snapshot: $0) } }
    }
    set {
      snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "card")
    }
  }

  internal struct Card: GraphQLSelectionSet {
    internal static let possibleTypes = ["SealedCard"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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
      GraphQLField("alias", type: .scalar(String.self)),
      GraphQLField("pan", type: .nonNull(.scalar(String.self))),
      GraphQLField("csc", type: .nonNull(.scalar(String.self))),
      GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
      GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
      GraphQLField("metadata", type: .object(Metadatum.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, metadata: Metadatum? = nil) {
      self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "metadata": metadata.flatMap { $0.snapshot }])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    internal var owner: GraphQLID {
      get {
        return snapshot["owner"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "owner")
      }
    }

    internal var version: Int {
      get {
        return snapshot["version"]! as! Int
      }
      set {
        snapshot.updateValue(newValue, forKey: "version")
      }
    }

    internal var createdAtEpochMs: Double {
      get {
        return snapshot["createdAtEpochMs"]! as! Double
      }
      set {
        snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
      }
    }

    internal var updatedAtEpochMs: Double {
      get {
        return snapshot["updatedAtEpochMs"]! as! Double
      }
      set {
        snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
      }
    }

    internal var algorithm: String {
      get {
        return snapshot["algorithm"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "algorithm")
      }
    }

    internal var keyId: String {
      get {
        return snapshot["keyId"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "keyId")
      }
    }

    internal var keyRingId: GraphQLID {
      get {
        return snapshot["keyRingId"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "keyRingId")
      }
    }

    internal var owners: [Owner] {
      get {
        return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
      }
    }

    internal var fundingSourceId: GraphQLID {
      get {
        return snapshot["fundingSourceId"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "fundingSourceId")
      }
    }

    internal var currency: String {
      get {
        return snapshot["currency"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "currency")
      }
    }

    internal var state: CardState {
      get {
        return snapshot["state"]! as! CardState
      }
      set {
        snapshot.updateValue(newValue, forKey: "state")
      }
    }

    internal var activeToEpochMs: Double {
      get {
        return snapshot["activeToEpochMs"]! as! Double
      }
      set {
        snapshot.updateValue(newValue, forKey: "activeToEpochMs")
      }
    }

    internal var cancelledAtEpochMs: Double? {
      get {
        return snapshot["cancelledAtEpochMs"] as? Double
      }
      set {
        snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
      }
    }

    internal var last4: String {
      get {
        return snapshot["last4"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "last4")
      }
    }

    internal var cardHolder: String {
      get {
        return snapshot["cardHolder"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "cardHolder")
      }
    }

    internal var alias: String? {
      get {
        return snapshot["alias"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "alias")
      }
    }

    internal var pan: String {
      get {
        return snapshot["pan"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "pan")
      }
    }

    internal var csc: String {
      get {
        return snapshot["csc"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "csc")
      }
    }

    internal var billingAddress: BillingAddress? {
      get {
        return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
      }
    }

    internal var expiry: Expiry {
      get {
        return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "expiry")
      }
    }

    internal var metadata: Metadatum? {
      get {
        return (snapshot["metadata"] as? Snapshot).flatMap { Metadatum(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "metadata")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var sealedCard: SealedCard {
        get {
          return SealedCard(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    internal struct Owner: GraphQLSelectionSet {
      internal static let possibleTypes = ["Owner"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var owner: Owner {
          get {
            return Owner(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }

    internal struct BillingAddress: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedAddressAttribute"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var sealedAddressAttribute: SealedAddressAttribute {
          get {
            return SealedAddressAttribute(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }

    internal struct Expiry: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedExpiryAttribute"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var sealedExpiryAttribute: SealedExpiryAttribute {
          get {
            return SealedExpiryAttribute(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }

    internal struct Metadatum: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedAttribute"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
        GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
        self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      internal var plainTextType: String {
        get {
          return snapshot["plainTextType"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "plainTextType")
        }
      }

      internal var base64EncodedSealedData: String {
        get {
          return snapshot["base64EncodedSealedData"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var sealedAttribute: SealedAttribute {
          get {
            return SealedAttribute(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

internal struct SealedAddressAttribute: GraphQLFragment {
  internal static let fragmentString =
    "fragment SealedAddressAttribute on SealedAddressAttribute {\n  __typename\n  addressLine1\n  addressLine2\n  city\n  state\n  postalCode\n  country\n}"

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

internal struct SealedExpiryAttribute: GraphQLFragment {
  internal static let fragmentString =
    "fragment SealedExpiryAttribute on SealedExpiryAttribute {\n  __typename\n  mm\n  yyyy\n}"

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

internal struct SealedCard: GraphQLFragment {
  internal static let fragmentString =
    "fragment SealedCard on SealedCard {\n  __typename\n  id\n  owner\n  version\n  createdAtEpochMs\n  updatedAtEpochMs\n  algorithm\n  keyId\n  keyRingId\n  owners {\n    __typename\n    ...Owner\n  }\n  fundingSourceId\n  currency\n  state\n  activeToEpochMs\n  cancelledAtEpochMs\n  last4\n  cardHolder\n  alias\n  pan\n  csc\n  billingAddress {\n    __typename\n    ...SealedAddressAttribute\n  }\n  expiry {\n    __typename\n    ...SealedExpiryAttribute\n  }\n  metadata {\n    __typename\n    ...SealedAttribute\n  }\n}"

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
    GraphQLField("alias", type: .scalar(String.self)),
    GraphQLField("pan", type: .nonNull(.scalar(String.self))),
    GraphQLField("csc", type: .nonNull(.scalar(String.self))),
    GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
    GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
    GraphQLField("metadata", type: .object(Metadatum.selections)),
  ]

  internal var snapshot: Snapshot

  internal init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, metadata: Metadatum? = nil) {
    self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "metadata": metadata.flatMap { $0.snapshot }])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  internal var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  internal var owner: GraphQLID {
    get {
      return snapshot["owner"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "owner")
    }
  }

  internal var version: Int {
    get {
      return snapshot["version"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "version")
    }
  }

  internal var createdAtEpochMs: Double {
    get {
      return snapshot["createdAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
    }
  }

  internal var updatedAtEpochMs: Double {
    get {
      return snapshot["updatedAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
    }
  }

  internal var algorithm: String {
    get {
      return snapshot["algorithm"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "algorithm")
    }
  }

  internal var keyId: String {
    get {
      return snapshot["keyId"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "keyId")
    }
  }

  internal var keyRingId: GraphQLID {
    get {
      return snapshot["keyRingId"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "keyRingId")
    }
  }

  internal var owners: [Owner] {
    get {
      return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
    }
  }

  internal var fundingSourceId: GraphQLID {
    get {
      return snapshot["fundingSourceId"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "fundingSourceId")
    }
  }

  internal var currency: String {
    get {
      return snapshot["currency"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "currency")
    }
  }

  internal var state: CardState {
    get {
      return snapshot["state"]! as! CardState
    }
    set {
      snapshot.updateValue(newValue, forKey: "state")
    }
  }

  internal var activeToEpochMs: Double {
    get {
      return snapshot["activeToEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "activeToEpochMs")
    }
  }

  internal var cancelledAtEpochMs: Double? {
    get {
      return snapshot["cancelledAtEpochMs"] as? Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
    }
  }

  internal var last4: String {
    get {
      return snapshot["last4"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "last4")
    }
  }

  internal var cardHolder: String {
    get {
      return snapshot["cardHolder"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "cardHolder")
    }
  }

  internal var alias: String? {
    get {
      return snapshot["alias"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "alias")
    }
  }

  internal var pan: String {
    get {
      return snapshot["pan"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "pan")
    }
  }

  internal var csc: String {
    get {
      return snapshot["csc"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "csc")
    }
  }

  internal var billingAddress: BillingAddress? {
    get {
      return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
    }
  }

  internal var expiry: Expiry {
    get {
      return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "expiry")
    }
  }

  internal var metadata: Metadatum? {
    get {
      return (snapshot["metadata"] as? Snapshot).flatMap { Metadatum(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "metadata")
    }
  }

  internal struct Owner: GraphQLSelectionSet {
    internal static let possibleTypes = ["Owner"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var owner: Owner {
        get {
          return Owner(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }

  internal struct BillingAddress: GraphQLSelectionSet {
    internal static let possibleTypes = ["SealedAddressAttribute"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var sealedAddressAttribute: SealedAddressAttribute {
        get {
          return SealedAddressAttribute(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }

  internal struct Expiry: GraphQLSelectionSet {
    internal static let possibleTypes = ["SealedExpiryAttribute"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var sealedExpiryAttribute: SealedExpiryAttribute {
        get {
          return SealedExpiryAttribute(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }

  internal struct Metadatum: GraphQLSelectionSet {
    internal static let possibleTypes = ["SealedAttribute"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
      GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
      GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
      GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
      self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var keyId: String {
      get {
        return snapshot["keyId"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "keyId")
      }
    }

    internal var algorithm: String {
      get {
        return snapshot["algorithm"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "algorithm")
      }
    }

    internal var plainTextType: String {
      get {
        return snapshot["plainTextType"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "plainTextType")
      }
    }

    internal var base64EncodedSealedData: String {
      get {
        return snapshot["base64EncodedSealedData"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var sealedAttribute: SealedAttribute {
        get {
          return SealedAttribute(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }
}

internal struct SealedCardWithLastTransaction: GraphQLFragment {
  internal static let fragmentString =
    "fragment SealedCardWithLastTransaction on SealedCard {\n  __typename\n  ...SealedCard\n  lastTransaction {\n    __typename\n    ...SealedTransaction\n  }\n}"

  internal static let possibleTypes = ["SealedCard"]

  internal static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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
    GraphQLField("alias", type: .scalar(String.self)),
    GraphQLField("pan", type: .nonNull(.scalar(String.self))),
    GraphQLField("csc", type: .nonNull(.scalar(String.self))),
    GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
    GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
    GraphQLField("metadata", type: .object(Metadatum.selections)),
    GraphQLField("lastTransaction", type: .object(LastTransaction.selections)),
  ]

  internal var snapshot: Snapshot

  internal init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, metadata: Metadatum? = nil, lastTransaction: LastTransaction? = nil) {
    self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "metadata": metadata.flatMap { $0.snapshot }, "lastTransaction": lastTransaction.flatMap { $0.snapshot }])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  internal var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  internal var owner: GraphQLID {
    get {
      return snapshot["owner"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "owner")
    }
  }

  internal var version: Int {
    get {
      return snapshot["version"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "version")
    }
  }

  internal var createdAtEpochMs: Double {
    get {
      return snapshot["createdAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
    }
  }

  internal var updatedAtEpochMs: Double {
    get {
      return snapshot["updatedAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
    }
  }

  internal var algorithm: String {
    get {
      return snapshot["algorithm"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "algorithm")
    }
  }

  internal var keyId: String {
    get {
      return snapshot["keyId"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "keyId")
    }
  }

  internal var keyRingId: GraphQLID {
    get {
      return snapshot["keyRingId"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "keyRingId")
    }
  }

  internal var owners: [Owner] {
    get {
      return (snapshot["owners"] as! [Snapshot]).map { Owner(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "owners")
    }
  }

  internal var fundingSourceId: GraphQLID {
    get {
      return snapshot["fundingSourceId"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "fundingSourceId")
    }
  }

  internal var currency: String {
    get {
      return snapshot["currency"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "currency")
    }
  }

  internal var state: CardState {
    get {
      return snapshot["state"]! as! CardState
    }
    set {
      snapshot.updateValue(newValue, forKey: "state")
    }
  }

  internal var activeToEpochMs: Double {
    get {
      return snapshot["activeToEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "activeToEpochMs")
    }
  }

  internal var cancelledAtEpochMs: Double? {
    get {
      return snapshot["cancelledAtEpochMs"] as? Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "cancelledAtEpochMs")
    }
  }

  internal var last4: String {
    get {
      return snapshot["last4"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "last4")
    }
  }

  internal var cardHolder: String {
    get {
      return snapshot["cardHolder"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "cardHolder")
    }
  }

  internal var alias: String? {
    get {
      return snapshot["alias"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "alias")
    }
  }

  internal var pan: String {
    get {
      return snapshot["pan"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "pan")
    }
  }

  internal var csc: String {
    get {
      return snapshot["csc"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "csc")
    }
  }

  internal var billingAddress: BillingAddress? {
    get {
      return (snapshot["billingAddress"] as? Snapshot).flatMap { BillingAddress(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "billingAddress")
    }
  }

  internal var expiry: Expiry {
    get {
      return Expiry(snapshot: snapshot["expiry"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "expiry")
    }
  }

  internal var metadata: Metadatum? {
    get {
      return (snapshot["metadata"] as? Snapshot).flatMap { Metadatum(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "metadata")
    }
  }

  internal var lastTransaction: LastTransaction? {
    get {
      return (snapshot["lastTransaction"] as? Snapshot).flatMap { LastTransaction(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "lastTransaction")
    }
  }

  internal var fragments: Fragments {
    get {
      return Fragments(snapshot: snapshot)
    }
    set {
      snapshot += newValue.snapshot
    }
  }

  internal struct Fragments {
    internal var snapshot: Snapshot

    internal var sealedCard: SealedCard {
      get {
        return SealedCard(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }
  }

  internal struct Owner: GraphQLSelectionSet {
    internal static let possibleTypes = ["Owner"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var owner: Owner {
        get {
          return Owner(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }

  internal struct BillingAddress: GraphQLSelectionSet {
    internal static let possibleTypes = ["SealedAddressAttribute"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var sealedAddressAttribute: SealedAddressAttribute {
        get {
          return SealedAddressAttribute(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }

  internal struct Expiry: GraphQLSelectionSet {
    internal static let possibleTypes = ["SealedExpiryAttribute"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var sealedExpiryAttribute: SealedExpiryAttribute {
        get {
          return SealedExpiryAttribute(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }

  internal struct Metadatum: GraphQLSelectionSet {
    internal static let possibleTypes = ["SealedAttribute"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
      GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
      GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
      GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(keyId: String, algorithm: String, plainTextType: String, base64EncodedSealedData: String) {
      self.init(snapshot: ["__typename": "SealedAttribute", "keyId": keyId, "algorithm": algorithm, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var keyId: String {
      get {
        return snapshot["keyId"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "keyId")
      }
    }

    internal var algorithm: String {
      get {
        return snapshot["algorithm"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "algorithm")
      }
    }

    internal var plainTextType: String {
      get {
        return snapshot["plainTextType"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "plainTextType")
      }
    }

    internal var base64EncodedSealedData: String {
      get {
        return snapshot["base64EncodedSealedData"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "base64EncodedSealedData")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var sealedAttribute: SealedAttribute {
        get {
          return SealedAttribute(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }

  internal struct LastTransaction: GraphQLSelectionSet {
    internal static let possibleTypes = ["SealedTransaction"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("version", type: .nonNull(.scalar(Int.self))),
      GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
      GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
      GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
      GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
      GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
      GraphQLField("cardId", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("sequenceId", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
      GraphQLField("transactedAtEpochMs", type: .nonNull(.scalar(String.self))),
      GraphQLField("settledAtEpochMs", type: .scalar(String.self)),
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

    internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
      self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    internal var owner: GraphQLID {
      get {
        return snapshot["owner"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "owner")
      }
    }

    internal var version: Int {
      get {
        return snapshot["version"]! as! Int
      }
      set {
        snapshot.updateValue(newValue, forKey: "version")
      }
    }

    internal var createdAtEpochMs: Double {
      get {
        return snapshot["createdAtEpochMs"]! as! Double
      }
      set {
        snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
      }
    }

    internal var updatedAtEpochMs: Double {
      get {
        return snapshot["updatedAtEpochMs"]! as! Double
      }
      set {
        snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
      }
    }

    internal var sortDateEpochMs: Double {
      get {
        return snapshot["sortDateEpochMs"]! as! Double
      }
      set {
        snapshot.updateValue(newValue, forKey: "sortDateEpochMs")
      }
    }

    internal var algorithm: String {
      get {
        return snapshot["algorithm"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "algorithm")
      }
    }

    internal var keyId: String {
      get {
        return snapshot["keyId"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "keyId")
      }
    }

    internal var cardId: GraphQLID {
      get {
        return snapshot["cardId"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "cardId")
      }
    }

    internal var sequenceId: GraphQLID {
      get {
        return snapshot["sequenceId"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "sequenceId")
      }
    }

    internal var type: TransactionType {
      get {
        return snapshot["type"]! as! TransactionType
      }
      set {
        snapshot.updateValue(newValue, forKey: "type")
      }
    }

    internal var transactedAtEpochMs: String {
      get {
        return snapshot["transactedAtEpochMs"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "transactedAtEpochMs")
      }
    }

    internal var settledAtEpochMs: String? {
      get {
        return snapshot["settledAtEpochMs"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "settledAtEpochMs")
      }
    }

    internal var billedAmount: BilledAmount {
      get {
        return BilledAmount(snapshot: snapshot["billedAmount"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "billedAmount")
      }
    }

    internal var transactedAmount: TransactedAmount {
      get {
        return TransactedAmount(snapshot: snapshot["transactedAmount"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "transactedAmount")
      }
    }

    internal var description: String {
      get {
        return snapshot["description"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "description")
      }
    }

    internal var declineReason: String? {
      get {
        return snapshot["declineReason"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "declineReason")
      }
    }

    internal var detail: [Detail]? {
      get {
        return (snapshot["detail"] as? [Snapshot]).flatMap { $0.map { Detail(snapshot: $0) } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "detail")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var sealedTransaction: SealedTransaction {
        get {
          return SealedTransaction(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    internal struct BilledAmount: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

      internal var currency: String {
        get {
          return snapshot["currency"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      internal var amount: String {
        get {
          return snapshot["amount"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
          get {
            return SealedCurrencyAmountAttribute(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }

    internal struct TransactedAmount: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

      internal var currency: String {
        get {
          return snapshot["currency"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      internal var amount: String {
        get {
          return snapshot["amount"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
          get {
            return SealedCurrencyAmountAttribute(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }

    internal struct Detail: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedTransactionDetailChargeAttribute"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("virtualCardAmount", type: .nonNull(.object(VirtualCardAmount.selections))),
        GraphQLField("markup", type: .nonNull(.object(Markup.selections))),
        GraphQLField("markupAmount", type: .nonNull(.object(MarkupAmount.selections))),
        GraphQLField("fundingSourceAmount", type: .nonNull(.object(FundingSourceAmount.selections))),
        GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("description", type: .nonNull(.scalar(String.self))),
        GraphQLField("state", type: .scalar(String.self)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(virtualCardAmount: VirtualCardAmount, markup: Markup, markupAmount: MarkupAmount, fundingSourceAmount: FundingSourceAmount, fundingSourceId: GraphQLID, description: String, state: String? = nil) {
        self.init(snapshot: ["__typename": "SealedTransactionDetailChargeAttribute", "virtualCardAmount": virtualCardAmount.snapshot, "markup": markup.snapshot, "markupAmount": markupAmount.snapshot, "fundingSourceAmount": fundingSourceAmount.snapshot, "fundingSourceId": fundingSourceId, "description": description, "state": state])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var virtualCardAmount: VirtualCardAmount {
        get {
          return VirtualCardAmount(snapshot: snapshot["virtualCardAmount"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "virtualCardAmount")
        }
      }

      internal var markup: Markup {
        get {
          return Markup(snapshot: snapshot["markup"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "markup")
        }
      }

      internal var markupAmount: MarkupAmount {
        get {
          return MarkupAmount(snapshot: snapshot["markupAmount"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "markupAmount")
        }
      }

      internal var fundingSourceAmount: FundingSourceAmount {
        get {
          return FundingSourceAmount(snapshot: snapshot["fundingSourceAmount"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "fundingSourceAmount")
        }
      }

      internal var fundingSourceId: GraphQLID {
        get {
          return snapshot["fundingSourceId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "fundingSourceId")
        }
      }

      internal var description: String {
        get {
          return snapshot["description"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      internal var state: String? {
        get {
          return snapshot["state"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var sealedTransactionDetailChargeAttribute: SealedTransactionDetailChargeAttribute {
          get {
            return SealedTransactionDetailChargeAttribute(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      internal struct VirtualCardAmount: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var amount: String {
          get {
            return snapshot["amount"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "amount")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
            get {
              return SealedCurrencyAmountAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct Markup: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedMarkupAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var percent: String {
          get {
            return snapshot["percent"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "percent")
          }
        }

        internal var flat: String {
          get {
            return snapshot["flat"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "flat")
          }
        }

        internal var minCharge: String? {
          get {
            return snapshot["minCharge"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "minCharge")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedMarkupAttribute: SealedMarkupAttribute {
            get {
              return SealedMarkupAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct MarkupAmount: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var amount: String {
          get {
            return snapshot["amount"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "amount")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
            get {
              return SealedCurrencyAmountAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal struct FundingSourceAmount: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        internal var amount: String {
          get {
            return snapshot["amount"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "amount")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
            get {
              return SealedCurrencyAmountAttribute(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

internal struct SealedCurrencyAmountAttribute: GraphQLFragment {
  internal static let fragmentString =
    "fragment SealedCurrencyAmountAttribute on SealedCurrencyAmountAttribute {\n  __typename\n  currency\n  amount\n}"

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

  internal var currency: String {
    get {
      return snapshot["currency"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "currency")
    }
  }

  internal var amount: String {
    get {
      return snapshot["amount"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "amount")
    }
  }
}

internal struct SealedMarkupAttribute: GraphQLFragment {
  internal static let fragmentString =
    "fragment SealedMarkupAttribute on SealedMarkupAttribute {\n  __typename\n  percent\n  flat\n  minCharge\n}"

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

  internal var percent: String {
    get {
      return snapshot["percent"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "percent")
    }
  }

  internal var flat: String {
    get {
      return snapshot["flat"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "flat")
    }
  }

  internal var minCharge: String? {
    get {
      return snapshot["minCharge"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "minCharge")
    }
  }
}

internal struct SealedTransactionDetailChargeAttribute: GraphQLFragment {
  internal static let fragmentString =
    "fragment SealedTransactionDetailChargeAttribute on SealedTransactionDetailChargeAttribute {\n  __typename\n  virtualCardAmount {\n    __typename\n    ...SealedCurrencyAmountAttribute\n  }\n  markup {\n    __typename\n    ...SealedMarkupAttribute\n  }\n  markupAmount {\n    __typename\n    ...SealedCurrencyAmountAttribute\n  }\n  fundingSourceAmount {\n    __typename\n    ...SealedCurrencyAmountAttribute\n  }\n  fundingSourceId\n  description\n  state\n}"

  internal static let possibleTypes = ["SealedTransactionDetailChargeAttribute"]

  internal static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("virtualCardAmount", type: .nonNull(.object(VirtualCardAmount.selections))),
    GraphQLField("markup", type: .nonNull(.object(Markup.selections))),
    GraphQLField("markupAmount", type: .nonNull(.object(MarkupAmount.selections))),
    GraphQLField("fundingSourceAmount", type: .nonNull(.object(FundingSourceAmount.selections))),
    GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("description", type: .nonNull(.scalar(String.self))),
    GraphQLField("state", type: .scalar(String.self)),
  ]

  internal var snapshot: Snapshot

  internal init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  internal init(virtualCardAmount: VirtualCardAmount, markup: Markup, markupAmount: MarkupAmount, fundingSourceAmount: FundingSourceAmount, fundingSourceId: GraphQLID, description: String, state: String? = nil) {
    self.init(snapshot: ["__typename": "SealedTransactionDetailChargeAttribute", "virtualCardAmount": virtualCardAmount.snapshot, "markup": markup.snapshot, "markupAmount": markupAmount.snapshot, "fundingSourceAmount": fundingSourceAmount.snapshot, "fundingSourceId": fundingSourceId, "description": description, "state": state])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  internal var virtualCardAmount: VirtualCardAmount {
    get {
      return VirtualCardAmount(snapshot: snapshot["virtualCardAmount"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "virtualCardAmount")
    }
  }

  internal var markup: Markup {
    get {
      return Markup(snapshot: snapshot["markup"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "markup")
    }
  }

  internal var markupAmount: MarkupAmount {
    get {
      return MarkupAmount(snapshot: snapshot["markupAmount"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "markupAmount")
    }
  }

  internal var fundingSourceAmount: FundingSourceAmount {
    get {
      return FundingSourceAmount(snapshot: snapshot["fundingSourceAmount"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "fundingSourceAmount")
    }
  }

  internal var fundingSourceId: GraphQLID {
    get {
      return snapshot["fundingSourceId"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "fundingSourceId")
    }
  }

  internal var description: String {
    get {
      return snapshot["description"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "description")
    }
  }

  internal var state: String? {
    get {
      return snapshot["state"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "state")
    }
  }

  internal struct VirtualCardAmount: GraphQLSelectionSet {
    internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

    internal var currency: String {
      get {
        return snapshot["currency"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "currency")
      }
    }

    internal var amount: String {
      get {
        return snapshot["amount"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "amount")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
        get {
          return SealedCurrencyAmountAttribute(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }

  internal struct Markup: GraphQLSelectionSet {
    internal static let possibleTypes = ["SealedMarkupAttribute"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

    internal var percent: String {
      get {
        return snapshot["percent"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "percent")
      }
    }

    internal var flat: String {
      get {
        return snapshot["flat"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "flat")
      }
    }

    internal var minCharge: String? {
      get {
        return snapshot["minCharge"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "minCharge")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var sealedMarkupAttribute: SealedMarkupAttribute {
        get {
          return SealedMarkupAttribute(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }

  internal struct MarkupAmount: GraphQLSelectionSet {
    internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

    internal var currency: String {
      get {
        return snapshot["currency"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "currency")
      }
    }

    internal var amount: String {
      get {
        return snapshot["amount"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "amount")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
        get {
          return SealedCurrencyAmountAttribute(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }

  internal struct FundingSourceAmount: GraphQLSelectionSet {
    internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

    internal var currency: String {
      get {
        return snapshot["currency"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "currency")
      }
    }

    internal var amount: String {
      get {
        return snapshot["amount"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "amount")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
        get {
          return SealedCurrencyAmountAttribute(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }
}

internal struct SealedTransaction: GraphQLFragment {
  internal static let fragmentString =
    "fragment SealedTransaction on SealedTransaction {\n  __typename\n  id\n  owner\n  version\n  createdAtEpochMs\n  updatedAtEpochMs\n  sortDateEpochMs\n  algorithm\n  keyId\n  cardId\n  sequenceId\n  type\n  transactedAtEpochMs\n  settledAtEpochMs\n  billedAmount {\n    __typename\n    ...SealedCurrencyAmountAttribute\n  }\n  transactedAmount {\n    __typename\n    ...SealedCurrencyAmountAttribute\n  }\n  description\n  declineReason\n  detail {\n    __typename\n    ...SealedTransactionDetailChargeAttribute\n  }\n}"

  internal static let possibleTypes = ["SealedTransaction"]

  internal static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("version", type: .nonNull(.scalar(Int.self))),
    GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
    GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
    GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
    GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
    GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
    GraphQLField("cardId", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("sequenceId", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
    GraphQLField("transactedAtEpochMs", type: .nonNull(.scalar(String.self))),
    GraphQLField("settledAtEpochMs", type: .scalar(String.self)),
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

  internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
    self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  internal var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  internal var owner: GraphQLID {
    get {
      return snapshot["owner"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "owner")
    }
  }

  internal var version: Int {
    get {
      return snapshot["version"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "version")
    }
  }

  internal var createdAtEpochMs: Double {
    get {
      return snapshot["createdAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
    }
  }

  internal var updatedAtEpochMs: Double {
    get {
      return snapshot["updatedAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
    }
  }

  internal var sortDateEpochMs: Double {
    get {
      return snapshot["sortDateEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "sortDateEpochMs")
    }
  }

  internal var algorithm: String {
    get {
      return snapshot["algorithm"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "algorithm")
    }
  }

  internal var keyId: String {
    get {
      return snapshot["keyId"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "keyId")
    }
  }

  internal var cardId: GraphQLID {
    get {
      return snapshot["cardId"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "cardId")
    }
  }

  internal var sequenceId: GraphQLID {
    get {
      return snapshot["sequenceId"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "sequenceId")
    }
  }

  internal var type: TransactionType {
    get {
      return snapshot["type"]! as! TransactionType
    }
    set {
      snapshot.updateValue(newValue, forKey: "type")
    }
  }

  internal var transactedAtEpochMs: String {
    get {
      return snapshot["transactedAtEpochMs"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "transactedAtEpochMs")
    }
  }

  internal var settledAtEpochMs: String? {
    get {
      return snapshot["settledAtEpochMs"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "settledAtEpochMs")
    }
  }

  internal var billedAmount: BilledAmount {
    get {
      return BilledAmount(snapshot: snapshot["billedAmount"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "billedAmount")
    }
  }

  internal var transactedAmount: TransactedAmount {
    get {
      return TransactedAmount(snapshot: snapshot["transactedAmount"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "transactedAmount")
    }
  }

  internal var description: String {
    get {
      return snapshot["description"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "description")
    }
  }

  internal var declineReason: String? {
    get {
      return snapshot["declineReason"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "declineReason")
    }
  }

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

    internal var currency: String {
      get {
        return snapshot["currency"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "currency")
      }
    }

    internal var amount: String {
      get {
        return snapshot["amount"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "amount")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
        get {
          return SealedCurrencyAmountAttribute(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }

  internal struct TransactedAmount: GraphQLSelectionSet {
    internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

    internal var currency: String {
      get {
        return snapshot["currency"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "currency")
      }
    }

    internal var amount: String {
      get {
        return snapshot["amount"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "amount")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
        get {
          return SealedCurrencyAmountAttribute(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }

  internal struct Detail: GraphQLSelectionSet {
    internal static let possibleTypes = ["SealedTransactionDetailChargeAttribute"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("virtualCardAmount", type: .nonNull(.object(VirtualCardAmount.selections))),
      GraphQLField("markup", type: .nonNull(.object(Markup.selections))),
      GraphQLField("markupAmount", type: .nonNull(.object(MarkupAmount.selections))),
      GraphQLField("fundingSourceAmount", type: .nonNull(.object(FundingSourceAmount.selections))),
      GraphQLField("fundingSourceId", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("description", type: .nonNull(.scalar(String.self))),
      GraphQLField("state", type: .scalar(String.self)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(virtualCardAmount: VirtualCardAmount, markup: Markup, markupAmount: MarkupAmount, fundingSourceAmount: FundingSourceAmount, fundingSourceId: GraphQLID, description: String, state: String? = nil) {
      self.init(snapshot: ["__typename": "SealedTransactionDetailChargeAttribute", "virtualCardAmount": virtualCardAmount.snapshot, "markup": markup.snapshot, "markupAmount": markupAmount.snapshot, "fundingSourceAmount": fundingSourceAmount.snapshot, "fundingSourceId": fundingSourceId, "description": description, "state": state])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var virtualCardAmount: VirtualCardAmount {
      get {
        return VirtualCardAmount(snapshot: snapshot["virtualCardAmount"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "virtualCardAmount")
      }
    }

    internal var markup: Markup {
      get {
        return Markup(snapshot: snapshot["markup"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "markup")
      }
    }

    internal var markupAmount: MarkupAmount {
      get {
        return MarkupAmount(snapshot: snapshot["markupAmount"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "markupAmount")
      }
    }

    internal var fundingSourceAmount: FundingSourceAmount {
      get {
        return FundingSourceAmount(snapshot: snapshot["fundingSourceAmount"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "fundingSourceAmount")
      }
    }

    internal var fundingSourceId: GraphQLID {
      get {
        return snapshot["fundingSourceId"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "fundingSourceId")
      }
    }

    internal var description: String {
      get {
        return snapshot["description"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "description")
      }
    }

    internal var state: String? {
      get {
        return snapshot["state"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "state")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var sealedTransactionDetailChargeAttribute: SealedTransactionDetailChargeAttribute {
        get {
          return SealedTransactionDetailChargeAttribute(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    internal struct VirtualCardAmount: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

      internal var currency: String {
        get {
          return snapshot["currency"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      internal var amount: String {
        get {
          return snapshot["amount"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
          get {
            return SealedCurrencyAmountAttribute(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }

    internal struct Markup: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedMarkupAttribute"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

      internal var percent: String {
        get {
          return snapshot["percent"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "percent")
        }
      }

      internal var flat: String {
        get {
          return snapshot["flat"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "flat")
        }
      }

      internal var minCharge: String? {
        get {
          return snapshot["minCharge"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "minCharge")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var sealedMarkupAttribute: SealedMarkupAttribute {
          get {
            return SealedMarkupAttribute(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }

    internal struct MarkupAmount: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

      internal var currency: String {
        get {
          return snapshot["currency"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      internal var amount: String {
        get {
          return snapshot["amount"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
          get {
            return SealedCurrencyAmountAttribute(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }

    internal struct FundingSourceAmount: GraphQLSelectionSet {
      internal static let possibleTypes = ["SealedCurrencyAmountAttribute"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

      internal var currency: String {
        get {
          return snapshot["currency"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      internal var amount: String {
        get {
          return snapshot["amount"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var sealedCurrencyAmountAttribute: SealedCurrencyAmountAttribute {
          get {
            return SealedCurrencyAmountAttribute(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

internal struct FundingSourceSupportDetail: GraphQLFragment {
  internal static let fragmentString =
    "fragment FundingSourceSupportDetail on FundingSourceSupportDetail {\n  __typename\n  cardType\n}"

  internal static let possibleTypes = ["FundingSourceSupportDetail"]

  internal static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("cardType", type: .nonNull(.scalar(CardType.self))),
  ]

  internal var snapshot: Snapshot

  internal init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  internal init(cardType: CardType) {
    self.init(snapshot: ["__typename": "FundingSourceSupportDetail", "cardType": cardType])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  internal var cardType: CardType {
    get {
      return snapshot["cardType"]! as! CardType
    }
    set {
      snapshot.updateValue(newValue, forKey: "cardType")
    }
  }
}

internal struct FundingSourceSupportInfo: GraphQLFragment {
  internal static let fragmentString =
    "fragment FundingSourceSupportInfo on FundingSourceSupportInfo {\n  __typename\n  providerType\n  fundingSourceType\n  network\n  detail {\n    __typename\n    ...FundingSourceSupportDetail\n  }\n}"

  internal static let possibleTypes = ["FundingSourceSupportInfo"]

  internal static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("providerType", type: .nonNull(.scalar(String.self))),
    GraphQLField("fundingSourceType", type: .nonNull(.scalar(String.self))),
    GraphQLField("network", type: .nonNull(.scalar(String.self))),
    GraphQLField("detail", type: .nonNull(.list(.nonNull(.object(Detail.selections))))),
  ]

  internal var snapshot: Snapshot

  internal init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  internal init(providerType: String, fundingSourceType: String, network: String, detail: [Detail]) {
    self.init(snapshot: ["__typename": "FundingSourceSupportInfo", "providerType": providerType, "fundingSourceType": fundingSourceType, "network": network, "detail": detail.map { $0.snapshot }])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  internal var providerType: String {
    get {
      return snapshot["providerType"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "providerType")
    }
  }

  internal var fundingSourceType: String {
    get {
      return snapshot["fundingSourceType"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "fundingSourceType")
    }
  }

  internal var network: String {
    get {
      return snapshot["network"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "network")
    }
  }

  internal var detail: [Detail] {
    get {
      return (snapshot["detail"] as! [Snapshot]).map { Detail(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "detail")
    }
  }

  internal struct Detail: GraphQLSelectionSet {
    internal static let possibleTypes = ["FundingSourceSupportDetail"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("cardType", type: .nonNull(.scalar(CardType.self))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(cardType: CardType) {
      self.init(snapshot: ["__typename": "FundingSourceSupportDetail", "cardType": cardType])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var cardType: CardType {
      get {
        return snapshot["cardType"]! as! CardType
      }
      set {
        snapshot.updateValue(newValue, forKey: "cardType")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var fundingSourceSupportDetail: FundingSourceSupportDetail {
        get {
          return FundingSourceSupportDetail(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }
}

internal struct VirtualCardsConfig: GraphQLFragment {
  internal static let fragmentString =
    "fragment VirtualCardsConfig on VirtualCardsConfig {\n  __typename\n  maxFundingSourceVelocity\n  maxFundingSourceFailureVelocity\n  maxCardCreationVelocity\n  maxTransactionVelocity {\n    __typename\n    currency\n    velocity\n  }\n  maxTransactionAmount {\n    __typename\n    currency\n    amount\n  }\n  virtualCardCurrencies\n  fundingSourceSupportInfo {\n    __typename\n    ...FundingSourceSupportInfo\n  }\n  bankAccountFundingSourceExpendableEnabled\n  bankAccountFundingSourceCreationEnabled\n  fundingSourceClientConfiguration {\n    __typename\n    data\n  }\n  clientApplicationsConfiguration {\n    __typename\n    data\n  }\n  pricingPolicy {\n    __typename\n    data\n  }\n}"

  internal static let possibleTypes = ["VirtualCardsConfig"]

  internal static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("maxFundingSourceVelocity", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
    GraphQLField("maxFundingSourceFailureVelocity", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
    GraphQLField("maxCardCreationVelocity", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
    GraphQLField("maxTransactionVelocity", type: .nonNull(.list(.nonNull(.object(MaxTransactionVelocity.selections))))),
    GraphQLField("maxTransactionAmount", type: .nonNull(.list(.nonNull(.object(MaxTransactionAmount.selections))))),
    GraphQLField("virtualCardCurrencies", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
    GraphQLField("fundingSourceSupportInfo", type: .nonNull(.list(.nonNull(.object(FundingSourceSupportInfo.selections))))),
    GraphQLField("bankAccountFundingSourceExpendableEnabled", type: .nonNull(.scalar(Bool.self))),
    GraphQLField("bankAccountFundingSourceCreationEnabled", type: .scalar(Bool.self)),
    GraphQLField("fundingSourceClientConfiguration", type: .object(FundingSourceClientConfiguration.selections)),
    GraphQLField("clientApplicationsConfiguration", type: .object(ClientApplicationsConfiguration.selections)),
    GraphQLField("pricingPolicy", type: .object(PricingPolicy.selections)),
  ]

  internal var snapshot: Snapshot

  internal init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  internal init(maxFundingSourceVelocity: [String], maxFundingSourceFailureVelocity: [String], maxCardCreationVelocity: [String], maxTransactionVelocity: [MaxTransactionVelocity], maxTransactionAmount: [MaxTransactionAmount], virtualCardCurrencies: [String], fundingSourceSupportInfo: [FundingSourceSupportInfo], bankAccountFundingSourceExpendableEnabled: Bool, bankAccountFundingSourceCreationEnabled: Bool? = nil, fundingSourceClientConfiguration: FundingSourceClientConfiguration? = nil, clientApplicationsConfiguration: ClientApplicationsConfiguration? = nil, pricingPolicy: PricingPolicy? = nil) {
    self.init(snapshot: ["__typename": "VirtualCardsConfig", "maxFundingSourceVelocity": maxFundingSourceVelocity, "maxFundingSourceFailureVelocity": maxFundingSourceFailureVelocity, "maxCardCreationVelocity": maxCardCreationVelocity, "maxTransactionVelocity": maxTransactionVelocity.map { $0.snapshot }, "maxTransactionAmount": maxTransactionAmount.map { $0.snapshot }, "virtualCardCurrencies": virtualCardCurrencies, "fundingSourceSupportInfo": fundingSourceSupportInfo.map { $0.snapshot }, "bankAccountFundingSourceExpendableEnabled": bankAccountFundingSourceExpendableEnabled, "bankAccountFundingSourceCreationEnabled": bankAccountFundingSourceCreationEnabled, "fundingSourceClientConfiguration": fundingSourceClientConfiguration.flatMap { $0.snapshot }, "clientApplicationsConfiguration": clientApplicationsConfiguration.flatMap { $0.snapshot }, "pricingPolicy": pricingPolicy.flatMap { $0.snapshot }])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  internal var maxFundingSourceVelocity: [String] {
    get {
      return snapshot["maxFundingSourceVelocity"]! as! [String]
    }
    set {
      snapshot.updateValue(newValue, forKey: "maxFundingSourceVelocity")
    }
  }

  internal var maxFundingSourceFailureVelocity: [String] {
    get {
      return snapshot["maxFundingSourceFailureVelocity"]! as! [String]
    }
    set {
      snapshot.updateValue(newValue, forKey: "maxFundingSourceFailureVelocity")
    }
  }

  internal var maxCardCreationVelocity: [String] {
    get {
      return snapshot["maxCardCreationVelocity"]! as! [String]
    }
    set {
      snapshot.updateValue(newValue, forKey: "maxCardCreationVelocity")
    }
  }

  internal var maxTransactionVelocity: [MaxTransactionVelocity] {
    get {
      return (snapshot["maxTransactionVelocity"] as! [Snapshot]).map { MaxTransactionVelocity(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "maxTransactionVelocity")
    }
  }

  internal var maxTransactionAmount: [MaxTransactionAmount] {
    get {
      return (snapshot["maxTransactionAmount"] as! [Snapshot]).map { MaxTransactionAmount(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "maxTransactionAmount")
    }
  }

  internal var virtualCardCurrencies: [String] {
    get {
      return snapshot["virtualCardCurrencies"]! as! [String]
    }
    set {
      snapshot.updateValue(newValue, forKey: "virtualCardCurrencies")
    }
  }

  internal var fundingSourceSupportInfo: [FundingSourceSupportInfo] {
    get {
      return (snapshot["fundingSourceSupportInfo"] as! [Snapshot]).map { FundingSourceSupportInfo(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "fundingSourceSupportInfo")
    }
  }

  internal var bankAccountFundingSourceExpendableEnabled: Bool {
    get {
      return snapshot["bankAccountFundingSourceExpendableEnabled"]! as! Bool
    }
    set {
      snapshot.updateValue(newValue, forKey: "bankAccountFundingSourceExpendableEnabled")
    }
  }

  internal var bankAccountFundingSourceCreationEnabled: Bool? {
    get {
      return snapshot["bankAccountFundingSourceCreationEnabled"] as? Bool
    }
    set {
      snapshot.updateValue(newValue, forKey: "bankAccountFundingSourceCreationEnabled")
    }
  }

  internal var fundingSourceClientConfiguration: FundingSourceClientConfiguration? {
    get {
      return (snapshot["fundingSourceClientConfiguration"] as? Snapshot).flatMap { FundingSourceClientConfiguration(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "fundingSourceClientConfiguration")
    }
  }

  internal var clientApplicationsConfiguration: ClientApplicationsConfiguration? {
    get {
      return (snapshot["clientApplicationsConfiguration"] as? Snapshot).flatMap { ClientApplicationsConfiguration(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "clientApplicationsConfiguration")
    }
  }

  internal var pricingPolicy: PricingPolicy? {
    get {
      return (snapshot["pricingPolicy"] as? Snapshot).flatMap { PricingPolicy(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "pricingPolicy")
    }
  }

  internal struct MaxTransactionVelocity: GraphQLSelectionSet {
    internal static let possibleTypes = ["CurrencyVelocity"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("currency", type: .nonNull(.scalar(String.self))),
      GraphQLField("velocity", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(currency: String, velocity: [String]) {
      self.init(snapshot: ["__typename": "CurrencyVelocity", "currency": currency, "velocity": velocity])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var currency: String {
      get {
        return snapshot["currency"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "currency")
      }
    }

    internal var velocity: [String] {
      get {
        return snapshot["velocity"]! as! [String]
      }
      set {
        snapshot.updateValue(newValue, forKey: "velocity")
      }
    }
  }

  internal struct MaxTransactionAmount: GraphQLSelectionSet {
    internal static let possibleTypes = ["CurrencyAmount"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("currency", type: .nonNull(.scalar(String.self))),
      GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(currency: String, amount: Int) {
      self.init(snapshot: ["__typename": "CurrencyAmount", "currency": currency, "amount": amount])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var currency: String {
      get {
        return snapshot["currency"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "currency")
      }
    }

    internal var amount: Int {
      get {
        return snapshot["amount"]! as! Int
      }
      set {
        snapshot.updateValue(newValue, forKey: "amount")
      }
    }
  }

  internal struct FundingSourceSupportInfo: GraphQLSelectionSet {
    internal static let possibleTypes = ["FundingSourceSupportInfo"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("providerType", type: .nonNull(.scalar(String.self))),
      GraphQLField("fundingSourceType", type: .nonNull(.scalar(String.self))),
      GraphQLField("network", type: .nonNull(.scalar(String.self))),
      GraphQLField("detail", type: .nonNull(.list(.nonNull(.object(Detail.selections))))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(providerType: String, fundingSourceType: String, network: String, detail: [Detail]) {
      self.init(snapshot: ["__typename": "FundingSourceSupportInfo", "providerType": providerType, "fundingSourceType": fundingSourceType, "network": network, "detail": detail.map { $0.snapshot }])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var providerType: String {
      get {
        return snapshot["providerType"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "providerType")
      }
    }

    internal var fundingSourceType: String {
      get {
        return snapshot["fundingSourceType"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "fundingSourceType")
      }
    }

    internal var network: String {
      get {
        return snapshot["network"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "network")
      }
    }

    internal var detail: [Detail] {
      get {
        return (snapshot["detail"] as! [Snapshot]).map { Detail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "detail")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var fundingSourceSupportInfo: FundingSourceSupportInfo {
        get {
          return FundingSourceSupportInfo(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    internal struct Detail: GraphQLSelectionSet {
      internal static let possibleTypes = ["FundingSourceSupportDetail"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("cardType", type: .nonNull(.scalar(CardType.self))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(cardType: CardType) {
        self.init(snapshot: ["__typename": "FundingSourceSupportDetail", "cardType": cardType])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var cardType: CardType {
        get {
          return snapshot["cardType"]! as! CardType
        }
        set {
          snapshot.updateValue(newValue, forKey: "cardType")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var fundingSourceSupportDetail: FundingSourceSupportDetail {
          get {
            return FundingSourceSupportDetail(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }

  internal struct FundingSourceClientConfiguration: GraphQLSelectionSet {
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

    internal var data: GraphQLID {
      get {
        return snapshot["data"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "data")
      }
    }
  }

  internal struct ClientApplicationsConfiguration: GraphQLSelectionSet {
    internal static let possibleTypes = ["VirtualCardApplicationsConfiguration"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("data", type: .nonNull(.scalar(GraphQLID.self))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(data: GraphQLID) {
      self.init(snapshot: ["__typename": "VirtualCardApplicationsConfiguration", "data": data])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var data: GraphQLID {
      get {
        return snapshot["data"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "data")
      }
    }
  }

  internal struct PricingPolicy: GraphQLSelectionSet {
    internal static let possibleTypes = ["VirtualCardPricingPolicy"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("data", type: .nonNull(.scalar(GraphQLID.self))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(data: GraphQLID) {
      self.init(snapshot: ["__typename": "VirtualCardPricingPolicy", "data": data])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

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