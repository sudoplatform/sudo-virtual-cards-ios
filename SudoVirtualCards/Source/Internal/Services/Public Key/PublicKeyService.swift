//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoLogging
import AWSAppSync
import SudoOperations
import SudoApiClient

/// Abstraction of the SDKs capabilities surrounding `PublicKey` access/manipulation with virtual cards service.
///
/// Also provides some utility methods for interacting with internal functionality, such as the key manager.
class PublicKeyService {

    // MARK: - Supplementary

    /// Typealias for the result returned from `getCurrentKeyPair`.
    typealias GetCurrentKeyPairResult = Swift.Result<KeyPair, Error>

    /// Typealias for the GraphQL query type for accessing the key ring.
    typealias GetKeyRingQuery = GetKeyRingForVirtualCardsQuery

    /// Typealias for the operation used for accessing the key ring.
    private typealias GetKeyRingOperation = PlatformQueryOperation<GetKeyRingQuery>

    /// Typealias for the GraphQL mutation used for creating/registering public keys.
    private typealias CreatePublicKeyMutation = CreatePublicKeyForVirtualCardsMutation

    /// Typealias for the operation used for creating/registering public keys.
    private typealias CreatePublicKeyOperation = PlatformMutationOperation<CreatePublicKeyMutation>

    /// Default values used in `CardService`.
    enum Defaults {
        /// algorithm used when creating/registering public keys.
        static let algorithm = "RSAEncryptionOAEPAESCBC"
    }

    // MARK: - Properties

    /// App Sync Client used to interact with the GraphQL endpoint of the virtual cards service.
    unowned var graphQLClient: SudoApiClient

    /// Operation factory used to generate operations.
    unowned var operationFactory: OperationFactory

    /// Platform key manager used to access the iOS keychain for mainpulating and accessing key data.
    unowned var platformKeyManager: PlatformKeyManager

    /// Logs errors and diagnostic information.
    var logger: Logger

    /// Operation queue used by the `PublicKeyService`.
    var queue = PlatformOperationQueue()

    // MARK: - Lifecycle

    /// Initialize an instance of `PublicKeyService`.
    init(
        graphQLClient: SudoApiClient,
        operationFactory: OperationFactory,
        platformKeyManager: PlatformKeyManager,
        logger: Logger = Logger.virtualCardsSDKLogger
    ) {
        self.graphQLClient = graphQLClient
        self.operationFactory = operationFactory
        self.platformKeyManager = platformKeyManager
        self.logger = logger
    }

    /// Cancel all operations on the `PublicKeyService` operation queue.
    func cancelAllOperations() {
        queue.cancelAllOperations()
    }

    // MARK: - PublicKeyService

    /// Get the current key pair from the keychain.
    /// - Parameter generateKeyIfNotFound: If true, if the key pair could not be found, a new keypair will be generated.
    func getCurrentKeyPair(generateKeyIfNotFound: Bool = false) -> GetCurrentKeyPairResult {
        do {
            let currentKeyPair = try platformKeyManager.getCurrentKeyPair()
            if let currentKeyPair = currentKeyPair {
                return .success(currentKeyPair)
            }
            if generateKeyIfNotFound {
                let keyPair = try platformKeyManager.generateNewCurrentKeyPair()
                return .success(keyPair)
            } else {
                return .failure(PublicKeyError.publicKeyNotFound)
            }
        } catch let error as DefaultPlatformKeyManager.PlatformKeyManagerError {
            logger.error("Failed to get current key pair: \(error)")
            switch error {
            case .noUserId:
                return .failure(SudoVirtualCardsError.notSignedIn)
            default:
                return .failure(error)
            }
        } catch {
            logger.error("Failed to get local current key pair: \(error)")
            return .failure(SudoVirtualCardsError.localKeyPairFailure)
        }
    }

    /// Get the key ring.
    func getKeyRing(forKeyRingId keyRingId: String, cachePolicy: CachePolicy, completion: @escaping ClientCompletion<GetKeyRingQuery.Data>) {
        let query = GetKeyRingQuery(keyRingId: keyRingId)
        let operation = operationFactory.generateQueryOperation(query: query, graphQLClient: graphQLClient, cachePolicy: cachePolicy, logger: logger)
        let completionObserver = PlatformBlockObserver(finishHandler: { [weak operation] _, errors in
            if let error = errors.first {
                completion(.failure(error))
                return
            }
            guard let result = operation?.result else {
                return
            }
            completion(.success(result))
        })
        operation.addObserver(completionObserver)
        queue.addOperation(operation)
    }

    /// Create/Register a new public key.
    ///
    /// Although a keypair is passed in, only the public key is sent external to the device. **Private keys remain on the device only**.
    func create(withKeyPair keyPair: KeyPair, completion: @escaping ClientCompletion<PublicKey>) {
        let publicKeyString = keyPair.publicKey.base64EncodedString()
        let input = CreatePublicKeyInput(keyId: keyPair.keyId, keyRingId: keyPair.keyRingId, algorithm: Defaults.algorithm, publicKey: publicKeyString)
        let mutation = CreatePublicKeyMutation(input: input)
        let operation = operationFactory.generateMutationOperation(mutation: mutation, graphQLClient: graphQLClient, logger: logger)
        let completionObserver = PlatformBlockObserver(finishHandler: { [weak operation] _, errors in
            if let error = errors.first {
                completion(.failure(error))
                return
            }
            guard let result = operation?.result else {
                return
            }
            let publicKey = PublicKey(createPublicKeyForVirtualCards: result.createPublicKeyForVirtualCards)
            completion(.success(publicKey))
        })
        operation.addObserver(completionObserver)
        queue.addOperation(operation)
    }
}
