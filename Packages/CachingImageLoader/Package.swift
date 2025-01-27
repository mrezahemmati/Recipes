// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CachingImageLoader",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CachingImageLoader",
            targets: ["CachingImageLoader"]
        ),
    ],
    dependencies: [
        .package(path: "./Cache"),
        .package(path: "./RemoteImage")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CachingImageLoader",
            dependencies: [
                .product(name: "Cache", package: "Cache"),
                .product(name: "ImageLoader", package: "RemoteImage"),
            ]
        ),
        .testTarget(
            name: "CachingImageLoaderTests",
            dependencies: ["CachingImageLoader"]
        ),
    ]
)
