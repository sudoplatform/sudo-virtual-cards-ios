//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoKeyManager

struct RegisterPublicKeyInput {

    /// Client generated ID for the public key.
    var keyId: String

    /// Client generated key ring id for the public key.
    var keyRingId: String

    /// Algorithm associated with the public key.
    var algorithm: PublicKeyEncryptionAlgorithm

    /// Base 64 encoded string of the public key.
    var publicKey: String

    init(
        keyId: String = UUID().uuidString,
        keyRingId: String = UUID().uuidString,
        algorithm: PublicKeyEncryptionAlgorithm = .rsaEncryptionOAEPSHA1,
        publicKey: String
    ) {
        self.keyId = keyId
        self.keyRingId = keyRingId
        self.algorithm = algorithm
        self.publicKey = publicKey
    }

    init(
        keyId: String = UUID().uuidString,
        keyRingId: String = UUID().uuidString,
        algorithm: PublicKeyEncryptionAlgorithm = .rsaEncryptionOAEPSHA1,
        publicKey: Data
    ) {
        self.keyId = keyId
        self.keyRingId = keyRingId
        self.algorithm = algorithm
        self.publicKey = publicKey.base64EncodedString()
    }

}
