//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Depiction of a JSON Value.
public indirect enum JSONValue: Hashable {
    case string(String)
    case integer(Int)
    case double(Double)
    case bool(Bool)
    case array([JSONValue])
    case dictionary([String: JSONValue])

    init(_ any: Any) throws {
        if let json = any as? Bool {
            self = .bool(json)
        } else if let json = any as? Int {
            self = .integer(json)
        } else if let json = any as? Double {
            self = .double(json)
        } else if let json = any as? String {
            self = .string(json)
        } else if let json = any as? [Any] {
            self = .array(try json.map { try JSONValue($0) })
        } else if let json = any as? [String: Any] {
            self = .dictionary(try json.mapValues { try JSONValue($0) })
        } else {
            throw SudoVirtualCardsError.fatalError(description: "Unknown object received for metadata: \(String(describing: any))")
        }
    }

    /// Returns a dictionary as a swift dictionary, else throws if not `.dictionary type`
    func toSwiftDictionary() throws -> [String: Any] {
        guard case .dictionary(let dict) = self else {
            throw SudoVirtualCardsError.fatalError(description: "Attempted to convert a `JSONValue` non dictionary to Swift Dictionary")
        }
        return dict.mapValues { $0.toSwiftObject() }
    }

    func toSwiftObject() -> Any {
        switch self {
        case .string(let string):
            return string
        case .integer(let int):
            return int
        case .double(let double):
            return double
        case .bool(let bool):
            return bool
        case .array(let arr):
            return arr.map { $0.toSwiftObject() }
        case .dictionary(let dict):
            return dict.mapValues { $0.toSwiftObject() }
        }
    }
}
