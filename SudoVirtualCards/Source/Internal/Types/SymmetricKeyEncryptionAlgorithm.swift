//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// List of supported symmetric key encryption algorithms.
enum SymmetricKeyEncryptionAlgorithm: String {
    case aesCBCPKCS7Padding = "AES/CBC/PKCS7Padding"

    static func isAlgorithmSupported(_ algorithm: String) -> Bool {
        return SymmetricKeyEncryptionAlgorithm(rawValue: algorithm) != nil
    }
}
