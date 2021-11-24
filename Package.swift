// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Storable",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "Storable",
            type: .dynamic,
            targets: ["Storable"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/sergejs/Encryptable.git", .branch("main")),
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
