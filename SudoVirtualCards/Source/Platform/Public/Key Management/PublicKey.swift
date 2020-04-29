//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
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

    let created: Date

    let updated: Date

    // MARK: - Lifecycle

    init(
        id: String,
        keyId: String,
        keyRingId: String,
        algorithm: String,
        publicKey: String,
        owner: String,
        version: Int,
        created: Date,
        updated: Date
    ) {
        self.id = id
        self.keyId = keyId
        self.keyRingId = keyRingId
        self.algorithm = algorithm
        self.publicKey = publicKey
        self.owner = owner
        self.version = version
        self.created = created
        self.updated = updated
    }

    // MARK: - Lifecycle: GraphQL Translation

    init(createPublicKeyForVirtualCards publicKey: CreatePublicKeyForVirtualCardsMutation.Data.CreatePublicKeyForVirtualCard) {
        let created = Date(millisecondsSince1970: publicKey.createdAtEpochMs)
        let updated = Date(millisecondsSince1970: publicKey.updatedAtEpochMs)
        self.init(
            id: publicKey.id,
            keyId: publicKey.keyId,
            keyRingId: publicKey.keyRingId,
            algorithm: publicKey.algorithm,
            publicKey: publicKey.publicKey,
            owner: publicKey.owner,
            version: publicKey.version,
            created: created,
            updated: updated)
    }

    init(deletePublicKeyForVirtualCards publicKey: DeletePublicKeyForVirtualCardsMutation.Data.DeletePublicKeyForVirtualCard) {
        let created = Date(millisecondsSince1970: publicKey.createdAtEpochMs)
        let updated = Date(millisecondsSince1970: publicKey.updatedAtEpochMs)
        self.init(
            id: publicKey.id,
            keyId: publicKey.keyId,
            keyRingId: publicKey.keyRingId,
            algorithm: publicKey.algorithm,
            publicKey: publicKey.publicKey,
            owner: publicKey.owner,
            version: publicKey.version,
            created: created,
            updated: updated)
    }

    init(getPublicKeyForVirtualCards publicKey: GetPublicKeyForVirtualCardsQuery.Data.GetPublicKeyForVirtualCard) {
        let created = Date(millisecondsSince1970: publicKey.createdAtEpochMs)
        let updated = Date(millisecondsSince1970: publicKey.updatedAtEpochMs)
        self.init(
            id: publicKey.id,
            keyId: publicKey.keyId,
            keyRingId: publicKey.keyRingId,
            algorithm: publicKey.algorithm,
            publicKey: publicKey.publicKey,
            owner: publicKey.owner,
            version: publicKey.version,
            created: created,
            updated: updated)
    }

    init(getPublicKeysForVirtualCards publicKey: GetPublicKeysForVirtualCardsQuery.Data.GetPublicKeysForVirtualCard.Item) {
        let created = Date(millisecondsSince1970: publicKey.createdAtEpochMs)
        let updated = Date(millisecondsSince1970: publicKey.updatedAtEpochMs)
        self.init(
            id: publicKey.id,
            keyId: publicKey.keyId,
            keyRingId: publicKey.keyRingId,
            algorithm: publicKey.algorithm,
            publicKey: publicKey.publicKey,
            owner: publicKey.owner,
            version: publicKey.version,
            created: created,
            updated: updated)
    }

    init(getKeyRingForVirtualCards publicKey: GetKeyRingForVirtualCardsQuery.Data.GetKeyRingForVirtualCard.Item) {
        let created = Date(millisecondsSince1970: publicKey.createdAtEpochMs)
        let updated = Date(millisecondsSince1970: publicKey.updatedAtEpochMs)
        self.init(
            id: publicKey.id,
            keyId: publicKey.keyId,
            keyRingId: publicKey.keyRingId,
            algorithm: publicKey.algorithm,
            publicKey: publicKey.publicKey,
            owner: publicKey.owner,
            version: publicKey.version,
            created: created,
            updated: updated)
    }
}
