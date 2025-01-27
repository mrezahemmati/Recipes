// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Request",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Request",
            targets: ["Request"]
        ),
        .library(
            name: "HTTPRequest",
            targets: ["HTTPRequest"]
        ),
        .library(
            name: "BundleResourceRequest",
            targets: ["BundleResourceRequest"]
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Request"),
        .target(
            name: "HTTPRequest",
            dependencies: ["Request"]
        ),
        .target(
            name: "BundleResourceRequest",
            dependencies: ["Request"]
        ),
        .testTarget(
            name: "RequestTests",
            dependencies: ["Request"]
        ),
    ]
)
