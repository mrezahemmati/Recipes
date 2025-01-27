// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Cache",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Cache",
            targets: ["Cache"]
        ),
        .library(
            name: "LocalDiskCache",
            targets: ["LocalDiskCache"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Cache"
        ),
        .target(
            name: "LocalDiskCache",
            dependencies: ["Cache"]
        ),
        .testTarget(
            name: "CacheTests",
            dependencies: ["Cache"]
        ),
    ]
)
