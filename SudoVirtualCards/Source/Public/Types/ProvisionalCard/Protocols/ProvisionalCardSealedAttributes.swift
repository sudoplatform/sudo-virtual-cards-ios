//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public protocol ProvisionalCardSealedAttributes: Hashable {

    // MARK: - Properties

    /// Fully fledged card.
    var card: VirtualCard? { get set }

}
