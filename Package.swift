// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Avtokod",
    products: [
        .library(
            name: "Avtokod",
            targets: ["Avtokod"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
    ],
    targets: [
        .target(
            name: "Avtokod",
            dependencies: ["Vapor"]),
        .testTarget(
            name: "AvtokodTests",
            dependencies: ["Avtokod"]),
    ]
)
