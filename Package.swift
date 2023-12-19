// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Yang",
    platforms: [ .iOS(.v12) ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Yang",
            targets: ["Yang"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Yang",
            path: "Sources",
            linkerSettings: [
                .linkedFramework("UIKit")
            ]
        ),
        .testTarget(
            name: "YangTests",
            dependencies: ["Yang"], 
            path: "Tests"
        ),
    ],
    swiftLanguageVersions: [ .v5 ]
)
