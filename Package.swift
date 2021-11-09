// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Storable",
    platforms: [
        .macOS(.v12),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        .library(
            name: "Storable",
            type: .dynamic,
            targets: ["Storable"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/sergejs/encryptable.git", from: "0.0.2"),
    ],
    targets: [
        .target(
            name: "Storable",
            dependencies: [
                .product(name: "Encryptable", package: "Encryptable"),
            ]
        ),
        .testTarget(
            name: "StorableTests",
            dependencies: ["Storable"]
        ),
    ]
)
