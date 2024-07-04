//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Representation of a Funding Source used in the Sudo Platform SDK.
public enum FundingSource {
    /// Representation of a Credit Card Funding Source.
    case creditCardFundingSource(CreditCardFundingSource)
    /// Representation of a Bank Account Funding Source.
    case bankAccountFundingSource(BankAccountFundingSource)

    public func isUnfunded() -> Bool {
      switch self {
      case .creditCardFundingSource(let fs):
          return fs.isUnfunded()
      case .bankAccountFundingSource(let fs):
            return fs.isUnfunded()
      }
    }
}
