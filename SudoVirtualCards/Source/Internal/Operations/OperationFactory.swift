//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoProfiles
import SudoUser
import SudoLogging
import AWSAppSync
import SudoOperations

class OperationFactory {

    func generateGetOwnershipProofOperation(
        sudoId: String,
        profilesClient: SudoProfilesClient,
        logger: Logger
    ) -> GetOwnershipProofOperation {
        return GetOwnershipProofOperation(
            profilesClient: profilesClient,
            sudoId: sudoId,
            logger: logger)
    }

    func generateRefreshTokenOperation(userClient: SudoUserClient, logger: Logger) -> RefreshTokenOperation {
        return RefreshTokenOperation(userClient: userClient, logger: logger)
    }

    func generateRegisterPublicKeyOperation(
        keyPair: KeyPair,
        appSyncClient: AWSAppSyncClient,
        logger: Logger
    ) -> RegisterPublicKeyOperation {
        return RegisterPublicKeyOperation(
            keyPair: keyPair,
            appSyncClient: appSyncClient,
            logger: logger,
            operationFactory: self)
    }

    func generateProvisionCardOperation(
        input: ProvisionCardInput,
        publicKey: PublicKey? = nil,
        ownershipProof: OwnershipProofJWT? = nil,
        clientRefId: String,
        appSyncClient: AWSAppSyncClient,
        userClient: SudoUserClient,
        logger: Logger
    ) -> ProvisionCardOperation {
        return ProvisionCardOperation(
            input: input,
            publicKey: publicKey,
            ownershipProof: ownershipProof,
            clientRefId: clientRefId,
            appSyncClient: appSyncClient,
            userClient: userClient,
            logger: logger)
    }

    func generateQueryOperation<Query: GraphQLQuery>(
        query: Query,
        appSyncClient: AWSAppSyncClient,
        cachePolicy: CachePolicy,
        logger: Logger
    ) -> PlatformQueryOperation<Query> {
        return PlatformQueryOperation(
            appSyncClient: appSyncClient,
            query: query,
            cachePolicy: cachePolicy.toSudoOperationsCachePolicy(),
            logger: logger)
    }

    func generateMutationOperation<Mutation: GraphQLMutation>(
        mutation: Mutation,
        optimisticUpdate: OptimisticResponseBlock? = nil,
        optimisticCleanup: OptimisticCleanupBlock? = nil,
        appSyncClient: AWSAppSyncClient,
        serviceErrorTransformations: [ServiceErrorTransformationCompletion]? = nil,
        logger: Logger
    ) -> PlatformMutationOperation<Mutation> {
        var serviceErrorTransformations = serviceErrorTransformations ?? []
        serviceErrorTransformations.append(SudoVirtualCardsError.init(_:))

        return PlatformMutationOperation(
            appSyncClient: appSyncClient,
            serviceErrorTransformations: serviceErrorTransformations,
            mutation: mutation,
            optimisticUpdate: optimisticUpdate,
            optimisticCleanup: optimisticCleanup,
            logger: logger)
    }
}
