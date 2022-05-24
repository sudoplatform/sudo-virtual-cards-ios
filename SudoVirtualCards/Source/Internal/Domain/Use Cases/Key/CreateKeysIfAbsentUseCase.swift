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
        var registerRequired = false
        var created = false
        let publicKey: KeyPair
        if let currentKey = try platformKeyManager.getCurrentKeyPair() {
            let keyId = currentKey.keyId

            var nextToken: String?
            var alreadyRegistered = false
            repeat {
                let result = try await publicKeyService.getKeyRing(forKeyRingId: currentKey.keyRingId, cachePolicy: .remoteOnly)
                alreadyRegistered = result.getKeyRingForVirtualCards.items.contains(where: { $0.keyId == keyId})
                nextToken = result.getKeyRingForVirtualCards.nextToken
            } while nextToken != nil
            registerRequired = !alreadyRegistered
            publicKey = currentKey
        } else {
            publicKey = try platformKeyManager.generateNewCurrentKeyPair()
            created = true
        }
        if registerRequired {
            _ = try await publicKeyService.create(withKeyPair: publicKey)
        }
        return .init(created: created, keyId: publicKey.keyId)
    }

}
