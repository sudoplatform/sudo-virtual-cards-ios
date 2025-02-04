//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoLogging
import AWSAppSync
import SudoApiClient
import SudoKeyManager

/// Abstraction of the SDKs capabilities surrounding `PublicKey` access/manipulation with virtual cards service.
///
/// Also provides some utility methods for interacting with internal functionality, such as the key manager.
class PublicKeyService {

    // MARK: - Supplementary

    /// Typealias for the result returned from `getCurrentKeyPair`.
    typealias GetCurrentKeyPairResult = Swift.Result<KeyPair, Error>

    /// Typealias for the GraphQL query type for accessing the key ring.
    typealias GetKeyRingQuery = GraphQL.GetKeyRingQuery

    /// Default values used in `CardService`.
    enum Defaults {
        /// algorithm used when creating/registering public keys.
        static let algorithm = PublicKeyEncryptionAlgorithm.rsaEncryptionOAEPSHA1
    }

    // MARK: - Properties

    /// App Sync Client used to interact with the GraphQL endpoint of the virtual cards service.
    private unowned var graphQLClient: SudoApiClient

    /// Platform key manager used to access the iOS keychain for mainpulating and accessing key data.
    private unowned var platformKeyManager: PlatformKeyManager

    /// Logs errors and diagnostic information.
    private var logger: Logger

    // MARK: - Lifecycle

    /// Initialize an instance of `PublicKeyService`.
    init(
        graphQLClient: SudoApiClient,
        platformKeyManager: PlatformKeyManager,
        logger: Logger = Logger.virtualCardsSDKLogger
    ) {
        self.graphQLClient = graphQLClient
        self.platformKeyManager = platformKeyManager
        self.logger = logger
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

    /// Get the public key associated with the registered public key on the virtual cards service.
    ///
    /// - Parameter id: Id associated with the public key.
    /// - Parameter cachePolicy: Determines how the data is fetched. When using `cacheOnly`, please be aware that this
    ///                          will only return cached results of similar exact API calls.
    /// - Returns:
    ///     - Success: `PublicKey` associated with `id`, or `nil` if the public key cannot be found.
    ///     - Failure:
    ///         - SudoPlatformError.
    func getPublicKeyWithId(_ id: String, cachePolicy: CachePolicy) async throws -> PublicKey? {
        let query = GraphQL.GetPublicKeyQuery(keyId: id, keyFormats: nil)
        let data = try await GraphQLHelper.performQuery(graphQLClient: graphQLClient, query: query, cachePolicy: cachePolicy, logger: logger)
        guard let key = data?.getPublicKeyForVirtualCards else {
            return nil
        }
        return PublicKey(getPublicKeyForVirtualCards: key)
    }

    /// Get the key ring.
    func getKeyRing(forKeyRingId keyRingId: String, cachePolicy: CachePolicy) async throws -> GetKeyRingQuery.Data {
        let query = GetKeyRingQuery(keyRingId: keyRingId, keyFormats: nil)
        let data = try await GraphQLHelper.performQuery(
            graphQLClient: graphQLClient,
            query: query,
            cachePolicy: cachePolicy,
            logger: logger
        )
        guard let result = data else {
            logger.error("Failed to get key ring")
            throw SudoVirtualCardsError.getFailed
        }
        return result
    }

    /// Create/Register a new public key.
    ///
    /// Although a keypair is passed in, only the public key is sent external to the device. **Private keys remain on the device only**.
    func create(withKeyPair keyPair: KeyPair) async throws -> PublicKey {
        let publicKeyString = keyPair.publicKey.base64EncodedString()
        let input = GraphQL.CreatePublicKeyInput(
            algorithm: Defaults.algorithm.toString(),
            keyId: keyPair.keyId,
            keyRingId: keyPair.keyRingId,
            publicKey: publicKeyString
        )
        let mutation = GraphQL.CreatePublicKeyMutation(input: input)
        let data = try await GraphQLHelper.performMutation(graphQLClient: graphQLClient, mutation: mutation, logger: logger)
        return PublicKey(createPublicKeyForVirtualCards: data.createPublicKeyForVirtualCards)
    }
}
