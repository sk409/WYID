// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WYID",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "WYID",
            targets: [
                "AppFeature",
                "DBClient",
                "DBClientLive",
                "DependencyHelpers",
                "Domain",
                "Entity",
                "GetGlobalStateClient",
                "GetGlobalStateClientLive",
                "GlobalStateView",
                "Helpers",
                "HomeFeature",
                "ResourcesClient",
                "ResourcesFeature",
                "SetGlobalStateClient",
                "SetGlobalStateClientLive",
                "TCAHelpers",
                "UserDefaultsClient",
                "UserDefaultsClientLive",
                "WidgetsFeature"
            ]
        ),
        .library(name: "AppFeature", targets: ["AppFeature"]),
        .library(name: "DBClient", targets: ["DBClient"]),
        .library(name: "DBClientLive", targets: ["DBClientLive"]),
        .library(name: "DependencyHelpers", targets: ["DependencyHelpers"]),
        .library(name: "Domain", targets: ["Domain"]),
        .library(name: "Entity", targets: ["Entity"]),
        .library(name: "GetGlobalStateClient", targets: ["GetGlobalStateClient"]),
        .library(name: "GetGlobalStateClientLive", targets: ["GetGlobalStateClientLive"]),
        .library(name: "GlobalStateView", targets: ["GlobalStateView"]),
        .library(name: "Helpers", targets: ["Helpers"]),
        .library(name: "HomeFeature", targets: ["HomeFeature"]),
        .library(name: "ResourcesClient", targets: ["ResourcesClient"]),
        .library(name: "ResourcesClientLive", targets: ["ResourcesClientLive"]),
        .library(name: "ResourcesFeature", targets: ["ResourcesFeature"]),
        .library(name: "SetGlobalStateClient", targets: ["SetGlobalStateClient"]),
        .library(name: "SetGlobalStateClientLive", targets: ["SetGlobalStateClientLive"]),
        .library(name: "TCAHelpers", targets: ["TCAHelpers"]),
        .library(name: "UserDefaultsClient", targets: ["UserDefaultsClient"]),
        .library(name: "UserDefaultsClientLive", targets: ["UserDefaultsClientLive"]),
        .library(name: "WidgetsFeature", targets: ["WidgetsFeature"])
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", branch: "prerelease/1.0"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", .upToNextMajor(from: .init(0, 2, 0))),
        .package(url: "https://github.com/pointfreeco/xctest-dynamic-overlay", .upToNextMajor(from: .init(0, 8, 4)))
    ],
    targets: [
        .target(
            name: "AppFeature",
            dependencies: [
                "Domain",
                "HomeFeature",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ],
            path: "Sources/Feature/App"
        ),
        .target(
            name: "DBClient",
            dependencies: [
                "Entity",
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "XCTestDynamicOverlay", package: "xctest-dynamic-overlay")
            ],
            path: "Sources/Client/DB"
        ),
        .target(
            name: "DBClientLive",
            dependencies: [
                "DBClient",
                "UserDefaultsClient"
            ],
            path: "Sources/ClientLive/DB"
        ),
        .target(
            name: "DependencyHelpers",
            dependencies: [
                .product(name: "Dependencies", package: "swift-dependencies"),
            ],
            path: "Sources/Component/DependencyHelpers"
        ),
        .target(
            name: "Domain",
            dependencies: [
                "Entity",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ],
            path: "Sources/Domain"
        ),
        .target(
            name: "Entity",
            path: "Sources/Component/Entity"
        ),
        .target(
            name: "GetGlobalStateClient",
            dependencies: [
                "DependencyHelpers",
                "Entity",
                "GlobalState",
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "XCTestDynamicOverlay", package: "xctest-dynamic-overlay")
            ],
            path: "Sources/Client/GetGlobalState"
        ),
        .target(
            name: "GetGlobalStateClientLive",
            dependencies: [
                "GetGlobalStateClient"
            ],
            path: "Sources/ClientLive/GetGlobalState"
        ),
        .target(
            name: "GlobalState",
            dependencies: [
                "Entity",
                .product(name: "Dependencies", package: "swift-dependencies"),
            ],
            path: "Sources/Component/GlobalState"
        ),
        .target(
            name: "GlobalStateView",
            dependencies: [
                "GetGlobalStateClient",
                "GlobalState"
            ],
            path: "Sources/Component/SwiftUI/View/GlobalStateView"
        ),
        .target(
            name: "Helpers",
            path: "Sources/Component/Helpers"
        ),
        .target(
            name: "HomeFeature",
            dependencies: [
                "Domain",
                "ResourcesFeature",
                "WidgetsFeature",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ],
            path: "Sources/Feature/Home"
        ),
        .target(
            name: "ResourcesClient",
            dependencies: [
                "DBClient",
                "Helpers",
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "XCTestDynamicOverlay", package: "xctest-dynamic-overlay")
            ],
            path: "Sources/Client/Resources"
        ),
        .target(
            name: "ResourcesClientLive",
            dependencies: [
                "ResourcesClient"
            ],
            path: "Sources/ClientLive/Resources"
        ),
        .target(
            name: "ResourcesFeature",
            dependencies: [
                "Domain",
                "GlobalStateView",
                "SetGlobalStateClient",
                "TCAHelpers",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ],
            path: "Sources/Feature/Resources"
        ),
        .target(
            name: "TCAHelpers",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ],
            path: "Sources/Component/TCAHelpers"
        ),
        .target(
            name: "SetGlobalStateClient",
            dependencies: [
                "Entity",
                "GlobalState",
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "XCTestDynamicOverlay", package: "xctest-dynamic-overlay")
            ],
            path: "Sources/Client/SetGlobalState"
        ),
        .target(
            name: "SetGlobalStateClientLive",
            dependencies: [
                "DBClient",
                "SetGlobalStateClient"
            ],
            path: "Sources/ClientLive/SetGlobalState"
        ),
        .target(
            name: "UserDefaultsClient",
            dependencies: [
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "XCTestDynamicOverlay", package: "xctest-dynamic-overlay")
            ],
            path: "Sources/Client/UserDefaults"
        ),
        .target(
            name: "UserDefaultsClientLive",
            dependencies: [
                "UserDefaultsClient"
            ],
            path: "Sources/ClientLive/UserDefaults"
        ),
        .target(
            name: "WidgetsFeature",
            dependencies: [
                "Domain",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ],
            path: "Sources/Feature/Widgets"
        )
    ]
)
