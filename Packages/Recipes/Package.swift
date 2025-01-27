// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Recipes",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "RecipesCore",
            targets: ["RecipesCore"]
        ),
        .library(
            name: "RecipesDataModels",
            targets: ["RecipesDataModels"]
        ),
        .library(
            name: "RecipesUI",
            targets: ["RecipesUI"]
        )
    ],
    dependencies: [
        .package(path: "./AsyncDataModel"),
        .package(path: "./Request")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "RecipesCore"
        ),
        .target(
            name: "RecipesDataModels",
            dependencies: [
                "RecipesCore",
                .product(name: "RequestDataModel", package: "AsyncDataModel"),
                .product(name: "HTTPRequest", package: "Request"),
                .product(name: "FileSystemRequest", package: "Request")
            ]
        ),
        .target(
            name: "RecipesUI",
            dependencies: ["RecipesDataModels"],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "RecipesCoreTests",
            dependencies: ["RecipesCore"],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "RecipesUITests",
            dependencies: ["RecipesUI"]
        ),
    ]
)
