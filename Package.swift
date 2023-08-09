// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OAT",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "OAT",
            targets: ["OAT"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "OAT",
            dependencies: []),
        .testTarget(
            name: "OATTests",
            dependencies: ["OAT"]),
    ]
)
