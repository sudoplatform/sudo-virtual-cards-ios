// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SudoVirtualCards",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "SudoVirtualCards",
            targets: ["SudoVirtualCards"]),
        .library(
            name: "SudoVirtualCardsNotificationExtension",
            targets: ["SudoVirtualCardsNotificationExtension"]),
    ],
    dependencies: [
        .package(url: "https://github.com/sudoplatform/sudo-api-client-ios", from: "13.0.0"),
        .package(url: "https://github.com/sudoplatform/sudo-config-manager-ios", from: "5.0.0"),
        .package(url: "https://github.com/sudoplatform/sudo-key-manager-ios", from: "4.0.0"),
        .package(url: "https://github.com/sudoplatform/sudo-logging-ios", from: "2.0.0"),
        .package(url: "https://github.com/sudoplatform/sudo-notification-ios", from: "5.0.1"),
        .package(url: "https://github.com/sudoplatform/sudo-user-ios", from: "18.3.0"),
        .package(url: "https://github.com/aws-amplify/amplify-swift", from: "2.49.1"),
    ],
    targets: [
        .target(
            name: "SudoVirtualCardsCommon",
            dependencies: [
                .product(name: "Amplify", package: "amplify-swift"),
                .product(name: "AWSAPIPlugin", package: "amplify-swift"),
                .product(name: "AWSCognitoAuthPlugin", package: "amplify-swift"),
                .product(name: "AWSPluginsCore", package: "amplify-swift"),
                .product(name: "SudoApiClient", package: "sudo-api-client-ios"),
                .product(name: "SudoConfigManager", package: "sudo-config-manager-ios"),
                .product(name: "SudoLogging", package: "sudo-logging-ios"),
                .product(name: "SudoKeyManager", package: "sudo-key-manager-ios"),
                .product(name: "SudoNotification", package: "sudo-notification-ios"),
                .product(name: "SudoUser", package: "sudo-user-ios"),
            ],
            path: "SudoVirtualCardsCommon/"),
        .target(
            name: "SudoVirtualCards",
            dependencies: [
                .product(name: "Amplify", package: "amplify-swift"),
                .product(name: "AWSAPIPlugin", package: "amplify-swift"),
                .product(name: "AWSCognitoAuthPlugin", package: "amplify-swift"),
                .product(name: "AWSPluginsCore", package: "amplify-swift"),
                .product(name: "SudoApiClient", package: "sudo-api-client-ios"),
                .product(name: "SudoConfigManager", package: "sudo-config-manager-ios"),
                .product(name: "SudoLogging", package: "sudo-logging-ios"),
                .product(name: "SudoKeyManager", package: "sudo-key-manager-ios"),
                .product(name: "SudoNotification", package: "sudo-notification-ios"),
                .target(name: "SudoVirtualCardsCommon"),
            ],
            path: "SudoVirtualCards/"),
        .target(
            name: "SudoVirtualCardsNotificationExtension",
            dependencies: [
                .product(name: "SudoLogging", package: "sudo-logging-ios"),
                .product(name: "SudoNotificationExtension", package: "sudo-notification-ios"),
                .target(name: "SudoVirtualCardsCommon"),
            ],
            path: "SudoVirtualCardsNotificationExtension/"),
    ]
)

