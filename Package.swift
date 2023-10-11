// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppIconView",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppIconView",
            targets: ["AppIconView"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kevinhermawan/AppIcon.git", .upToNextMajor(from: "2.0.0"))
    ],
    targets: [
        .target(
            name: "AppIconView",
            dependencies: ["AppIcon"]
        ),
        .testTarget(
            name: "AppIconViewTests",
            dependencies: ["AppIconView", "AppIcon"]),
    ]
)
