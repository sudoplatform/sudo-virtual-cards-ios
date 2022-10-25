//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoLogging

/// Use case for generating keys for the SDK to use if they have not been generated before.
///
/// The usage of an operation is to allow this code to be run exclusively to avoid any key race conditions.
class CreateKeysIfAbsentUseCase: SudoVirtualCardsOperation {

    // MARK: - Properties

    var platformKeyManager: PlatformKeyManager

    var publicKeyService: PublicKeyService

    var result: CreateKeysIfAbsentResult?

    // MARK: - Lifecycle

    init(platformKeyManager: PlatformKeyManager, publicKeyService: PublicKeyService, logger: Logger) {
        self.platformKeyManager = platformKeyManager
        self.publicKeyService = publicKeyService
        super.init(logger: logger)
    }

    // MARK: - Execution

    override func execute() async {
        do {
            let syncResult = try createSymmetricKeysIfAbsent()
            let asyncResult = try await createAndRegisterKeyPairIfAbsent()
            result = .init(symmetricKey: syncResult, keyPair: asyncResult)
            finish()
        } catch {
            finishWithError(error)
        }
    }

    // MARK: - Helpers

    func createSymmetricKeysIfAbsent() throws -> CreateKeysIfAbsentResult.KeyResult {
        if let symmetricKeyId = try self.platformKeyManager.getCurrentSymmetricKeyId() {
            return .init(created: false, keyId: symmetricKeyId)
        }
        let symmetricKeyId = try self.platformKeyManager.generateNewCurrentSymmetricKey()
        return .init(created: true, keyId: symmetricKeyId)
    }

    func createAndRegisterKeyPairIfAbsent() async throws -> CreateKeysIfAbsentResult.KeyResult {
        if let currentKeyPair = try platformKeyManager.getCurrentKeyPair() {
            if (try await self.publicKeyService.getPublicKeyWithId(currentKeyPair.keyId, cachePolicy: .remoteOnly)) == nil {
                _ = try await self.publicKeyService.create(withKeyPair: currentKeyPair)
            }
            return .init(created: false, keyId: currentKeyPair.keyId)
        } else {
            let keyPair = try platformKeyManager.generateNewCurrentKeyPair()
            _ = try await publicKeyService.create(withKeyPair: keyPair)
            return .init(created: true, keyId: keyPair.keyId)
        }
    }

}
