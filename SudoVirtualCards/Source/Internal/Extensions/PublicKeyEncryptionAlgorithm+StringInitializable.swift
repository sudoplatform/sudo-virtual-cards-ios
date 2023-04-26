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
}
