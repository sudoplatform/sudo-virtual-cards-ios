//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Key Pair created and/or retrieved from a `PlatformKeyManager`.
struct KeyPair: Hashable {
    /// Id associated with the key pair.
    var keyId: String

    /// Key ring id associated with the key pair.
    var keyRingId: String

    /// Public Key.
    var publicKey: Data

    /// Private Key.
    var privateKey: Data
}
