//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

import Foundation
import XCTest
@testable import SudoVirtualCardsNotificationExtension

final class VirtualCardsServiceNotificationTransformerTests: XCTestCase {
    // MARK: - toSudoNotification: fundingSourceChanged

    func testTransformsFundingSourceChangedNotification() {
        let expected = VirtualCardsFundingSourceChangedNotification(
            owner: "owner",
            fundingSourceId: "funding-source-id",
            fundingSourceType: FundingSourceType.bankAccount,
            last4: "1234",
            state: FundingSourceState.active,
            flags: [FundingSourceFlags.unfunded],
            updatedAt: Date.init(timeIntervalSince1970: TimeInterval(2000))
        )

        let fundingSourceChanged = FundingSourceChangedNotification(
            type: "fundingSourceChanged",
            owner: expected.owner,
            fundingSourceId: expected.fundingSourceId,
            fundingSourceType: expected.fundingSourceType,
            last4: expected.last4,
            state: expected.state,
            flags: expected.flags,

            updatedAtEpochMs: Int(expected.updatedAt.timeIntervalSince1970) * 1000
        )

        let input = VirtualCardsServiceNotification.fundingSourceChanged(fundingSourceChanged)
        let actual = input.toSudoNotification()
        guard let actual = actual as? VirtualCardsFundingSourceChangedNotification else {
            return XCTFail("Transformed notification is not an VirtualCardsFundingSourceChangedNotification")
        }

        XCTAssertEqual(actual, expected)
    }

    // MARK: - toSudoNotification: unknown

    func testTransformsUnknownNotification() {
        let expected = VirtualCardsUnknownNotification(type: "unknown")

        let input = VirtualCardsServiceNotification.unknown(expected.type)

        let actual = input.toSudoNotification()
        guard let actual = actual as? VirtualCardsUnknownNotification else {
            return XCTFail("Transformed notification is not an VirtualCardsUnknownNotification")
        }

        XCTAssertEqual(actual, expected)
    }
}
