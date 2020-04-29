//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoUser
import SudoOperations

/// Check if the user is signed in.
class SignedInCondition: PlatformOperationCondition {

    static var name: String {
        return "SignedInCondition"
    }

    unowned let userClient: SudoUserClient

    init(userClient: SudoUserClient) {
        self.userClient = userClient
    }

    func dependencyForOperation(_ operation: PlatformOperation) -> Operation? {
        return nil
    }

    func evaluateForOperation(_ operation: PlatformOperation, completion: (PlatformOperationConditionResult) -> Void) {
        guard (try? userClient.getSubject()) != nil else {
            completion(.failure(SudoVirtualCardsError.notSignedIn))
            return
        }
        completion(.success(()))
    }
}
