//
// Copyright © 2020 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSAppSync
import SudoLogging
import SudoProfiles
import SudoUser
import SudoOperations

/// Provision Card Dependency Condition.
///
/// Ensures that dependencies are correctly evaluated and injects dependency data into the `ProvisionCardOperation`.
class ProvisionCardDependencyCondition: PlatformOperationCondition {

    static var name: String = "ProvisionCardDependencyCondition"

    func dependencyForOperation(_ operation: PlatformOperation) -> Operation? {
        return nil
    }

    func evaluateForOperation(_ operation: PlatformOperation, completion: (PlatformOperationConditionResult) -> Void) {
        guard let operation = operation as? ProvisionCardOperation else {
            let cause = "Only `ProvisionCardOperation` can be assigned with a \(type(of: self).name) condition"
            let error = SudoVirtualCardsError.internalError(cause: cause)
            completion(.failure(error))
            return
        }
        guard let registerPublicKeyOperation = operation.dependencies.first(where: { $0 is RegisterPublicKeyOperation }) as? RegisterPublicKeyOperation else {
            let cause = "Required `RegisterPublicKeyOperation` dependency is missing"
            let error = SudoVirtualCardsError.internalError(cause: cause)
            completion(.failure(error))
            return
        }
        if let error = registerPublicKeyOperation.errors.first {
            completion(.failure(error))
            return
        }
        guard let publicKey = registerPublicKeyOperation.result else {
            let cause = "Unable to resolve `publicKey` from `RegisterPublicKeyOperation` dependency"
            let error = SudoVirtualCardsError.internalError(cause: cause)
            completion(.failure(error))
            return
        }
        guard let getOwnershipProofOperation = operation.dependencies.first(where: { $0 is GetOwnershipProofOperation}) as? GetOwnershipProofOperation else {
            let cause = "Required `GetOwnershipProofOperation` dependency is missing"
            let error = SudoVirtualCardsError.internalError(cause: cause)
            completion(.failure(error))
            return
        }
        if let error = getOwnershipProofOperation.errors.first {
            completion(.failure(error))
            return
        }
        guard let ownershipProof = getOwnershipProofOperation.result else {
            let cause = "Unable to resolve `ownershipProof` from `GetOwnershipProofOperation` dependency"
            let error = SudoVirtualCardsError.internalError(cause: cause)
            completion(.failure(error))
            return
        }
        operation.injectables = ProvisionCardOperation.Injectables(publicKey: publicKey, ownershipProof: ownershipProof)
        completion(.success(()))
    }

}

/// Provision a card. Calls the card service class to create a card, and returns either the success state, or fails.
///
/// This operation has the following dependencies:
///  - `RegisterPublicKeyOperation`: Injects the public key needed create a card.
///  - `GetOwnershipProofOperation`: Injects the ownership proof needed to create a card.
class ProvisionCardOperation: PlatformOperation {

    // MARK: - Supplementary

    /// Injectable data from the dependencies of the operation.
    struct Injectables {
        /// Registed public key from `RegisterPublicKeyOperation`.
        let publicKey: PublicKey
        /// Ownership proof from `GetOwnershipProofOperation`.
        let ownershipProof: OwnershipProofJWT
    }

    // MARK: - Properties: Result

    /// Result of the operation. Card state from the call to `CardService.create()`.
    var result: ProvisionalCard.State?

    // MARK: - Properties: Inputs

    /// Input information from the user used to create a card.
    var input: ProvisionCardInput

    /// Owner identifier for the card. This is the account identifer of the user.
    var owner: String

    /// Client reference identifier, generated from `DefaultSudoVirtualCardsClient`. This is used to identify the transaction of the provision card event.
    var clientRefId: String

    /// Injectable data from the dependencies of the operation.
    var injectables: Injectables!

    /// Card service used to create the card.
    unowned var cardService: CardService

    // MARK: - Lifecycle

    /// Initialize an instance of the `ProvisionCardOperation`.
    init(
        input: ProvisionCardInput,
        owner: String,
        clientRefId: String,
        cardService: CardService,
        logger: Logger
    ) {
        self.input = input
        self.owner = owner
        self.clientRefId = clientRefId
        self.cardService = cardService
        super.init(logger: logger)
        addCondition(ProvisionCardDependencyCondition())
    }

    // MARK: - PlatformOperation

    override func execute() {
        cardService.create(
            withInput: input,
            publicKey: injectables.publicKey,
            owner: owner,
            ownershipProof: injectables.ownershipProof,
            clientRefId: clientRefId
        ) { result in
            switch result {
            case let .success(state):
                self.result = state
                self.finish()
                return
            case let .failure(error):
                self.finishWithError(error)
            }
        }
    }
}
