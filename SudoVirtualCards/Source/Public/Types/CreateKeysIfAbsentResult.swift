//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Result of `SudoVirtualCardsClient.createKeysIfAbsent` API.
public struct CreateKeysIfAbsentResult {

    // MARK: - Supplementary

    public struct KeyResult {
        /// Whether or not key needed to be created.
        public let created: Bool

        /// Identifier of the key.
        public let keyId: String
    }

    // MARK: - Properties

    /// Result of the `SudoVirtualCardsClient.createKeysIfAbsent` API of the symmetric key.
    public let symmetricKey: KeyResult

    /// Result of the `SudoVirtualCardsClient.createKeysIfAbsent` API of the key pair.
    public let keyPair: KeyResult

    // MARK: - Lifecycle

    public init(symmetricKey: KeyResult, keyPair: KeyResult) {
        self.symmetricKey = symmetricKey
        self.keyPair = keyPair
    }
}
