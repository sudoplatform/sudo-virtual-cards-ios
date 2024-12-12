//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest
@testable import SudoVirtualCardsNotificationExtension

final class VirtualCardsServiceNotificationTests: XCTestCase {

    // MARK: - VirtualCardsServiceNotification

    func testCorrectlyDeserialisesFundingSourceChangedNotification() throws {
        let expected = FundingSourceChangedNotification(
            type: "fundingSourceChanged",
            owner: "d4bc1a13-688c-4408-9103-d84880bcdd7a",
            fundingSourceId: "vc-fnd-015693d2-1631-4361-9e5e-10496a80c053",
            fundingSourceType: FundingSourceType.creditCard,
            last4: "4321",
            state: FundingSourceState.inactive,
            flags: [FundingSourceFlags.unfunded],
            updatedAtEpochMs: 1718330541336
        )
        let encoder = JSONEncoder()
        let json = """
        {
            "type":"\(expected.type)",
            "owner":"\(expected.owner)",
            "fundingSourceId":"\(expected.fundingSourceId)",
            "fundingSourceType": \(String(decoding: try encoder.encode(expected.fundingSourceType), as: UTF8.self)),
            "last4":"\(expected.last4)",
            "state":\(String(decoding: try encoder.encode(expected.state), as: UTF8.self)),
            "flags":[\(String(decoding: try encoder.encode(expected.flags[0]), as: UTF8.self))],
            "updatedAtEpochMs":\(expected.updatedAtEpochMs)
        }
        """

        let decoder = JSONDecoder()

        let decoded = try decoder.decode(VirtualCardsServiceNotification.self, from: json.data(using: .utf8)!)
        guard case .fundingSourceChanged(let decoded) = decoded else {
            return XCTFail("decoded notification is not a FundingSourceChangedNotification")
        }
        XCTAssertEqual(decoded, expected)
    }

    func testDeserialisesUnknownNotification() throws {
        let expected = "unknown"

        let json = """
        {
            "type":"\(expected)",
            "owner":"some-owner",
            "some":"property"
        }
        """

        let decoder = JSONDecoder()

        let decoded = try decoder.decode(VirtualCardsServiceNotification.self, from: json.data(using: .utf8)!)
        guard case .unknown(let decoded) = decoded else {
            return XCTFail("decoded notification is not an VirtualCardsUnknownNotification")
        }

        XCTAssertEqual(decoded, expected)
    }
}
