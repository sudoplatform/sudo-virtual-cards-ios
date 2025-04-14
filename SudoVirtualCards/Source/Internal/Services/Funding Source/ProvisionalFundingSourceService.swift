//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoApiClient
import SudoLogging
import SudoUser

class ProvisionalFundingSourceService {

    // MARK: - Properties

    /// Used to make GraphQL requests to AWS. Injected into operations to delegate the calls.
    let graphQLClient: SudoApiClient

    /// Logs errors and diagnostic information.
    private let logger: Logger

    // MARK: - Lifecycle

    init(
        graphQLClient: SudoApiClient,
        logger: Logger = Logger.virtualCardsSDKLogger
    ) {
        self.graphQLClient = graphQLClient
        self.logger = logger
    }

    /// List provisional funding sources
    ///
    /// - Parameters:
    ///   - filter: The filter to be applied to the list of provisional funding sources to return.
    ///   - limit: Number of funding sources to return. If `nil`, the limit is 10.
    ///   - nextToken: Generated token by previous calls to `getProvisionalFundingSources`. This is used for pagination.
    ///                This value should be pre-generated from a previous pagination call, otherwise it will throw an error.
    ///                It is important to note that the same structured API call should be used if using a previously
    ///                generated `nextToken`.
    /// - Returns: `ProvisionalFundingSource`s associated with `filter`, or empty array if no provisional funding sources can be found.
    public func listProvisionalFundingSources(
        withFilter filter: ProvisionalFundingSourceFilterInput?,
        sortOrder: SortOrderInput?,
        limit: Int?,
        nextToken: String?
    ) async throws -> ListOutput<ProvisionalFundingSource> {
        let query = GraphQL.ListProvisionalFundingSourcesQuery(
            filter: filter?.toGraphQL(),
            sortOrder: sortOrder?.toGraphQL(),
            limit: limit,
            nextToken: nextToken
        )
        let data: GraphQL.ListProvisionalFundingSourcesQuery.Data
        do {
            data = try await graphQLClient.fetch(query: query)
        } catch {
            throw SudoVirtualCardsError.fromApiOperationError(error: error)
        }
        let listProvisionalFundingSources = data.listProvisionalFundingSources
        let provisionalFundingSources: [ProvisionalFundingSource] =
        try listProvisionalFundingSources.items.map {
            ProvisionalFundingSource(
                id: $0.id,
                owner: $0.owner,
                version: $0.version,
                state: ProvisionalFundingSourceState($0.getProvisionalFundingSourceState()),
                type: FundingSourceType($0.getFundingSourceType()),
                last4: $0.last4 ?? "",
                createdAt: Date(millisecondsSince1970: $0.createdAtEpochMs),
                updatedAt: Date(millisecondsSince1970: $0.updatedAtEpochMs),
                provisioningData: try ProvisioningData(
                    encodedProvisioningData: $0.provisioningData
                )
            )
        }

        let nextToken = listProvisionalFundingSources.nextToken
        return ListOutput(items: provisionalFundingSources, nextToken: nextToken)
    }

    /// Cancel a provisional funding source.
    ///
    /// - Parameters:
    ///   - id: identifier of the provisional funding source.
    /// - Returns: Cancelled provisional funding source.
    ///
    public func cancelProvisionalFundingSource(withId id: String) async throws -> ProvisionalFundingSource {
        let mutationInput = GraphQL.IdInput(id: id)
        let mutation = GraphQL.CancelProvisionalFundingSourceMutation(input: mutationInput)
        let data: GraphQL.CancelProvisionalFundingSourceMutation.Data
        do {
            data = try await graphQLClient.perform(mutation: mutation)
        } catch {
            throw SudoVirtualCardsError.fromApiOperationError(error: error)
        }
        let provisionalFundingSource = data.cancelProvisionalFundingSource
        return ProvisionalFundingSource(
            id: provisionalFundingSource.id,
            owner: provisionalFundingSource.owner,
            version: provisionalFundingSource.version,
            state: ProvisionalFundingSourceState(provisionalFundingSource.getProvisionalFundingSourceState()),
            type: FundingSourceType(provisionalFundingSource.getFundingSourceType()),
            last4: provisionalFundingSource.last4 ?? "",
            createdAt: Date(millisecondsSince1970: provisionalFundingSource.createdAtEpochMs),
            updatedAt: Date(millisecondsSince1970: provisionalFundingSource.updatedAtEpochMs),
            provisioningData: try ProvisioningData(
                encodedProvisioningData: provisionalFundingSource.provisioningData
            )
        )
    }
}
