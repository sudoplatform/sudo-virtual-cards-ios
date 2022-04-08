// swiftlint:disable all
//  This file was automatically generated and should not be edited.

import AWSAppSync

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

  internal init(id: Optional<IDFilterInput?> = nil, clientRefId: Optional<IDFilterInput?> = nil, provisioningState: Optional<ProvisioningStateFilterInput?> = nil, and: Optional<[ProvisionalCardFilterInput]?> = nil, or: Optional<[ProvisionalCardFilterInput]?> = nil, not: Optional<ProvisionalCardFilterInput?> = nil) {
    graphQLMap = ["id": id, "clientRefId": clientRefId, "provisioningState": provisioningState, "and": and, "or": or, "not": not]
  }

  internal var id: Optional<IDFilterInput?> {
    get {
      return graphQLMap["id"] as! Optional<IDFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
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

  internal var provisioningState: Optional<ProvisioningStateFilterInput?> {
    get {
      return graphQLMap["provisioningState"] as! Optional<ProvisioningStateFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "provisioningState")
    }
  }

  internal var and: Optional<[ProvisionalCardFilterInput]?> {
    get {
      return graphQLMap["and"] as! Optional<[ProvisionalCardFilterInput]?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  internal var or: Optional<[ProvisionalCardFilterInput]?> {
    get {
      return graphQLMap["or"] as! Optional<[ProvisionalCardFilterInput]?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  internal var not: Optional<ProvisionalCardFilterInput?> {
    get {
      return graphQLMap["not"] as! Optional<ProvisionalCardFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
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

internal struct ProvisioningStateFilterInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(eq: Optional<ProvisioningState?> = nil, ne: Optional<ProvisioningState?> = nil) {
    graphQLMap = ["eq": eq, "ne": ne]
  }

  internal var eq: Optional<ProvisioningState?> {
    get {
      return graphQLMap["eq"] as! Optional<ProvisioningState?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  internal var ne: Optional<ProvisioningState?> {
    get {
      return graphQLMap["ne"] as! Optional<ProvisioningState?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
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

internal struct CardFilterInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(id: Optional<IDFilterInput?> = nil, keyId: Optional<IDFilterInput?> = nil, state: Optional<IDFilterInput?> = nil, and: Optional<[CardFilterInput]?> = nil, or: Optional<[CardFilterInput]?> = nil, not: Optional<CardFilterInput?> = nil) {
    graphQLMap = ["id": id, "keyId": keyId, "state": state, "and": and, "or": or, "not": not]
  }

  internal var id: Optional<IDFilterInput?> {
    get {
      return graphQLMap["id"] as! Optional<IDFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
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

  internal var and: Optional<[CardFilterInput]?> {
    get {
      return graphQLMap["and"] as! Optional<[CardFilterInput]?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  internal var or: Optional<[CardFilterInput]?> {
    get {
      return graphQLMap["or"] as! Optional<[CardFilterInput]?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  internal var not: Optional<CardFilterInput?> {
    get {
      return graphQLMap["not"] as! Optional<CardFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

internal struct TransactionFilterInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(id: Optional<IDFilterInput?> = nil, cardId: Optional<IDFilterInput?> = nil, keyId: Optional<IDFilterInput?> = nil, sequenceId: Optional<IDFilterInput?> = nil, type: Optional<TransactionTypeFilterInput?> = nil, and: Optional<[TransactionFilterInput]?> = nil, or: Optional<[TransactionFilterInput]?> = nil, not: Optional<TransactionFilterInput?> = nil) {
    graphQLMap = ["id": id, "cardId": cardId, "keyId": keyId, "sequenceId": sequenceId, "type": type, "and": and, "or": or, "not": not]
  }

  internal var id: Optional<IDFilterInput?> {
    get {
      return graphQLMap["id"] as! Optional<IDFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
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

  internal var sequenceId: Optional<IDFilterInput?> {
    get {
      return graphQLMap["sequenceId"] as! Optional<IDFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sequenceId")
    }
  }

  internal var type: Optional<TransactionTypeFilterInput?> {
    get {
      return graphQLMap["type"] as! Optional<TransactionTypeFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  internal var and: Optional<[TransactionFilterInput]?> {
    get {
      return graphQLMap["and"] as! Optional<[TransactionFilterInput]?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  internal var or: Optional<[TransactionFilterInput]?> {
    get {
      return graphQLMap["or"] as! Optional<[TransactionFilterInput]?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  internal var not: Optional<TransactionFilterInput?> {
    get {
      return graphQLMap["not"] as! Optional<TransactionFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

internal struct TransactionTypeFilterInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(eq: Optional<TransactionType?> = nil, ne: Optional<TransactionType?> = nil) {
    graphQLMap = ["eq": eq, "ne": ne]
  }

  internal var eq: Optional<TransactionType?> {
    get {
      return graphQLMap["eq"] as! Optional<TransactionType?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  internal var ne: Optional<TransactionType?> {
    get {
      return graphQLMap["ne"] as! Optional<TransactionType?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }
}

internal struct DateRangeInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(startDateEpochMs: Double, endDateEpochMs: Double) {
    graphQLMap = ["startDateEpochMs": startDateEpochMs, "endDateEpochMs": endDateEpochMs]
  }

  internal var startDateEpochMs: Double {
    get {
      return graphQLMap["startDateEpochMs"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "startDateEpochMs")
    }
  }

  internal var endDateEpochMs: Double {
    get {
      return graphQLMap["endDateEpochMs"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "endDateEpochMs")
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

  internal init(id: Optional<IDFilterInput?> = nil, state: Optional<FundingSourceStateFilterInput?> = nil, and: Optional<[FundingSourceFilterInput]?> = nil, or: Optional<[FundingSourceFilterInput]?> = nil, not: Optional<FundingSourceFilterInput?> = nil) {
    graphQLMap = ["id": id, "state": state, "and": and, "or": or, "not": not]
  }

  internal var id: Optional<IDFilterInput?> {
    get {
      return graphQLMap["id"] as! Optional<IDFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  internal var state: Optional<FundingSourceStateFilterInput?> {
    get {
      return graphQLMap["state"] as! Optional<FundingSourceStateFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "state")
    }
  }

  internal var and: Optional<[FundingSourceFilterInput]?> {
    get {
      return graphQLMap["and"] as! Optional<[FundingSourceFilterInput]?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  internal var or: Optional<[FundingSourceFilterInput]?> {
    get {
      return graphQLMap["or"] as! Optional<[FundingSourceFilterInput]?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  internal var not: Optional<FundingSourceFilterInput?> {
    get {
      return graphQLMap["not"] as! Optional<FundingSourceFilterInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

internal struct FundingSourceStateFilterInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(eq: Optional<FundingSourceState?> = nil, ne: Optional<FundingSourceState?> = nil) {
    graphQLMap = ["eq": eq, "ne": ne]
  }

  internal var eq: Optional<FundingSourceState?> {
    get {
      return graphQLMap["eq"] as! Optional<FundingSourceState?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  internal var ne: Optional<FundingSourceState?> {
    get {
      return graphQLMap["ne"] as! Optional<FundingSourceState?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }
}

internal enum CardType: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case credit
  case debit
  case prepaid
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "CREDIT": self = .credit
      case "DEBIT": self = .debit
      case "PREPAID": self = .prepaid
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .credit: return "CREDIT"
      case .debit: return "DEBIT"
      case .prepaid: return "PREPAID"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: CardType, rhs: CardType) -> Bool {
    switch (lhs, rhs) {
      case (.credit, .credit): return true
      case (.debit, .debit): return true
      case (.prepaid, .prepaid): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal struct CreatePublicKeyInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(keyId: String, keyRingId: String, algorithm: String, keyFormat: Optional<KeyFormat?> = nil, publicKey: String) {
    graphQLMap = ["keyId": keyId, "keyRingId": keyRingId, "algorithm": algorithm, "keyFormat": keyFormat, "publicKey": publicKey]
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

  internal var keyId: String {
    get {
      return graphQLMap["keyId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "keyId")
    }
  }
}

internal struct CardProvisionRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(clientRefId: String, ownerProofs: [GraphQLID], keyRingId: GraphQLID, fundingSourceId: GraphQLID, currency: String, cardHolder: String, billingAddress: Optional<AddressInput?> = nil, alias: Optional<String?> = nil, metadata: Optional<SealedAttributeInput?> = nil) {
    graphQLMap = ["clientRefId": clientRefId, "ownerProofs": ownerProofs, "keyRingId": keyRingId, "fundingSourceId": fundingSourceId, "currency": currency, "cardHolder": cardHolder, "billingAddress": billingAddress, "alias": alias, "metadata": metadata]
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

  internal var currency: String {
    get {
      return graphQLMap["currency"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "currency")
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

  internal var billingAddress: Optional<AddressInput?> {
    get {
      return graphQLMap["billingAddress"] as! Optional<AddressInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "billingAddress")
    }
  }

  internal var alias: Optional<String?> {
    get {
      return graphQLMap["alias"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "alias")
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

internal struct SealedAttributeInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(algorithm: String, keyId: String, plainTextType: String, base64EncodedSealedData: String) {
    graphQLMap = ["algorithm": algorithm, "keyId": keyId, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData]
  }

  internal var algorithm: String {
    get {
      return graphQLMap["algorithm"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "algorithm")
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

  internal var base64EncodedSealedData: String {
    get {
      return graphQLMap["base64EncodedSealedData"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "base64EncodedSealedData")
    }
  }
}

internal struct CardUpdateRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(id: GraphQLID, keyId: Optional<String?> = nil, expectedVersion: Optional<Int?> = nil, cardHolder: Optional<String?> = nil, billingAddress: Optional<AddressInput?> = nil, alias: Optional<String?> = nil, metadata: Optional<SealedAttributeInput?> = nil) {
    graphQLMap = ["id": id, "keyId": keyId, "expectedVersion": expectedVersion, "cardHolder": cardHolder, "billingAddress": billingAddress, "alias": alias, "metadata": metadata]
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

  internal var expectedVersion: Optional<Int?> {
    get {
      return graphQLMap["expectedVersion"] as! Optional<Int?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "expectedVersion")
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

  internal var billingAddress: Optional<AddressInput?> {
    get {
      return graphQLMap["billingAddress"] as! Optional<AddressInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "billingAddress")
    }
  }

  internal var alias: Optional<String?> {
    get {
      return graphQLMap["alias"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "alias")
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

internal struct SetupFundingSourceRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(type: FundingSourceType, currency: String) {
    graphQLMap = ["type": type, "currency": currency]
  }

  internal var type: FundingSourceType {
    get {
      return graphQLMap["type"] as! FundingSourceType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
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

internal enum ProvisionalFundingSourceState: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case provisioning
  case pending
  case completed
  case failed
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "PROVISIONING": self = .provisioning
      case "PENDING": self = .pending
      case "COMPLETED": self = .completed
      case "FAILED": self = .failed
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .provisioning: return "PROVISIONING"
      case .pending: return "PENDING"
      case .completed: return "COMPLETED"
      case .failed: return "FAILED"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: ProvisionalFundingSourceState, rhs: ProvisionalFundingSourceState) -> Bool {
    switch (lhs, rhs) {
      case (.provisioning, .provisioning): return true
      case (.pending, .pending): return true
      case (.completed, .completed): return true
      case (.failed, .failed): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal struct CompleteFundingSourceRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(id: GraphQLID, completionData: GraphQLID, updateCardFundingSource: Optional<Bool?> = nil) {
    graphQLMap = ["id": id, "completionData": completionData, "updateCardFundingSource": updateCardFundingSource]
  }

  internal var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  internal var completionData: GraphQLID {
    get {
      return graphQLMap["completionData"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "completionData")
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

internal final class GetPublicKeyForVirtualCardsQuery: GraphQLQuery {
  internal static let operationString =
    "query GetPublicKeyForVirtualCards($keyId: String!, $keyFormats: [KeyFormat!]) {\n  getPublicKeyForVirtualCards(keyId: $keyId, keyFormats: $keyFormats) {\n    __typename\n    id\n    keyId\n    keyRingId\n    algorithm\n    keyFormat\n    publicKey\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n  }\n}"

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
  }
}

internal final class GetPublicKeysForVirtualCardsQuery: GraphQLQuery {
  internal static let operationString =
    "query GetPublicKeysForVirtualCards($limit: Int, $nextToken: String, $keyFormats: [KeyFormat!]) {\n  getPublicKeysForVirtualCards(limit: $limit, nextToken: $nextToken, keyFormats: $keyFormats) {\n    __typename\n    items {\n      __typename\n      id\n      keyId\n      keyRingId\n      algorithm\n      keyFormat\n      publicKey\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n    }\n    nextToken\n  }\n}"

  internal var limit: Int?
  internal var nextToken: String?
  internal var keyFormats: [KeyFormat]?

  internal init(limit: Int? = nil, nextToken: String? = nil, keyFormats: [KeyFormat]?) {
    self.limit = limit
    self.nextToken = nextToken
    self.keyFormats = keyFormats
  }

  internal var variables: GraphQLMap? {
    return ["limit": limit, "nextToken": nextToken, "keyFormats": keyFormats]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("getPublicKeysForVirtualCards", arguments: ["limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken"), "keyFormats": GraphQLVariable("keyFormats")], type: .nonNull(.object(GetPublicKeysForVirtualCard.selections))),
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
    }
  }
}

internal final class GetKeyRingForVirtualCardsQuery: GraphQLQuery {
  internal static let operationString =
    "query GetKeyRingForVirtualCards($keyRingId: String!, $limit: Int, $nextToken: String, $keyFormats: [KeyFormat!]) {\n  getKeyRingForVirtualCards(keyRingId: $keyRingId, limit: $limit, nextToken: $nextToken, keyFormats: $keyFormats) {\n    __typename\n    items {\n      __typename\n      id\n      keyId\n      keyRingId\n      algorithm\n      keyFormat\n      publicKey\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n    }\n    nextToken\n  }\n}"

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
    }
  }
}

internal final class GetProvisionalCardQuery: GraphQLQuery {
  internal static let operationString =
    "query GetProvisionalCard($id: ID!) {\n  getProvisionalCard(id: $id) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    clientRefId\n    provisioningState\n    card {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      algorithm\n      keyId\n      keyRingId\n      owners {\n        __typename\n        id\n        issuer\n      }\n      fundingSourceId\n      currency\n      state\n      activeToEpochMs\n      cancelledAtEpochMs\n      last4\n      cardHolder\n      alias\n      pan\n      csc\n      billingAddress {\n        __typename\n        addressLine1\n        addressLine2\n        city\n        state\n        postalCode\n        country\n      }\n      expiry {\n        __typename\n        mm\n        yyyy\n      }\n      metadata {\n        __typename\n        algorithm\n        keyId\n        plainTextType\n        base64EncodedSealedData\n      }\n    }\n    aws_ds\n  }\n}"

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

        internal struct Metadatum: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(algorithm: String, keyId: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "algorithm": algorithm, "keyId": keyId, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
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
      }
    }
  }
}

internal final class ListProvisionalCardsQuery: GraphQLQuery {
  internal static let operationString =
    "query ListProvisionalCards($filter: ProvisionalCardFilterInput, $limit: Int, $nextToken: String) {\n  listProvisionalCards(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      clientRefId\n      provisioningState\n      card {\n        __typename\n        id\n        owner\n        version\n        createdAtEpochMs\n        updatedAtEpochMs\n        algorithm\n        keyId\n        keyRingId\n        owners {\n          __typename\n          id\n          issuer\n        }\n        fundingSourceId\n        currency\n        state\n        activeToEpochMs\n        cancelledAtEpochMs\n        last4\n        cardHolder\n        alias\n        pan\n        csc\n        billingAddress {\n          __typename\n          addressLine1\n          addressLine2\n          city\n          state\n          postalCode\n          country\n        }\n        expiry {\n          __typename\n          mm\n          yyyy\n        }\n        metadata {\n          __typename\n          algorithm\n          keyId\n          plainTextType\n          base64EncodedSealedData\n        }\n      }\n      aws_ds\n    }\n    nextToken\n  }\n}"

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

          internal struct Metadatum: GraphQLSelectionSet {
            internal static let possibleTypes = ["SealedAttribute"]

            internal static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
              GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
              GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
              GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
            ]

            internal var snapshot: Snapshot

            internal init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            internal init(algorithm: String, keyId: String, plainTextType: String, base64EncodedSealedData: String) {
              self.init(snapshot: ["__typename": "SealedAttribute", "algorithm": algorithm, "keyId": keyId, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
            }

            internal var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
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
        }
      }
    }
  }
}

internal final class ListProvisionalCardsDeltaQuery: GraphQLQuery {
  internal static let operationString =
    "query ListProvisionalCardsDelta($lastSync: AWSTimestamp, $filter: ProvisionalCardFilterInput, $limit: Int) {\n  listProvisionalCardsDelta(lastSync: $lastSync, filter: $filter, limit: $limit) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    clientRefId\n    provisioningState\n    card {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      algorithm\n      keyId\n      keyRingId\n      owners {\n        __typename\n        id\n        issuer\n      }\n      fundingSourceId\n      currency\n      state\n      activeToEpochMs\n      cancelledAtEpochMs\n      last4\n      cardHolder\n      alias\n      pan\n      csc\n      billingAddress {\n        __typename\n        addressLine1\n        addressLine2\n        city\n        state\n        postalCode\n        country\n      }\n      expiry {\n        __typename\n        mm\n        yyyy\n      }\n      metadata {\n        __typename\n        algorithm\n        keyId\n        plainTextType\n        base64EncodedSealedData\n      }\n    }\n    aws_ds\n  }\n}"

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

        internal struct Metadatum: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(algorithm: String, keyId: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "algorithm": algorithm, "keyId": keyId, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
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
      }
    }
  }
}

internal final class GetCardQuery: GraphQLQuery {
  internal static let operationString =
    "query GetCard($id: ID!, $keyId: String) {\n  getCard(id: $id, keyId: $keyId) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    algorithm\n    keyId\n    keyRingId\n    owners {\n      __typename\n      id\n      issuer\n    }\n    fundingSourceId\n    currency\n    state\n    activeToEpochMs\n    cancelledAtEpochMs\n    last4\n    cardHolder\n    alias\n    pan\n    csc\n    billingAddress {\n      __typename\n      addressLine1\n      addressLine2\n      city\n      state\n      postalCode\n      country\n    }\n    expiry {\n      __typename\n      mm\n      yyyy\n    }\n    lastTransaction {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      sortDateEpochMs\n      sortDate\n      algorithm\n      keyId\n      cardId\n      sequenceId\n      type\n      transactedAtEpochMs\n      settledAtEpochMs\n      billedAmount {\n        __typename\n        currency\n        amount\n      }\n      transactedAmount {\n        __typename\n        currency\n        amount\n      }\n      description\n      declineReason\n      detail {\n        __typename\n        virtualCardAmount {\n          __typename\n          currency\n          amount\n        }\n        markup {\n          __typename\n          percent\n          flat\n          minCharge\n        }\n        markupAmount {\n          __typename\n          currency\n          amount\n        }\n        fundingSourceAmount {\n          __typename\n          currency\n          amount\n        }\n        fundingSourceId\n        description\n      }\n    }\n    metadata {\n      __typename\n      algorithm\n      keyId\n      plainTextType\n      base64EncodedSealedData\n    }\n  }\n}"

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
        GraphQLField("lastTransaction", type: .object(LastTransaction.selections)),
        GraphQLField("metadata", type: .object(Metadatum.selections)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, lastTransaction: LastTransaction? = nil, metadata: Metadatum? = nil) {
        self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "lastTransaction": lastTransaction.flatMap { $0.snapshot }, "metadata": metadata.flatMap { $0.snapshot }])
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

      internal var lastTransaction: LastTransaction? {
        get {
          return (snapshot["lastTransaction"] as? Snapshot).flatMap { LastTransaction(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "lastTransaction")
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

      internal struct LastTransaction: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedTransaction"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDate", type: .nonNull(.scalar(String.self))),
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

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, sortDate: String, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
          self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "sortDate": sortDate, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
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

        internal var sortDate: String {
          get {
            return snapshot["sortDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "sortDate")
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
        }
      }

      internal struct Metadatum: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
          GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(algorithm: String, keyId: String, plainTextType: String, base64EncodedSealedData: String) {
          self.init(snapshot: ["__typename": "SealedAttribute", "algorithm": algorithm, "keyId": keyId, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
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
    }
  }
}

internal final class ListCardsQuery: GraphQLQuery {
  internal static let operationString =
    "query ListCards($filter: CardFilterInput, $limit: Int, $nextToken: String) {\n  listCards(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      algorithm\n      keyId\n      keyRingId\n      owners {\n        __typename\n        id\n        issuer\n      }\n      fundingSourceId\n      currency\n      state\n      activeToEpochMs\n      cancelledAtEpochMs\n      last4\n      cardHolder\n      alias\n      pan\n      csc\n      billingAddress {\n        __typename\n        addressLine1\n        addressLine2\n        city\n        state\n        postalCode\n        country\n      }\n      expiry {\n        __typename\n        mm\n        yyyy\n      }\n      lastTransaction {\n        __typename\n        id\n        owner\n        version\n        createdAtEpochMs\n        updatedAtEpochMs\n        sortDateEpochMs\n        sortDate\n        algorithm\n        keyId\n        cardId\n        sequenceId\n        type\n        transactedAtEpochMs\n        settledAtEpochMs\n        billedAmount {\n          __typename\n          currency\n          amount\n        }\n        transactedAmount {\n          __typename\n          currency\n          amount\n        }\n        description\n        declineReason\n        detail {\n          __typename\n          virtualCardAmount {\n            __typename\n            currency\n            amount\n          }\n          markup {\n            __typename\n            percent\n            flat\n            minCharge\n          }\n          markupAmount {\n            __typename\n            currency\n            amount\n          }\n          fundingSourceAmount {\n            __typename\n            currency\n            amount\n          }\n          fundingSourceId\n          description\n        }\n      }\n      metadata {\n        __typename\n        algorithm\n        keyId\n        plainTextType\n        base64EncodedSealedData\n      }\n    }\n    nextToken\n  }\n}"

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
          GraphQLField("alias", type: .scalar(String.self)),
          GraphQLField("pan", type: .nonNull(.scalar(String.self))),
          GraphQLField("csc", type: .nonNull(.scalar(String.self))),
          GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
          GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
          GraphQLField("lastTransaction", type: .object(LastTransaction.selections)),
          GraphQLField("metadata", type: .object(Metadatum.selections)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, lastTransaction: LastTransaction? = nil, metadata: Metadatum? = nil) {
          self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "lastTransaction": lastTransaction.flatMap { $0.snapshot }, "metadata": metadata.flatMap { $0.snapshot }])
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

        internal var lastTransaction: LastTransaction? {
          get {
            return (snapshot["lastTransaction"] as? Snapshot).flatMap { LastTransaction(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "lastTransaction")
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

        internal struct LastTransaction: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedTransaction"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("version", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("sortDate", type: .nonNull(.scalar(String.self))),
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

          internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, sortDate: String, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
            self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "sortDate": sortDate, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
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

          internal var sortDate: String {
            get {
              return snapshot["sortDate"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "sortDate")
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
          }
        }

        internal struct Metadatum: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(algorithm: String, keyId: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "algorithm": algorithm, "keyId": keyId, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
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
      }
    }
  }
}

internal final class GetTransactionQuery: GraphQLQuery {
  internal static let operationString =
    "query GetTransaction($id: ID!, $keyId: String) {\n  getTransaction(id: $id, keyId: $keyId) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    sortDateEpochMs\n    sortDate\n    algorithm\n    keyId\n    cardId\n    sequenceId\n    type\n    transactedAtEpochMs\n    settledAtEpochMs\n    billedAmount {\n      __typename\n      currency\n      amount\n    }\n    transactedAmount {\n      __typename\n      currency\n      amount\n    }\n    description\n    declineReason\n    detail {\n      __typename\n      virtualCardAmount {\n        __typename\n        currency\n        amount\n      }\n      markup {\n        __typename\n        percent\n        flat\n        minCharge\n      }\n      markupAmount {\n        __typename\n        currency\n        amount\n      }\n      fundingSourceAmount {\n        __typename\n        currency\n        amount\n      }\n      fundingSourceId\n      description\n    }\n  }\n}"

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
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("sortDate", type: .nonNull(.scalar(String.self))),
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

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, sortDate: String, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
        self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "sortDate": sortDate, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
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

      internal var sortDate: String {
        get {
          return snapshot["sortDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "sortDate")
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
      }
    }
  }
}

internal final class ListTransactionsQuery: GraphQLQuery {
  internal static let operationString =
    "query ListTransactions($filter: TransactionFilterInput, $limit: Int, $nextToken: String) {\n  listTransactions(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      sortDateEpochMs\n      sortDate\n      algorithm\n      keyId\n      cardId\n      sequenceId\n      type\n      transactedAtEpochMs\n      settledAtEpochMs\n      billedAmount {\n        __typename\n        currency\n        amount\n      }\n      transactedAmount {\n        __typename\n        currency\n        amount\n      }\n      description\n      declineReason\n      detail {\n        __typename\n        virtualCardAmount {\n          __typename\n          currency\n          amount\n        }\n        markup {\n          __typename\n          percent\n          flat\n          minCharge\n        }\n        markupAmount {\n          __typename\n          currency\n          amount\n        }\n        fundingSourceAmount {\n          __typename\n          currency\n          amount\n        }\n        fundingSourceId\n        description\n      }\n    }\n    nextToken\n  }\n}"

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
          GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDate", type: .nonNull(.scalar(String.self))),
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

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, sortDate: String, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
          self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "sortDate": sortDate, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
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

        internal var sortDate: String {
          get {
            return snapshot["sortDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "sortDate")
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
        }
      }
    }
  }
}

internal final class ListTransactionsByCardIdQuery: GraphQLQuery {
  internal static let operationString =
    "query ListTransactionsByCardId($cardId: ID!, $filter: TransactionFilterInput, $limit: Int, $nextToken: String, $dateRange: DateRangeInput, $sortOrder: SortOrder) {\n  listTransactionsByCardId(cardId: $cardId, filter: $filter, limit: $limit, nextToken: $nextToken, dateRange: $dateRange, sortOrder: $sortOrder) {\n    __typename\n    items {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      sortDateEpochMs\n      sortDate\n      algorithm\n      keyId\n      cardId\n      sequenceId\n      type\n      transactedAtEpochMs\n      settledAtEpochMs\n      billedAmount {\n        __typename\n        currency\n        amount\n      }\n      transactedAmount {\n        __typename\n        currency\n        amount\n      }\n      description\n      declineReason\n      detail {\n        __typename\n        virtualCardAmount {\n          __typename\n          currency\n          amount\n        }\n        markup {\n          __typename\n          percent\n          flat\n          minCharge\n        }\n        markupAmount {\n          __typename\n          currency\n          amount\n        }\n        fundingSourceAmount {\n          __typename\n          currency\n          amount\n        }\n        fundingSourceId\n        description\n      }\n    }\n    nextToken\n  }\n}"

  internal var cardId: GraphQLID
  internal var filter: TransactionFilterInput?
  internal var limit: Int?
  internal var nextToken: String?
  internal var dateRange: DateRangeInput?
  internal var sortOrder: SortOrder?

  internal init(cardId: GraphQLID, filter: TransactionFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil, dateRange: DateRangeInput? = nil, sortOrder: SortOrder? = nil) {
    self.cardId = cardId
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
    self.dateRange = dateRange
    self.sortOrder = sortOrder
  }

  internal var variables: GraphQLMap? {
    return ["cardId": cardId, "filter": filter, "limit": limit, "nextToken": nextToken, "dateRange": dateRange, "sortOrder": sortOrder]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("listTransactionsByCardId", arguments: ["cardId": GraphQLVariable("cardId"), "filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken"), "dateRange": GraphQLVariable("dateRange"), "sortOrder": GraphQLVariable("sortOrder")], type: .object(ListTransactionsByCardId.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(listTransactionsByCardId: ListTransactionsByCardId? = nil) {
      self.init(snapshot: ["__typename": "Query", "listTransactionsByCardId": listTransactionsByCardId.flatMap { $0.snapshot }])
    }

    internal var listTransactionsByCardId: ListTransactionsByCardId? {
      get {
        return (snapshot["listTransactionsByCardId"] as? Snapshot).flatMap { ListTransactionsByCardId(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listTransactionsByCardId")
      }
    }

    internal struct ListTransactionsByCardId: GraphQLSelectionSet {
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
          GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDate", type: .nonNull(.scalar(String.self))),
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

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, sortDate: String, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
          self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "sortDate": sortDate, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
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

        internal var sortDate: String {
          get {
            return snapshot["sortDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "sortDate")
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
      }
    }
  }
}

internal final class GetVirtualCardsConfigQuery: GraphQLQuery {
  internal static let operationString =
    "query GetVirtualCardsConfig {\n  getVirtualCardsConfig {\n    __typename\n    maxFundingSourceVelocity\n    maxFundingSourceFailureVelocity\n    maxCardCreationVelocity\n    maxTransactionVelocity {\n      __typename\n      currency\n      velocity\n    }\n    maxTransactionAmount {\n      __typename\n      currency\n      amount\n    }\n    virtualCardCurrencies\n    fundingSourceSupportInfo {\n      __typename\n      providerType\n      fundingSourceType\n      network\n      detail {\n        __typename\n        cardType\n      }\n    }\n  }\n}"

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
        GraphQLField("maxFundingSourceVelocity", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
        GraphQLField("maxFundingSourceFailureVelocity", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
        GraphQLField("maxCardCreationVelocity", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
        GraphQLField("maxTransactionVelocity", type: .nonNull(.list(.nonNull(.object(MaxTransactionVelocity.selections))))),
        GraphQLField("maxTransactionAmount", type: .nonNull(.list(.nonNull(.object(MaxTransactionAmount.selections))))),
        GraphQLField("virtualCardCurrencies", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
        GraphQLField("fundingSourceSupportInfo", type: .nonNull(.list(.nonNull(.object(FundingSourceSupportInfo.selections))))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(maxFundingSourceVelocity: [String], maxFundingSourceFailureVelocity: [String], maxCardCreationVelocity: [String], maxTransactionVelocity: [MaxTransactionVelocity], maxTransactionAmount: [MaxTransactionAmount], virtualCardCurrencies: [String], fundingSourceSupportInfo: [FundingSourceSupportInfo]) {
        self.init(snapshot: ["__typename": "VirtualCardsConfig", "maxFundingSourceVelocity": maxFundingSourceVelocity, "maxFundingSourceFailureVelocity": maxFundingSourceFailureVelocity, "maxCardCreationVelocity": maxCardCreationVelocity, "maxTransactionVelocity": maxTransactionVelocity.map { $0.snapshot }, "maxTransactionAmount": maxTransactionAmount.map { $0.snapshot }, "virtualCardCurrencies": virtualCardCurrencies, "fundingSourceSupportInfo": fundingSourceSupportInfo.map { $0.snapshot }])
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
      }
    }
  }
}

internal final class CreatePublicKeyForVirtualCardsMutation: GraphQLMutation {
  internal static let operationString =
    "mutation CreatePublicKeyForVirtualCards($input: CreatePublicKeyInput!) {\n  createPublicKeyForVirtualCards(input: $input) {\n    __typename\n    id\n    keyId\n    keyRingId\n    algorithm\n    keyFormat\n    publicKey\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n  }\n}"

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
  }
}

internal final class DeletePublicKeyForVirtualCardsMutation: GraphQLMutation {
  internal static let operationString =
    "mutation DeletePublicKeyForVirtualCards($input: DeletePublicKeyInput) {\n  deletePublicKeyForVirtualCards(input: $input) {\n    __typename\n    id\n    keyId\n    keyRingId\n    algorithm\n    keyFormat\n    publicKey\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n  }\n}"

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
  }
}

internal final class CardProvisionMutation: GraphQLMutation {
  internal static let operationString =
    "mutation CardProvision($input: CardProvisionRequest!) {\n  cardProvision(input: $input) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    clientRefId\n    provisioningState\n    card {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      algorithm\n      keyId\n      keyRingId\n      owners {\n        __typename\n        id\n        issuer\n      }\n      fundingSourceId\n      currency\n      state\n      activeToEpochMs\n      cancelledAtEpochMs\n      last4\n      cardHolder\n      alias\n      pan\n      csc\n      billingAddress {\n        __typename\n        addressLine1\n        addressLine2\n        city\n        state\n        postalCode\n        country\n      }\n      expiry {\n        __typename\n        mm\n        yyyy\n      }\n      lastTransaction {\n        __typename\n        id\n        owner\n        version\n        createdAtEpochMs\n        updatedAtEpochMs\n        sortDateEpochMs\n        sortDate\n        algorithm\n        keyId\n        cardId\n        sequenceId\n        type\n        transactedAtEpochMs\n        settledAtEpochMs\n        billedAmount {\n          __typename\n          currency\n          amount\n        }\n        transactedAmount {\n          __typename\n          currency\n          amount\n        }\n        description\n        declineReason\n        detail {\n          __typename\n          virtualCardAmount {\n            __typename\n            currency\n            amount\n          }\n          markup {\n            __typename\n            percent\n            flat\n            minCharge\n          }\n          markupAmount {\n            __typename\n            currency\n            amount\n          }\n          fundingSourceAmount {\n            __typename\n            currency\n            amount\n          }\n          fundingSourceId\n          description\n        }\n      }\n      metadata {\n        __typename\n        algorithm\n        keyId\n        plainTextType\n        base64EncodedSealedData\n      }\n    }\n    aws_ds\n  }\n}"

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
          GraphQLField("alias", type: .scalar(String.self)),
          GraphQLField("pan", type: .nonNull(.scalar(String.self))),
          GraphQLField("csc", type: .nonNull(.scalar(String.self))),
          GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
          GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
          GraphQLField("lastTransaction", type: .object(LastTransaction.selections)),
          GraphQLField("metadata", type: .object(Metadatum.selections)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, lastTransaction: LastTransaction? = nil, metadata: Metadatum? = nil) {
          self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "lastTransaction": lastTransaction.flatMap { $0.snapshot }, "metadata": metadata.flatMap { $0.snapshot }])
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

        internal var lastTransaction: LastTransaction? {
          get {
            return (snapshot["lastTransaction"] as? Snapshot).flatMap { LastTransaction(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "lastTransaction")
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

        internal struct LastTransaction: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedTransaction"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("version", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("sortDate", type: .nonNull(.scalar(String.self))),
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

          internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, sortDate: String, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
            self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "sortDate": sortDate, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
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

          internal var sortDate: String {
            get {
              return snapshot["sortDate"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "sortDate")
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
          }
        }

        internal struct Metadatum: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(algorithm: String, keyId: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "algorithm": algorithm, "keyId": keyId, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
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
      }
    }
  }
}

internal final class UpdateCardMutation: GraphQLMutation {
  internal static let operationString =
    "mutation UpdateCard($input: CardUpdateRequest!) {\n  updateCard(input: $input) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    algorithm\n    keyId\n    keyRingId\n    owners {\n      __typename\n      id\n      issuer\n    }\n    fundingSourceId\n    currency\n    state\n    activeToEpochMs\n    cancelledAtEpochMs\n    last4\n    cardHolder\n    alias\n    pan\n    csc\n    billingAddress {\n      __typename\n      addressLine1\n      addressLine2\n      city\n      state\n      postalCode\n      country\n    }\n    expiry {\n      __typename\n      mm\n      yyyy\n    }\n    lastTransaction {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      sortDateEpochMs\n      sortDate\n      algorithm\n      keyId\n      cardId\n      sequenceId\n      type\n      transactedAtEpochMs\n      settledAtEpochMs\n      billedAmount {\n        __typename\n        currency\n        amount\n      }\n      transactedAmount {\n        __typename\n        currency\n        amount\n      }\n      description\n      declineReason\n      detail {\n        __typename\n        virtualCardAmount {\n          __typename\n          currency\n          amount\n        }\n        markup {\n          __typename\n          percent\n          flat\n          minCharge\n        }\n        markupAmount {\n          __typename\n          currency\n          amount\n        }\n        fundingSourceAmount {\n          __typename\n          currency\n          amount\n        }\n        fundingSourceId\n        description\n      }\n    }\n    metadata {\n      __typename\n      algorithm\n      keyId\n      plainTextType\n      base64EncodedSealedData\n    }\n  }\n}"

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
        GraphQLField("lastTransaction", type: .object(LastTransaction.selections)),
        GraphQLField("metadata", type: .object(Metadatum.selections)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, lastTransaction: LastTransaction? = nil, metadata: Metadatum? = nil) {
        self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "lastTransaction": lastTransaction.flatMap { $0.snapshot }, "metadata": metadata.flatMap { $0.snapshot }])
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

      internal var lastTransaction: LastTransaction? {
        get {
          return (snapshot["lastTransaction"] as? Snapshot).flatMap { LastTransaction(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "lastTransaction")
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

      internal struct LastTransaction: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedTransaction"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDate", type: .nonNull(.scalar(String.self))),
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

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, sortDate: String, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
          self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "sortDate": sortDate, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
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

        internal var sortDate: String {
          get {
            return snapshot["sortDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "sortDate")
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
        }
      }

      internal struct Metadatum: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
          GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(algorithm: String, keyId: String, plainTextType: String, base64EncodedSealedData: String) {
          self.init(snapshot: ["__typename": "SealedAttribute", "algorithm": algorithm, "keyId": keyId, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
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
    }
  }
}

internal final class CancelCardMutation: GraphQLMutation {
  internal static let operationString =
    "mutation CancelCard($input: CardCancelRequest!) {\n  cancelCard(input: $input) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    algorithm\n    keyId\n    keyRingId\n    owners {\n      __typename\n      id\n      issuer\n    }\n    fundingSourceId\n    currency\n    state\n    activeToEpochMs\n    cancelledAtEpochMs\n    last4\n    cardHolder\n    alias\n    pan\n    csc\n    billingAddress {\n      __typename\n      addressLine1\n      addressLine2\n      city\n      state\n      postalCode\n      country\n    }\n    expiry {\n      __typename\n      mm\n      yyyy\n    }\n    lastTransaction {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      sortDateEpochMs\n      sortDate\n      algorithm\n      keyId\n      cardId\n      sequenceId\n      type\n      transactedAtEpochMs\n      settledAtEpochMs\n      billedAmount {\n        __typename\n        currency\n        amount\n      }\n      transactedAmount {\n        __typename\n        currency\n        amount\n      }\n      description\n      declineReason\n      detail {\n        __typename\n        virtualCardAmount {\n          __typename\n          currency\n          amount\n        }\n        markup {\n          __typename\n          percent\n          flat\n          minCharge\n        }\n        markupAmount {\n          __typename\n          currency\n          amount\n        }\n        fundingSourceAmount {\n          __typename\n          currency\n          amount\n        }\n        fundingSourceId\n        description\n      }\n    }\n    metadata {\n      __typename\n      algorithm\n      keyId\n      plainTextType\n      base64EncodedSealedData\n    }\n  }\n}"

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
        GraphQLField("lastTransaction", type: .object(LastTransaction.selections)),
        GraphQLField("metadata", type: .object(Metadatum.selections)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, lastTransaction: LastTransaction? = nil, metadata: Metadatum? = nil) {
        self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "lastTransaction": lastTransaction.flatMap { $0.snapshot }, "metadata": metadata.flatMap { $0.snapshot }])
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

      internal var lastTransaction: LastTransaction? {
        get {
          return (snapshot["lastTransaction"] as? Snapshot).flatMap { LastTransaction(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "lastTransaction")
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

      internal struct LastTransaction: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedTransaction"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDate", type: .nonNull(.scalar(String.self))),
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

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, sortDate: String, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
          self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "sortDate": sortDate, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
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

        internal var sortDate: String {
          get {
            return snapshot["sortDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "sortDate")
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
        }
      }

      internal struct Metadatum: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
          GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(algorithm: String, keyId: String, plainTextType: String, base64EncodedSealedData: String) {
          self.init(snapshot: ["__typename": "SealedAttribute", "algorithm": algorithm, "keyId": keyId, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
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
    }
  }
}

internal final class SetupFundingSourceMutation: GraphQLMutation {
  internal static let operationString =
    "mutation SetupFundingSource($input: SetupFundingSourceRequest!) {\n  setupFundingSource(input: $input) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    state\n    provisioningData\n  }\n}"

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
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("state", type: .nonNull(.scalar(ProvisionalFundingSourceState.self))),
        GraphQLField("provisioningData", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: ProvisionalFundingSourceState, provisioningData: GraphQLID) {
        self.init(snapshot: ["__typename": "ProvisionalFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "provisioningData": provisioningData])
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

      internal var state: ProvisionalFundingSourceState {
        get {
          return snapshot["state"]! as! ProvisionalFundingSourceState
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
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
    }
  }
}

internal final class OnDeltaProvisionalCardSubscription: GraphQLSubscription {
  internal static let operationString =
    "subscription OnDeltaProvisionalCard($owner: ID!) {\n  onDeltaProvisionalCard(owner: $owner) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    clientRefId\n    provisioningState\n    card {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      algorithm\n      keyId\n      keyRingId\n      owners {\n        __typename\n        id\n        issuer\n      }\n      fundingSourceId\n      currency\n      state\n      activeToEpochMs\n      cancelledAtEpochMs\n      last4\n      cardHolder\n      alias\n      pan\n      csc\n      billingAddress {\n        __typename\n        addressLine1\n        addressLine2\n        city\n        state\n        postalCode\n        country\n      }\n      expiry {\n        __typename\n        mm\n        yyyy\n      }\n      metadata {\n        __typename\n        algorithm\n        keyId\n        plainTextType\n        base64EncodedSealedData\n      }\n    }\n    aws_ds\n  }\n}"

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

        internal struct Metadatum: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(algorithm: String, keyId: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "algorithm": algorithm, "keyId": keyId, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
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
      }
    }
  }
}

internal final class OnUpdateCardProvisionStateSubscription: GraphQLSubscription {
  internal static let operationString =
    "subscription OnUpdateCardProvisionState($owner: ID!, $clientRefId: String) {\n  onUpdateCardProvisionState(owner: $owner, clientRefId: $clientRefId) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    clientRefId\n    provisioningState\n    card {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      algorithm\n      keyId\n      keyRingId\n      owners {\n        __typename\n        id\n        issuer\n      }\n      fundingSourceId\n      currency\n      state\n      activeToEpochMs\n      cancelledAtEpochMs\n      last4\n      cardHolder\n      alias\n      pan\n      csc\n      billingAddress {\n        __typename\n        addressLine1\n        addressLine2\n        city\n        state\n        postalCode\n        country\n      }\n      expiry {\n        __typename\n        mm\n        yyyy\n      }\n      lastTransaction {\n        __typename\n        id\n        owner\n        version\n        createdAtEpochMs\n        updatedAtEpochMs\n        sortDateEpochMs\n        sortDate\n        algorithm\n        keyId\n        cardId\n        sequenceId\n        type\n        transactedAtEpochMs\n        settledAtEpochMs\n        billedAmount {\n          __typename\n          currency\n          amount\n        }\n        transactedAmount {\n          __typename\n          currency\n          amount\n        }\n        description\n        declineReason\n        detail {\n          __typename\n          virtualCardAmount {\n            __typename\n            currency\n            amount\n          }\n          markup {\n            __typename\n            percent\n            flat\n            minCharge\n          }\n          markupAmount {\n            __typename\n            currency\n            amount\n          }\n          fundingSourceAmount {\n            __typename\n            currency\n            amount\n          }\n          fundingSourceId\n          description\n        }\n      }\n      metadata {\n        __typename\n        algorithm\n        keyId\n        plainTextType\n        base64EncodedSealedData\n      }\n    }\n    aws_ds\n  }\n}"

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
          GraphQLField("alias", type: .scalar(String.self)),
          GraphQLField("pan", type: .nonNull(.scalar(String.self))),
          GraphQLField("csc", type: .nonNull(.scalar(String.self))),
          GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
          GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
          GraphQLField("lastTransaction", type: .object(LastTransaction.selections)),
          GraphQLField("metadata", type: .object(Metadatum.selections)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, lastTransaction: LastTransaction? = nil, metadata: Metadatum? = nil) {
          self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "lastTransaction": lastTransaction.flatMap { $0.snapshot }, "metadata": metadata.flatMap { $0.snapshot }])
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

        internal var lastTransaction: LastTransaction? {
          get {
            return (snapshot["lastTransaction"] as? Snapshot).flatMap { LastTransaction(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "lastTransaction")
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

        internal struct LastTransaction: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedTransaction"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("version", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
            GraphQLField("sortDate", type: .nonNull(.scalar(String.self))),
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

          internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, sortDate: String, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
            self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "sortDate": sortDate, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
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

          internal var sortDate: String {
            get {
              return snapshot["sortDate"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "sortDate")
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
          }
        }

        internal struct Metadatum: GraphQLSelectionSet {
          internal static let possibleTypes = ["SealedAttribute"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
            GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(algorithm: String, keyId: String, plainTextType: String, base64EncodedSealedData: String) {
            self.init(snapshot: ["__typename": "SealedAttribute", "algorithm": algorithm, "keyId": keyId, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
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
      }
    }
  }
}

internal final class OnCardProvisionCompleteSubscription: GraphQLSubscription {
  internal static let operationString =
    "subscription OnCardProvisionComplete($owner: ID!, $clientRefId: String) {\n  onCardProvisionComplete(owner: $owner, clientRefId: $clientRefId) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    algorithm\n    keyId\n    keyRingId\n    owners {\n      __typename\n      id\n      issuer\n    }\n    fundingSourceId\n    currency\n    state\n    activeToEpochMs\n    cancelledAtEpochMs\n    last4\n    cardHolder\n    alias\n    pan\n    csc\n    billingAddress {\n      __typename\n      addressLine1\n      addressLine2\n      city\n      state\n      postalCode\n      country\n    }\n    expiry {\n      __typename\n      mm\n      yyyy\n    }\n    lastTransaction {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      sortDateEpochMs\n      sortDate\n      algorithm\n      keyId\n      cardId\n      sequenceId\n      type\n      transactedAtEpochMs\n      settledAtEpochMs\n      billedAmount {\n        __typename\n        currency\n        amount\n      }\n      transactedAmount {\n        __typename\n        currency\n        amount\n      }\n      description\n      declineReason\n      detail {\n        __typename\n        virtualCardAmount {\n          __typename\n          currency\n          amount\n        }\n        markup {\n          __typename\n          percent\n          flat\n          minCharge\n        }\n        markupAmount {\n          __typename\n          currency\n          amount\n        }\n        fundingSourceAmount {\n          __typename\n          currency\n          amount\n        }\n        fundingSourceId\n        description\n      }\n    }\n    metadata {\n      __typename\n      algorithm\n      keyId\n      plainTextType\n      base64EncodedSealedData\n    }\n  }\n}"

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
      GraphQLField("onCardProvisionComplete", arguments: ["owner": GraphQLVariable("owner"), "clientRefId": GraphQLVariable("clientRefId")], type: .object(OnCardProvisionComplete.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(onCardProvisionComplete: OnCardProvisionComplete? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCardProvisionComplete": onCardProvisionComplete.flatMap { $0.snapshot }])
    }

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
        GraphQLField("alias", type: .scalar(String.self)),
        GraphQLField("pan", type: .nonNull(.scalar(String.self))),
        GraphQLField("csc", type: .nonNull(.scalar(String.self))),
        GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
        GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
        GraphQLField("lastTransaction", type: .object(LastTransaction.selections)),
        GraphQLField("metadata", type: .object(Metadatum.selections)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, lastTransaction: LastTransaction? = nil, metadata: Metadatum? = nil) {
        self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "lastTransaction": lastTransaction.flatMap { $0.snapshot }, "metadata": metadata.flatMap { $0.snapshot }])
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

      internal var lastTransaction: LastTransaction? {
        get {
          return (snapshot["lastTransaction"] as? Snapshot).flatMap { LastTransaction(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "lastTransaction")
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

      internal struct LastTransaction: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedTransaction"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDate", type: .nonNull(.scalar(String.self))),
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

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, sortDate: String, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
          self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "sortDate": sortDate, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
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

        internal var sortDate: String {
          get {
            return snapshot["sortDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "sortDate")
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
        }
      }

      internal struct Metadatum: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
          GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(algorithm: String, keyId: String, plainTextType: String, base64EncodedSealedData: String) {
          self.init(snapshot: ["__typename": "SealedAttribute", "algorithm": algorithm, "keyId": keyId, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
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
    }
  }
}

internal final class OnUpdateCardSubscription: GraphQLSubscription {
  internal static let operationString =
    "subscription OnUpdateCard($owner: ID!, $clientRefId: String) {\n  onUpdateCard(owner: $owner, clientRefId: $clientRefId) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    algorithm\n    keyId\n    keyRingId\n    owners {\n      __typename\n      id\n      issuer\n    }\n    fundingSourceId\n    currency\n    state\n    activeToEpochMs\n    cancelledAtEpochMs\n    last4\n    cardHolder\n    alias\n    pan\n    csc\n    billingAddress {\n      __typename\n      addressLine1\n      addressLine2\n      city\n      state\n      postalCode\n      country\n    }\n    expiry {\n      __typename\n      mm\n      yyyy\n    }\n    lastTransaction {\n      __typename\n      id\n      owner\n      version\n      createdAtEpochMs\n      updatedAtEpochMs\n      sortDateEpochMs\n      sortDate\n      algorithm\n      keyId\n      cardId\n      sequenceId\n      type\n      transactedAtEpochMs\n      settledAtEpochMs\n      billedAmount {\n        __typename\n        currency\n        amount\n      }\n      transactedAmount {\n        __typename\n        currency\n        amount\n      }\n      description\n      declineReason\n      detail {\n        __typename\n        virtualCardAmount {\n          __typename\n          currency\n          amount\n        }\n        markup {\n          __typename\n          percent\n          flat\n          minCharge\n        }\n        markupAmount {\n          __typename\n          currency\n          amount\n        }\n        fundingSourceAmount {\n          __typename\n          currency\n          amount\n        }\n        fundingSourceId\n        description\n      }\n    }\n    metadata {\n      __typename\n      algorithm\n      keyId\n      plainTextType\n      base64EncodedSealedData\n    }\n  }\n}"

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
      GraphQLField("onUpdateCard", arguments: ["owner": GraphQLVariable("owner"), "clientRefId": GraphQLVariable("clientRefId")], type: .object(OnUpdateCard.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(onUpdateCard: OnUpdateCard? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateCard": onUpdateCard.flatMap { $0.snapshot }])
    }

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
        GraphQLField("alias", type: .scalar(String.self)),
        GraphQLField("pan", type: .nonNull(.scalar(String.self))),
        GraphQLField("csc", type: .nonNull(.scalar(String.self))),
        GraphQLField("billingAddress", type: .object(BillingAddress.selections)),
        GraphQLField("expiry", type: .nonNull(.object(Expiry.selections))),
        GraphQLField("lastTransaction", type: .object(LastTransaction.selections)),
        GraphQLField("metadata", type: .object(Metadatum.selections)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, algorithm: String, keyId: String, keyRingId: GraphQLID, owners: [Owner], fundingSourceId: GraphQLID, currency: String, state: CardState, activeToEpochMs: Double, cancelledAtEpochMs: Double? = nil, last4: String, cardHolder: String, alias: String? = nil, pan: String, csc: String, billingAddress: BillingAddress? = nil, expiry: Expiry, lastTransaction: LastTransaction? = nil, metadata: Metadatum? = nil) {
        self.init(snapshot: ["__typename": "SealedCard", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "algorithm": algorithm, "keyId": keyId, "keyRingId": keyRingId, "owners": owners.map { $0.snapshot }, "fundingSourceId": fundingSourceId, "currency": currency, "state": state, "activeToEpochMs": activeToEpochMs, "cancelledAtEpochMs": cancelledAtEpochMs, "last4": last4, "cardHolder": cardHolder, "alias": alias, "pan": pan, "csc": csc, "billingAddress": billingAddress.flatMap { $0.snapshot }, "expiry": expiry.snapshot, "lastTransaction": lastTransaction.flatMap { $0.snapshot }, "metadata": metadata.flatMap { $0.snapshot }])
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

      internal var lastTransaction: LastTransaction? {
        get {
          return (snapshot["lastTransaction"] as? Snapshot).flatMap { LastTransaction(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "lastTransaction")
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

      internal struct LastTransaction: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedTransaction"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sortDate", type: .nonNull(.scalar(String.self))),
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

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, sortDate: String, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
          self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "sortDate": sortDate, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
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

        internal var sortDate: String {
          get {
            return snapshot["sortDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "sortDate")
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
        }
      }

      internal struct Metadatum: GraphQLSelectionSet {
        internal static let possibleTypes = ["SealedAttribute"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
          GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
          GraphQLField("plainTextType", type: .nonNull(.scalar(String.self))),
          GraphQLField("base64EncodedSealedData", type: .nonNull(.scalar(String.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(algorithm: String, keyId: String, plainTextType: String, base64EncodedSealedData: String) {
          self.init(snapshot: ["__typename": "SealedAttribute", "algorithm": algorithm, "keyId": keyId, "plainTextType": plainTextType, "base64EncodedSealedData": base64EncodedSealedData])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
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
    }
  }
}

internal final class OnTransactionUpdateSubscription: GraphQLSubscription {
  internal static let operationString =
    "subscription OnTransactionUpdate($owner: ID!) {\n  onTransactionUpdate(owner: $owner) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    sortDateEpochMs\n    sortDate\n    algorithm\n    keyId\n    cardId\n    sequenceId\n    type\n    transactedAtEpochMs\n    settledAtEpochMs\n    billedAmount {\n      __typename\n      currency\n      amount\n    }\n    transactedAmount {\n      __typename\n      currency\n      amount\n    }\n    description\n    declineReason\n    detail {\n      __typename\n      virtualCardAmount {\n        __typename\n        currency\n        amount\n      }\n      markup {\n        __typename\n        percent\n        flat\n        minCharge\n      }\n      markupAmount {\n        __typename\n        currency\n        amount\n      }\n      fundingSourceAmount {\n        __typename\n        currency\n        amount\n      }\n      fundingSourceId\n      description\n    }\n  }\n}"

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
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("sortDate", type: .nonNull(.scalar(String.self))),
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

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, sortDate: String, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
        self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "sortDate": sortDate, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
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

      internal var sortDate: String {
        get {
          return snapshot["sortDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "sortDate")
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
      }
    }
  }
}

internal final class OnTransactionDeleteSubscription: GraphQLSubscription {
  internal static let operationString =
    "subscription OnTransactionDelete($owner: ID!) {\n  onTransactionDelete(owner: $owner) {\n    __typename\n    id\n    owner\n    version\n    createdAtEpochMs\n    updatedAtEpochMs\n    sortDateEpochMs\n    sortDate\n    algorithm\n    keyId\n    cardId\n    sequenceId\n    type\n    transactedAtEpochMs\n    settledAtEpochMs\n    billedAmount {\n      __typename\n      currency\n      amount\n    }\n    transactedAmount {\n      __typename\n      currency\n      amount\n    }\n    description\n    declineReason\n    detail {\n      __typename\n      virtualCardAmount {\n        __typename\n        currency\n        amount\n      }\n      markup {\n        __typename\n        percent\n        flat\n        minCharge\n      }\n      markupAmount {\n        __typename\n        currency\n        amount\n      }\n      fundingSourceAmount {\n        __typename\n        currency\n        amount\n      }\n      fundingSourceId\n      description\n    }\n  }\n}"

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
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("sortDateEpochMs", type: .nonNull(.scalar(Double.self))),
        GraphQLField("sortDate", type: .nonNull(.scalar(String.self))),
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

      internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, sortDateEpochMs: Double, sortDate: String, algorithm: String, keyId: String, cardId: GraphQLID, sequenceId: GraphQLID, type: TransactionType, transactedAtEpochMs: String, settledAtEpochMs: String? = nil, billedAmount: BilledAmount, transactedAmount: TransactedAmount, description: String, declineReason: String? = nil, detail: [Detail]? = nil) {
        self.init(snapshot: ["__typename": "SealedTransaction", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "sortDateEpochMs": sortDateEpochMs, "sortDate": sortDate, "algorithm": algorithm, "keyId": keyId, "cardId": cardId, "sequenceId": sequenceId, "type": type, "transactedAtEpochMs": transactedAtEpochMs, "settledAtEpochMs": settledAtEpochMs, "billedAmount": billedAmount.snapshot, "transactedAmount": transactedAmount.snapshot, "description": description, "declineReason": declineReason, "detail": detail.flatMap { $0.map { $0.snapshot } }])
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

      internal var sortDate: String {
        get {
          return snapshot["sortDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "sortDate")
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
      }
    }
  }
}