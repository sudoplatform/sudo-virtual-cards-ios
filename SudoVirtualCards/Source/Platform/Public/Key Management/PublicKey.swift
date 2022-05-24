//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

struct PublicKey: Hashable {

    // MARK: - Properties

    let id: String

    let keyId: String

    let keyRingId: String

    let algorithm: String

    let publicKey: String

    let owner: String

    let version: Int

    let createdAt: Date

    let updatedAt: Date

    // MARK: - Lifecycle

    init(
        id: String,
        keyId: String,
        keyRingId: String,
        algorithm: String,
        publicKey: String,
        owner: String,
        version: Int,
        createdAt: Date,
        updatedAt: Date
    ) {
        self.id = id
        self.keyId = keyId
        self.keyRingId = keyRingId
        self.algorithm = algorithm
        self.publicKey = publicKey
        self.owner = owner
        self.version = version
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    // MARK: - Lifecycle: GraphQL Translation

    init(createPublicKeyForVirtualCards publicKey: GraphQL.CreatePublicKeyMutation.Data.CreatePublicKeyForVirtualCard) {
        let createdAt = Date(millisecondsSince1970: publicKey.createdAtEpochMs)
        let updatedAt = Date(millisecondsSince1970: publicKey.updatedAtEpochMs)
        self.init(
            id: publicKey.id,
            keyId: publicKey.keyId,
            keyRingId: publicKey.keyRingId,
            algorithm: publicKey.algorithm,
            publicKey: publicKey.publicKey,
            owner: publicKey.owner,
            version: publicKey.version,
            createdAt: createdAt,
            updatedAt: updatedAt)
    }

    init(deletePublicKeyForVirtualCards publicKey: GraphQL.DeletePublicKeyMutation.Data.DeletePublicKeyForVirtualCard) {
        let createdAt = Date(millisecondsSince1970: publicKey.createdAtEpochMs)
        let updatedAt = Date(millisecondsSince1970: publicKey.updatedAtEpochMs)
        self.init(
            id: publicKey.id,
            keyId: publicKey.keyId,
            keyRingId: publicKey.keyRingId,
            algorithm: publicKey.algorithm,
            publicKey: publicKey.publicKey,
            owner: publicKey.owner,
            version: publicKey.version,
            createdAt: createdAt,
            updatedAt: updatedAt)
    }

    init(getPublicKeyForVirtualCards publicKey: GraphQL.GetPublicKeyQuery.Data.GetPublicKeyForVirtualCard) {
        let createdAt = Date(millisecondsSince1970: publicKey.createdAtEpochMs)
        let updatedAt = Date(millisecondsSince1970: publicKey.updatedAtEpochMs)
        self.init(
            id: publicKey.id,
            keyId: publicKey.keyId,
            keyRingId: publicKey.keyRingId,
            algorithm: publicKey.algorithm,
            publicKey: publicKey.publicKey,
            owner: publicKey.owner,
            version: publicKey.version,
            createdAt: createdAt,
            updatedAt: updatedAt)
    }

    init(getPublicKeysForVirtualCards publicKey: GraphQL.GetPublicKeysQuery.Data.GetPublicKeysForVirtualCard.Item) {
        let createdAt = Date(millisecondsSince1970: publicKey.createdAtEpochMs)
        let updatedAt = Date(millisecondsSince1970: publicKey.updatedAtEpochMs)
        self.init(
            id: publicKey.id,
            keyId: publicKey.keyId,
            keyRingId: publicKey.keyRingId,
            algorithm: publicKey.algorithm,
            publicKey: publicKey.publicKey,
            owner: publicKey.owner,
            version: publicKey.version,
            createdAt: createdAt,
            updatedAt: updatedAt)
    }

    init(getKeyRingForVirtualCards publicKey: GraphQL.GetKeyRingQuery.Data.GetKeyRingForVirtualCard.Item) {
        let createdAt = Date(millisecondsSince1970: publicKey.createdAtEpochMs)
        let updatedAt = Date(millisecondsSince1970: publicKey.updatedAtEpochMs)
        self.init(
            id: publicKey.id,
            keyId: publicKey.keyId,
            keyRingId: publicKey.keyRingId,
            algorithm: publicKey.algorithm,
            publicKey: publicKey.publicKey,
            owner: publicKey.owner,
            version: publicKey.version,
            createdAt: createdAt,
            updatedAt: updatedAt)
    }
}
