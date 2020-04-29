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
/// This operation will first check the service to see if the key is already registered. If it is not,
/// it will register the key.
class RegisterPublicKeyOperation: PlatformGroupOperation {

    // MARK: - Properties

    var result: PublicKey?

    private let keyPair: KeyPair

    private unowned let appSyncClient: AWSAppSyncClient

    private let operationFactory: OperationFactory

    // MARK: - Lifecycle

    init(keyPair: KeyPair, appSyncClient: AWSAppSyncClient, logger: Logger, operationFactory: OperationFactory = OperationFactory()) {
        self.keyPair = keyPair
        self.appSyncClient = appSyncClient
        self.operationFactory = operationFactory
        super.init(logger: logger, operations: [])
    }

    // MARK: - Methods

    override func execute() {
        let getKeyRingQuery = GetKeyRingForVirtualCardsQuery(keyRingId: keyPair.keyRingId)
        let getKeyRingOperation = operationFactory.generateQueryOperation(
            query: getKeyRingQuery,
            appSyncClient: appSyncClient,
            cachePolicy: .useOnline,
            logger: logger)
        let getKeyRingCompletion = PlatformBlockOperation(logger: logger) { [weak self] in
            guard let self = self else {
                return
            }
            guard let result = getKeyRingOperation.result else {
                // This should never occur.
                return
            }
            let registeredKeys = result.getKeyRingForVirtualCards.items

            if let graphQlPublicKey = registeredKeys.first(where: {
               $0.keyId == self.keyPair.keyId && $0.keyRingId == self.keyPair.keyRingId
            }) {
                // Public Key is registered.
                let publicKey = PublicKey(getKeyRingForVirtualCards: graphQlPublicKey)
                self.result = publicKey
                return
            }

            // Public key is not registered - register it.
            let algorithm = "RSAEncryptionOAEPAESCBC"
            let publicKeyString = self.keyPair.publicKey.base64EncodedString()
            let input = CreatePublicKeyInput(
                keyId: self.keyPair.keyId,
                keyRingId: self.keyPair.keyRingId,
                algorithm: algorithm,
                publicKey: publicKeyString)
            let mutation = CreatePublicKeyForVirtualCardsMutation(input: input)
            let createPublicKeyOperation = self.operationFactory.generateMutationOperation(
                mutation: mutation,
                appSyncClient: self.appSyncClient,
                logger: self.logger)
            let completion = PlatformBlockOperation(logger: self.logger) { [weak self] in
                guard let self = self else {
                    return
                }
                guard let result = createPublicKeyOperation.result else {
                    // This should never occur.
                    return
                }

                let publicKey = PublicKey(createPublicKeyForVirtualCards: result.createPublicKeyForVirtualCards)
                self.result = publicKey
                return
            }
            completion.addDependency(createPublicKeyOperation)
            self.addOperations([createPublicKeyOperation, completion])
        }

        getKeyRingCompletion.addDependency(getKeyRingOperation)
        self.addOperations([getKeyRingOperation, getKeyRingCompletion])
        super.execute()
    }
}
