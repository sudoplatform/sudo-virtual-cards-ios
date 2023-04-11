//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
///
/// Representation of text of an authorization to be presented to and agreed to by the user when
/// adding a bank account funding source. The AuthorizationText presented must be submitted as
/// part of the completion data to complete a bank account funding source, or as part of the refresh
/// data to refresh a bank account funding source.
public struct AuthorizationText: Decodable, Hashable {
    // MARK: - Properties

    /// RFC5646 language tag in which the text is written
    public let language: String
    /// The text of the authorization
    public let content: String
    /// The content type used for determining how to display the content (e.g. text/html, text/plain)
    public let contentType: String
    /// A hash of the content
    public let hash: String
    /// Algorithm used to generate hash of the content. Only 'SHA-256' is currently used.
    public let hashAlgorithm: String

    // MARK: - Lifecycle

    ///
    /// Construct an AuthorizationText:
    ///
    /// - Parameters:
    ///   - language: RFC5646 language tag in which the text is written
    ///   - content: The text of the authorization
    ///   - contenType: The content type used for determining how to display the content (e.g. text/html, text/plain)
    ///   - hash: A hash of the content
    ///   - hashAlgorithm: Algorithm used to generate hash of the content. Only 'SHA-256' is currently used.
    public init(language: String, content: String, contentType: String, hash: String, hashAlgorithm: String) {
        self.language = language
        self.content = content
        self.contentType = contentType
        self.hash = hash
        self.hashAlgorithm = hashAlgorithm
    }
}
