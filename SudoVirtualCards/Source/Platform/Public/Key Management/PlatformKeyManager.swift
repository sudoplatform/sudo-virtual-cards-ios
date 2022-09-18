//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoKeyManager
import SudoUser
import SudoLogging

/// Responsible for Managing the lifecycle of key pairs associated with a service.
/// Controls the generation of a fixed key pair per its initialized `keyRingServiceName` and `userId`.
/// The `appName` is used to control the key namespace to allow for exportable app keys.
protocol PlatformKeyManager: AnyObject {

    // MARK: - Lifecycle

    /// Initialize a `PlatformKeyManager`.
    ///
    /// - Parameter keyNamespace: The key namespace that is associated with keys and passwords on the underlying `SudoKeyManager`.
    /// - Parameter keyRingServiceName: Name of the service to be associated with key ring management.
    /// - Parameter userClient: Used to access the user's subject.
    init(keyNamespace: String, keyRingServiceName: String, userClient: SudoUserClient, logger: Logger)

    // MARK: - Methods

    /// Get the key ring id associated with the owners service.
    /// Throws: `PlatformKeyManagerError.noUserId` if the user Id cannot be found.
    func getKeyRingId() throws -> String

    /// Returns the current key pair that is being used by this service.
    /// If no key pair has been previously generated, will return `nil`, and require the caller
    /// to call `generateNewCurrentKeyPair()` if they require a current key pair.
    func getCurrentKeyPair() throws -> KeyPair?

    /// Get the Key Pair associated with the id if it exists.
    func getKeyPairWithId(_ id: String) throws -> KeyPair?

    /// Generate a new current key pair.
    func generateNewCurrentKeyPair() throws -> KeyPair

    func generateNewCurrentSymmetricKey() throws -> String

    func getCurrentSymmetricKeyId() throws -> String?

    /// Decrypt input `data` using the input `keyId`.
    /// - Parameter keyId: Key id to be used to access the key to decrypt the `data` with.
    /// - Parameter algorithm: Algorithm to decrypt the `data`.
    /// - Parameter data: Data to be decrypted.
    /// - Throws: `KeyManagerError` if the key cannot be found or the data cannot be decrypted.
    func decrypt(withPrivateKeyId keyId: String, algorithm: PublicKeyEncryptionAlgorithm, data: Data) throws -> Data

    func decrypt(withSymmetricKeyId keyId: String, data: Data) throws -> Data

    func encrypt(withSymmetricKeyId keyId: String, data: Data) throws -> Data

    /// Decrypt the input `data` using the `key`.
    func decryptWithSymmetricKey(_ key: Data, data: Data) throws -> Data

    func removeAllKeys() throws
}

class DefaultPlatformKeyManager: PlatformKeyManager {

    // MARK: - Supplementary

    private struct Constants {
        static let currentKeyIdPointerName: String = "current"
        static let secretKeyIdKeyName: String = "vc-secret-key"
        static let keyManagerKeyTag = "com.sudoplatform"
        static let defaultKeyManagerServiceName = "com.sudoplatform.appservicename"
    }

    enum PlatformKeyManagerError: Error {
        case keyPairIdEncodingFailed
        case currentKeyPairIdSaveFailed
        case getKeyPairFailed
        case noUserId
    }

    // MARK: - Properties

    // MARK: - Properties: Private

    /// Name of the service associated with the Key Ring.
    private let keyRingServiceName: String

    /// This is a document comment
    private let keyManager: SudoKeyManager

    private let userClient: SudoUserClient

    private let logger: Logger

    // MARK: - Lifecycle

    required convenience init(
        keyNamespace: String,
        keyRingServiceName: String,
        userClient: SudoUserClient,
        logger: Logger
    ) {
        let keyManager = LegacySudoKeyManager(
            serviceName: Constants.defaultKeyManagerServiceName,
            keyTag: Constants.keyManagerKeyTag,
            namespace: keyNamespace)
        self.init(
            keyRingServiceName: keyRingServiceName,
            userClient: userClient,
            logger: logger,
            keyManager: keyManager)
    }

    /// Initializer used for testing, should not be used in production code.
    init(
        keyRingServiceName: String,
        userClient: SudoUserClient,
        logger: Logger,
        keyManager: SudoKeyManager
    ) {
        self.keyRingServiceName = keyRingServiceName
        self.userClient = userClient
        self.keyManager = keyManager
        self.logger = logger
    }

    // MARK: - Methods

    func getKeyRingId() throws -> String {
        guard let userId = try userClient.getSubject() else {
            throw PlatformKeyManagerError.noUserId
        }
        return "\(keyRingServiceName).\(userId)"
    }

    func getCurrentKeyPair() throws -> KeyPair? {
        guard let currentKeyIdData = try keyManager.getPassword(Constants.currentKeyIdPointerName),
            let currentKeyId = String(data: currentKeyIdData, encoding: .utf8),
            let publicKey = try keyManager.getPublicKey(currentKeyId),
            let privateKey = try keyManager.getPrivateKey(currentKeyId)
        else {
            return nil
        }
        let keyRingId = try getKeyRingId()
        return KeyPair(
            keyId: currentKeyId,
            keyRingId: keyRingId,
            publicKey: publicKey,
            privateKey: privateKey)
    }

    func getKeyPairWithId(_ id: String) throws -> KeyPair? {
        guard let publicKey = try keyManager.getPublicKey(id),
            let privateKey = try keyManager.getPrivateKey(id)
        else {
            return nil
        }
        let keyRingId = try getKeyRingId()
        return KeyPair(
            keyId: id,
            keyRingId: keyRingId,
            publicKey: publicKey,
            privateKey: privateKey)
    }

    func generateNewCurrentKeyPair() throws -> KeyPair {
        let keyPairId = try keyManager.generateKeyId()
        guard let keyPairIdDataEncoded = keyPairId.data(using: .utf8) else {
            logger.error("Failed to encode keyPairId: \(keyPairId)")
            throw PlatformKeyManagerError.keyPairIdEncodingFailed
        }
        // Try to delete the existing password if it exists.
        try keyManager.deletePassword(Constants.currentKeyIdPointerName)
        try keyManager.generateKeyPair(keyPairId)
        do {
            try keyManager.addPassword(keyPairIdDataEncoded, name: Constants.currentKeyIdPointerName)
        } catch {
            // Adding the new key pair has failed, clean up and throw an error.
            logger.error("Failed to save new current key id pointer: \(keyPairId). Error: \(error)")
            try keyManager.deleteKeyPair(keyPairId)
            throw PlatformKeyManagerError.currentKeyPairIdSaveFailed
        }

        let publicKey: Data
        let privateKey: Data
        do {
            guard let pubKey = try keyManager.getPublicKey(keyPairId),
                let privKey = try keyManager.getPrivateKey(keyPairId)
            else {
                throw AnyError("get keypair failed")
            }
            publicKey = pubKey
            privateKey = privKey
        } catch {
            logger.error("Failed to get generated key pair: \(error)")
            try keyManager.deletePassword(Constants.currentKeyIdPointerName)
            try keyManager.deleteKeyPair(keyPairId)
            throw PlatformKeyManagerError.getKeyPairFailed
        }
        let keyRingId = try getKeyRingId()
        return KeyPair(
            keyId: keyPairId,
            keyRingId: keyRingId,
            publicKey: publicKey,
            privateKey: privateKey)
    }

    func generateNewCurrentSymmetricKey() throws -> String {
        let keyId = UUID().uuidString
        guard let keyIdBits = keyId.data(using: .utf8) else {
            throw SudoVirtualCardsError.fatalError(description: "keyId could not be encoded to UTF-8")
        }
        // We need to delete any old key id information before adding a new key.
        try keyManager.deletePassword(Constants.secretKeyIdKeyName)
        try keyManager.addPassword(keyIdBits, name: Constants.secretKeyIdKeyName)
        try keyManager.generateSymmetricKey(keyId)
        return keyId
    }

    func getCurrentSymmetricKeyId() throws -> String? {
        guard let keyIdBits = try keyManager.getPassword(Constants.secretKeyIdKeyName),
              let keyId = String(data: keyIdBits, encoding: .utf8)
        else {
            return nil
        }
        guard try keyManager.getSymmetricKey(keyId) != nil else {
            return nil
        }
        return keyId
    }

    func decrypt(withPrivateKeyId keyId: String, algorithm: PublicKeyEncryptionAlgorithm, data: Data) throws -> Data {
        return try keyManager.decryptWithPrivateKey(keyId, data: data, algorithm: algorithm)
    }

    func decrypt(withSymmetricKeyId keyId: String, data: Data) throws -> Data {
        return try keyManager.decryptWithSymmetricKey(keyId, data: data)
    }

    func encrypt(withSymmetricKeyId keyId: String, data: Data) throws -> Data {
        return try keyManager.encryptWithSymmetricKey(keyId, data: data)
    }

    func decryptWithSymmetricKey(_ key: Data, data: Data) throws -> Data {
        return try keyManager.decryptWithSymmetricKey(key, data: data)
    }

    func removeAllKeys() throws {
        try keyManager.removeAllKeys()
    }
}
