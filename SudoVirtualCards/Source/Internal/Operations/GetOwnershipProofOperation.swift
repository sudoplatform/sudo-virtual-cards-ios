//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoProfiles
import SudoLogging
import SudoOperations

typealias OwnershipProofJWT = String

class GetOwnershipProofOperation: PlatformOperation {

    // MARK: - Properties

    var result: OwnershipProofJWT?

    private let sudoId: String

    private unowned let profilesClient: SudoProfilesClient

    /// Associated Sudo Profiles reference type audience used for provisioning.
    private let virtualCardsAudience = "sudoplatform.virtual-cards.virtual-card"

    init(profilesClient: SudoProfilesClient, sudoId: String, logger: Logger) {
        self.profilesClient = profilesClient
        self.sudoId = sudoId
        super.init(logger: logger)
    }

    override func execute() {
        let sudo = Sudo(id: sudoId)
        do {
            try profilesClient.getOwnershipProof(sudo: sudo, audience: virtualCardsAudience) { [weak self] result in
                guard let self = self else {
                    return
                }
                switch result {
                case let .success(jwt):
                    self.result = jwt
                    self.finish()
                    return
                case let .failure(cause):
                    self.logger.error("Failed to get ownership proof: \(cause)")
                    self.finishWithError(cause)
                    return
                }
            }
        } catch {
            logger.error("Failed to get ownership proof: \(error)")
            finishWithError(error)
        }
    }
}
