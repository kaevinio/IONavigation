// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IONavigation",
    platforms: [
        .iOS(.v16),
        .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "IONavigation",
            targets: ["IONavigation"]),
    ],
    targets: [
        .target(
            name: "IONavigation",
            dependencies: [])
    ]
)
