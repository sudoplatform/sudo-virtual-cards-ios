//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest
@testable import SudoVirtualCardsNotificationExtension

final class SudoVirtualCardsNotifiableClientTests: XCTestCase {

    // MARK: - decode

    var iut: DefaultSudoVirtualCardsNotifiableClient!

    override func setUp() async throws {
        iut = DefaultSudoVirtualCardsNotifiableClient(
            logger: .virtualCardsSDKLogger
        )
    }

    func testShouldReturnUnknownNotificationWithServiceTypeIfPayloadIsNotSealedNotification() throws {
        let decoded = iut.decode(data:"jibberish")

        guard let decoded = decoded as? VirtualCardsUnknownNotification else {
            return XCTFail("decoded notification is not a VirtualCardsUnknownNotification")
        }

        let expected = VirtualCardsUnknownNotification(type: Constants.serviceName)
        XCTAssertEqual(decoded, expected)
    }

    func testShouldReturnUnknownNotificationWithDecodedTypeIfDataDecodesToUnknownNotification() throws {
        let type = "some-type"

        let notification = """
        {
          "type":"\(type)"
        }
        """

        let decoded = iut.decode(data: notification)

        guard let decoded = decoded as? VirtualCardsUnknownNotification else {
            return XCTFail("decoded notification is not a VirtualCardsUnknownNotification")
        }

        let expected = VirtualCardsUnknownNotification(type: type)
        XCTAssertEqual(decoded, expected)
    }

    func testShouldReturnVirtualCardsFundingSourceChangedNotificationWithDecodedTypeIfDataDecodesToFundingSourceChangedNotification() throws {
        let type = "fundingSourceChanged"


        let internalNotif = FundingSourceChangedNotification(
            type: type,
            owner: "d4bc1a13-688c-4408-9103-d84880bcdd7a",
            fundingSourceId: "em-add-015693d2-1631-4361-9e5e-10496a80c053",
            fundingSourceType: FundingSourceType.bankAccount,
            last4: "4321",
            state: FundingSourceState.active,
            flags: [FundingSourceFlags.refresh],
            updatedAtEpochMs: 1718330541336
        )
        let encoder = JSONEncoder()

        let json = """
        {
            "type":"\(internalNotif.type)",
            "owner":"\(internalNotif.owner)",
            "fundingSourceId":"\(internalNotif.fundingSourceId)",
            "fundingSourceType": \(String(decoding: try encoder.encode(internalNotif.fundingSourceType), as: UTF8.self)),
            "last4":"\(internalNotif.last4)",
            "state":\(String(decoding: try encoder.encode(internalNotif.state), as: UTF8.self)),
            "flags":[\(String(decoding: try encoder.encode(internalNotif.flags[0]), as: UTF8.self))],
            "updatedAtEpochMs":\(internalNotif.updatedAtEpochMs)
        }
        """

        let decoded = iut.decode(data: json)

        guard let decoded = decoded as? VirtualCardsFundingSourceChangedNotification else {
            return XCTFail("decoded notification is not a VirtualCardsFundingSourceChangedNotification")
        }

        let expected = VirtualCardsServiceNotification.fundingSourceChanged(internalNotif).toSudoNotification() as! VirtualCardsFundingSourceChangedNotification

        XCTAssertEqual(decoded, expected)
    }
}
