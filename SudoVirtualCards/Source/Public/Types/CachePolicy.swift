//
//  CachePolicy.swift
//  SudoVirtualCards
//
//  Created by Lachlan McCulloch on 28/4/20.
//  Copyright © 2020 Anonyome Labs. All rights reserved.
//

import Foundation
import SudoOperations

/// Cache policy that determines how data is accessed when performing a query method from
/// the Virtual Cards Service.
///
/// This is a veneer around `SudoOperations.CachePolicy`.
public enum CachePolicy {
    /// Use the device cached data.
    case useCache
    /// Query and use the data on the server.
    case useOnline

    // MARK: - Internal

    /// Converts `Self` to the matching SudoOperations `CachePolicy`.
    func toSudoOperationsCachePolicy() -> SudoOperations.CachePolicy {
        switch self {
        case .useCache:
            return SudoOperations.CachePolicy.useCache
        case .useOnline:
            return SudoOperations.CachePolicy.useOnline
        }
    }
}
