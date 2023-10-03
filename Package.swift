// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MuteMicrophonesOSD",
    platforms: [
        .macOS(.v11)
    ],
    dependencies: [
        .package(
            url: "https://github.com/sidevesh/BezelNotification.git",
            branch: "hudwindow-material"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "MuteMicrophonesOSD",
            dependencies: ["BezelNotification"],
            resources: [
                .copy("Assets/mic.fill.png"),
                .copy("Assets/mic.slash.fill.png")
            ]
        )
    ]
)
