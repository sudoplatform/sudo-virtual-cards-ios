//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

extension Result {

    // MARK: - Convenience

    /// Will return whether or not the instance is a `success` case.
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }

    /// Will return the associated success value from the instance if it is the `success` case.
    var value: Success? {
        switch self {
        case .success(let output):
            return output
        case .failure:
            return nil
        }
    }

    /// Will return whether or not the instance is the `failed` case.
    var isFailure: Bool {
        switch self {
        case .failure:
            return true
        case .success:
            return false
        }
    }

    /// Will return the associated error if the instance is the `failed` case.
    var error: Failure? {
        switch self {
        case .failure(let output):
            return output
        case .success:
            return nil
        }
    }
}
