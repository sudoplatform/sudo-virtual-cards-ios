//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoKeyManager

extension PublicKeyEncryptionAlgorithm {
    init?(_ algorithm: String) {
        switch algorithm {
        case "RSAEncryptionOAEPAESCBC":
            self = .rsaEncryptionOAEPSHA1
        case "RSAEncryptionPKCS1":
            self = .rsaEncryptionPKCS1
        default:
            return nil
        }
    }

    func toString() -> String {
        switch self {
        case .rsaEncryptionOAEPSHA1:
            return "RSAEncryptionOAEPAESCBC"
        case .rsaEncryptionPKCS1:
            return "RSAEncryptionPKCS1"
        }
    }
}
