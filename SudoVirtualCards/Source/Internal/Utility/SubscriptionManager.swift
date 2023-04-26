//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Utility class for mananging subscription in the SDK to the service.
protocol SubscriptionManager: AnyObject {

    /// Add a subscription to the manager.
    func addSubscription(_ subscription: VirtualCardsSubscriptionToken)

    /// Remove a subscription which matches `id`.
    func removeSubscription(withId id: String)

    /// Remove all subscriptions from the manager.
    func removeAllSubscriptions()
}

/// Weak instance of an `VirtualCardsSubscriptionToken`.
class WeakVirtualCardsSubscriptionToken: Hashable {

    // MARK: - Properties

    /// Internal weak reference to the token.
    weak var value: VirtualCardsSubscriptionToken?

    /// Reference identifier.
    let id: String

    // MARK: - Lifecycle

    /// Initialize a Weak `VirtualCardsSubscriptionToken`.
    init(_ value: VirtualCardsSubscriptionToken) {
        self.id = value.id
        self.value = value
    }

    // MARK: - Methods

    /// If possible, cancels the internal weak reference. If the reference has already been lost, nothing will happen.
    func cancel() {
        value?.cancel()
    }

    // MARK: - Conformance: Equatable

    static func == (lhs: WeakVirtualCardsSubscriptionToken, rhs: WeakVirtualCardsSubscriptionToken) -> Bool {
        return lhs.value == rhs.value
    }

    // MARK: - Conformance: Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}

/// Concrete implementation of the `SubscriptionManager`.
class DefaultSubscriptionManager: SubscriptionManager {

    // MARK: - Properties

    /// Queue to handle the mutation of `subscriptions` to avoid race conditions.
    let subscriptionQueue = DispatchQueue(label: "com.sudoplatform.DefaultSubscriptionManager")

    /// Set of unique subscriptions that are managed by this class.
    private(set) var subscriptions = Set<WeakVirtualCardsSubscriptionToken>()

    // MARK: - SubscriptionManager

    func addSubscription(_ subscription: VirtualCardsSubscriptionToken) {
        let weakSubscription = WeakVirtualCardsSubscriptionToken(subscription)
        subscriptionQueue.sync {
            _ = subscriptions.insert(weakSubscription)
        }
    }

    func removeSubscription(withId id: String) {
        subscriptionQueue.sync {
            guard let index = subscriptions.firstIndex(where: { $0.id == id }) else {
                return
            }
            let subscription = subscriptions.remove(at: index)
            subscription.cancel()
        }
    }

    func removeAllSubscriptions() {
        subscriptionQueue.sync {
            subscriptions.removeAll()
        }
    }
}
