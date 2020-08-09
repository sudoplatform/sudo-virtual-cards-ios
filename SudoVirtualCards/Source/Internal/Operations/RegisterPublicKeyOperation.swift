//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoLogging
import AWSAppSync
import SudoOperations

/// Operation to Register a Public Key to Virtual Cards service.
///
/// This operation will first check the service to see if the key is already registered and return the key. If it is not,
/// it will register the key.
class RegisterPublicKeyOperation: PlatformOperation {

    // MARK: - Supplementary

    typealias KeyRingQueryItem = GetKeyRingForVirtualCardsQuery.Data.GetKeyRingForVirtualCard.Item

    // MARK: - Properties

    var result: PublicKey?

    private let keyPair: KeyPair

    private unowned let publicKeyService: PublicKeyService

    // MARK: - Lifecycle

    init(keyPair: KeyPair, publicKeyService: PublicKeyService, logger: Logger) {
        self.keyPair = keyPair
        self.publicKeyService = publicKeyService
        super.init(logger: logger)
    }

    // MARK: - Methods

    override func execute() {
        publicKeyService.getKeyRing(forKeyRingId: keyPair.keyRingId, cachePolicy: .remoteOnly) { [weak self] result in
            guard let weakSelf = self else { return }
            let registeredKeys: [KeyRingQueryItem]
            do {
                registeredKeys = try result.get().getKeyRingForVirtualCards.items
            } catch {
                weakSelf.finishWithError(error)
                return
            }
            if let graphQLPublicKey = weakSelf.findMatchingKey(inRegisteredKeys: registeredKeys, forKeyPair: weakSelf.keyPair) {
                // Public key is already registered.
                let publicKey = PublicKey(getKeyRingForVirtualCards: graphQLPublicKey)
                weakSelf.result = publicKey
                weakSelf.finish()
                return
            }
            weakSelf.publicKeyService.create(withKeyPair: weakSelf.keyPair) { result in
                switch result {
                case let .success(publicKey):
                    weakSelf.result = publicKey
                    weakSelf.finish()
                    return
                case let .failure(error):
                    weakSelf.finishWithError(error)
                    return
                }
            }
        }
    }

    func findMatchingKey(inRegisteredKeys keys: [KeyRingQueryItem], forKeyPair keyPair: KeyPair) -> KeyRingQueryItem? {
        return keys.first(where: { key in
            let keyIdMatches = (key.keyId == keyPair.keyId)
            let keyRingIdMatches = (key.keyRingId == keyPair.keyRingId)
            return keyIdMatches && keyRingIdMatches
        })
    }
}
