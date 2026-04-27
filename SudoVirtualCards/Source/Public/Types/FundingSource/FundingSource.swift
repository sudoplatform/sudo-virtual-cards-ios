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

    public func isUnfunded() -> Bool {
      switch self {
      case .creditCardFundingSource(let fs):
          return fs.isUnfunded()
      }
    }
}
