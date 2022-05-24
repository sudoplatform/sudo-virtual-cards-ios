//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoKeyManager

/// Denotes a Base 64 encoded `String` that can be unsealed to a `String`.
typealias SealedString = String
/// Denotes a Base 64 encoded `String` that can be unsealed to a `Int`.
typealias SealedInt = String
/// Denotes a Base 64 encoded `String` that can be unsealed to a `Double`.
typealias SealedDouble = String
/// Denotes a Base 64 encoded `String` that can be unsealed to a `Date`.
typealias SealedDate = String

struct KeyInfo {
    // MARK: - Supplementary

    enum KeyType {
        case privateKey
        case symmetricKey
    }

    // MARK: - Properties

    /// Key Id to be used to access the stored key and decrypt the data with.
    var keyId: String
    /// Type of key.
    var keyType: KeyType
    /// Algorithm in plain text to use to decrypt the AES key.
    var algorithm: String
}

/// Worker to ease the burden of decryption. Works in conjunction with `Unsealer` to unseal any attributes incoming from GraphQL API.
/// This worker works primarily in two steps:
///     1. Decodes input base64 string to encrypted payload.
///     2. Decrypt the encrypted payload (if possible);
protocol DecryptionWorker {
    // MARK: - Methods: Decrypting Properties

    /// Unseal an integer property.
    ///
    /// - Parameter int: Base 64 encoded encrypted int value as a string to be decrypted.
    /// - Parameter keyInfo: Used to decrypt.
    /// - Throws:
    ///     - `UnsealingError.dataDecodingFailed`:
    ///         - If the input data cannot be encoded to a base 64 data object.
    ///         - If The decrypted data cannot be decoded to a string.
    ///         - If the unsealed object cannot be decoded to an `Int`.
    ///     - `KeyManagerError` if the data cannot be decrypted.
    func unsealInt(_ int: SealedInt, withKeyInfo keyInfo: KeyInfo) throws -> Int

    /// Unseal an double property.
    ///
    /// - Parameter double: Base 64 encoded encrypted double value as a string to be decrypted.
    /// - Parameter keyInfo: Used to decrypt.
    /// - Throws:
    ///     - `UnsealingError.dataDecodingFailed`:
    ///         - If the input data cannot be encoded to a base 64 data object.
    ///         - If The decrypted data cannot be decoded to a string.
    ///         - If the unsealed object cannot be decoded to an `Double`.
    ///     - `KeyManagerError` if the data cannot be decrypted.
    func unsealDouble(_ double: SealedDouble, withKeyInfo keyInfo: KeyInfo) throws -> Double

    /// Unseal an string property.
    ///
    /// - Parameter string: Base 64 encoded encrypted string value as a string to be decrypted.
    /// - Parameter keyInfo: Used to decrypt.
    /// - Throws:
    ///     - `UnsealingError.dataDecodingFailed`:
    ///         - If the input data cannot be encoded to a base 64 data object.
    ///         - If the unsealed object cannot be decoded to an `String`.
    ///     - `KeyManagerError` if the data cannot be decrypted.
    func unsealString(_ string: SealedString, withKeyInfo keyInfo: KeyInfo) throws -> String

    /// Unseal an date property.
    ///
    /// - Parameter date: Base 64 encoded encrypted date value as a string to be decrypted.
    /// - Parameter keyInfo: Used to decrypt.
    /// - Throws:
    ///     - `UnsealingError.dataDecodingFailed`:
    ///         - If the input data cannot be encoded to a base 64 data object.
    ///         - If The decrypted data cannot be decoded to a string.
    ///         - If the unsealed object cannot be decoded to an `Date`.
    ///     - `KeyManagerError` if the data cannot be decrypted.
    func unsealDate(_ date: SealedDate, withKeyInfo keyInfo: KeyInfo) throws -> Date
}

class DefaultDecryptionWorker: DecryptionWorker {

    // MARK: - Properties

    /// Unowned instance of `PlatformKeyManager` used to decrypt data.
    private unowned let platformKeyManager: PlatformKeyManager

    /// Size of the AES symmetric key.
    private static let aesKeySize = 256

    // MARK: - Lifecycle

    init(platformKeyManager: PlatformKeyManager) {
        self.platformKeyManager = platformKeyManager
    }

    // MARK: - Decrypting Properties

    func unsealInt(_ int: SealedInt, withKeyInfo keyInfo: KeyInfo) throws -> Int {
        let decrypted = try decrypt(int, withKeyInfo: keyInfo)
        guard let int = Int(decrypted) else {
            throw UnsealingError.dataDecodingFailed
        }
        return int

    }

    func unsealDouble(_ double: SealedDouble, withKeyInfo keyInfo: KeyInfo) throws -> Double {
        let decrypted = try decrypt(double, withKeyInfo: keyInfo)
        guard let double = Double(decrypted) else {
            throw UnsealingError.dataDecodingFailed
        }
        return double
    }

    func unsealString(_ string: SealedString, withKeyInfo keyInfo: KeyInfo) throws -> String {
        return try decrypt(string, withKeyInfo: keyInfo)
    }

    func unsealDate(_ date: SealedDate, withKeyInfo keyInfo: KeyInfo) throws -> Date {
        let double = try unsealDouble(date, withKeyInfo: keyInfo)
        return Date(millisecondsSince1970: double)
    }

    /// Decrypt the input string using the keyId.
    ///
    /// - Parameter input: Input string to be decrypted.
    /// - keyInfo: Info used to decrypt.
    /// - Throws:
    ///     - `UnsealingError.dataDecodingFailed`:
    ///         - If the input data cannot be encoded to a base 64 data object.
    ///         - If the decrypted data cannot be decoded to a string.
    ///     - `KeyManagerError` if the data cannot be decrypted.
    func decrypt(_ input: String, withKeyInfo keyInfo: KeyInfo) throws -> String {
        switch keyInfo.keyType {
        case .privateKey:
            return try decryptWithPrivateKeyId(keyInfo.keyId, algorithm: keyInfo.algorithm, input: input)
        case .symmetricKey:
            return try decryptWithSymmetricKeyId(keyInfo.keyId, algorithm: keyInfo.algorithm, input: input)
        }
    }

    func decryptWithPrivateKeyId(_ keyId: String, algorithm: String, input: String) throws -> String {
        guard let decodedAlgorithm = PublicKeyEncryptionAlgorithm(algorithm) else {
            throw UnsealingError.unsupportedAlgorithm(algorithm)
        }
        guard let payload = Data(base64Encoded: input) else {
            throw UnsealingError.dataDecodingFailed
        }
        guard payload.count > DefaultDecryptionWorker.aesKeySize else {
            throw UnsealingError.symmetricKeyMissing
        }
        let aesEncrypted = payload.subdata(in: Range(uncheckedBounds: (0, 256)))
        let aesDecrypted = try platformKeyManager.decrypt(withPrivateKeyId: keyId, algorithm: decodedAlgorithm, data: aesEncrypted)

        let cipherData = payload.subdata(in: Range(uncheckedBounds: (256, payload.count)))
        let decrypted = try platformKeyManager.decryptWithSymmetricKey(aesDecrypted, data: cipherData)

        guard let string = String(data: decrypted, encoding: .utf8) else {
            throw UnsealingError.dataNotUTF8Encoded
        }
        return string

    }

    func decryptWithSymmetricKeyId(_ keyId: String, algorithm: String, input: String) throws -> String {
        guard let payload = Data(base64Encoded: input) else {
            throw UnsealingError.dataDecodingFailed
        }
        let decrypted = try platformKeyManager.decrypt(withSymmetricKeyId: keyId, data: payload)
        guard let decoded = String(data: decrypted, encoding: .utf8) else {
            throw UnsealingError.dataDecodingFailed
        }
        return decoded
    }
}
