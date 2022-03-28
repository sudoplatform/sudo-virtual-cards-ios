//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoOperations
import SudoUser
import SudoLogging

class RefreshTokenOperation: PlatformOperation {

    var result: AuthenticationTokens?

    private unowned let userClient: SudoUserClient

    init(userClient: SudoUserClient, logger: Logger) {
        self.userClient = userClient
        super.init(logger: logger)
    }

    override func execute() {
        do {
            guard let token = try userClient.getRefreshToken() else {
                return finishWithError(SudoVirtualCardsError.notSignedIn)
            }
            try userClient.refreshTokens(refreshToken: token) { result in
                switch result {
                case let .success(tokens):
                    self.result = tokens
                    self.finish()
                case let .failure(cause):
                    self.finishWithError(cause)
                }
            }
        } catch {
            logger.error("Failed to refresh token: \(error)")
            finishWithError(error)
        }
    }
}
