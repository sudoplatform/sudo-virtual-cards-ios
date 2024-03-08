//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of a Bank Account Funding Source
public struct BankAccountFundingSource: BaseFundingSource, Hashable {
    struct Constants {
        static let TypeName: String = "BankAccountFundingSource"
    }

    // Representation of the logo of a banking institution.
    public struct InstitutionLogo: Decodable, Hashable {
        /// Mime type of institution logo
        public let type: String
        /// Base64 encoded image data of institution logo
        public let data: String

        // MARK: - Conformance: Decodable

        enum CodingKeys: String, CodingKey {
            case type
            case data
        }

        /// Creates a new instance by decoding from the given decoder.
        ///
        /// This initializer throws an error if reading from the decoder fails, or
        /// if the data read is corrupted or otherwise invalid.
        ///
        /// - Parameter decoder: The decoder to read data from.
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            type = try container.decode(String.self, forKey: .type)
            data = try container.decode(String.self, forKey: .data)
        }
    }

    // MARK: - Conformance: FundingSource

    /// Identifier generated by the Virtual Cards Service.
    public let id: String

    /// Owner identifier of the funding source. Typically the user sub.
    public let owner: String

    /// Version assigned by the service.
    public let version: Int

    /// Virtual Cards service timestamp to when the funding source record was created.
    public let createdAt: Date

    /// Virtual Cards service timestamp to when the funding source record was last updated.
    public let updatedAt: Date

    /// Type of this funding source - always `BANK_ACCOUNT`
    public let type: FundingSourceType = .bankAccount

    /// Current state of the funding source.
    public let state: FundingSourceState

    /// Set of flags associated with the funding source
    public let flags: [FundingSourceFlags ]

    /// Currency of the funding source.
    public let currency: String

    /// Effective transaction velocity, if any, applied to
    /// virtual card transactions funded by this funding source.
    /// This is the combined result of all velocity policies
    /// (global and funding source specific) as at the time this funding
    /// source was retrieved.
    public let transactionVelocity: TransactionVelocity?

    // MARK: - BankAcountFundingSource

    /// Last 4 digits of the bank account of the funding source.
    public let last4: String

    /// Type of bank account represented by this funding source.
    public let bankAccountType: BankAccountType

    /// Name of the financial institution with which this funding source is associated.
    public let institutionName: String

    /// Logo of the financial institution with which this funding source is associated, if any.
    public let institutionLogo: InstitutionLogo?

    /// Construct a bank account funding source
    /// - Parameters:
    ///   - id: Identifier generated by the Virtual Cards Service.
    ///   - owner: Owner identifier of the funding source. Typically the user sub.
    ///   - version: Version assigned by the service.
    ///   - createdAt: Virtual Cards service timestamp to when the funding source record was created.
    ///   - updatedAt: Virtual Cards service timestamp to when the funding source record was last updated.
    ///   - state: Current state of the funding source.
    ///   - flags: Current set of flags associated with the funding source
    ///   - currency: Currency of the funding source.
    ///   - transactionVelocity: Effective transaction velocity, if any, applied to virtual card transactions funded by this funding source.
    ///   - last4: Last 4 digits of the bank account of the funding source.
    ///   - bankAccountType: Type of bank account represented by this funding source.
    ///   - institutionName: Name of the financial institution with which this funding source is associated.
    ///   - institutionLogo: Logo of the financial institution with which this funding source is associated, if any.
    public init(
        id: String,
        owner: String,
        version: Int,
        createdAt: Date,
        updatedAt: Date,
        state: FundingSourceState,
        flags: [FundingSourceFlags],
        currency: String,
        transactionVelocity: TransactionVelocity? = nil,
        last4: String,
        bankAccountType: BankAccountType,
        institutionName: String,
        institutionLogo: InstitutionLogo? = nil
    ) {
        self.id = id
        self.owner = owner
        self.version = version
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.state = state
        self.flags = flags
        self.currency = currency
        self.transactionVelocity = transactionVelocity
        self.last4 = last4
        self.bankAccountType = bankAccountType
        self.institutionName = institutionName
        self.institutionLogo = institutionLogo
    }

    public func isUnfunded() -> Bool {
        return self.flags.contains(.unfunded)
    }
}
