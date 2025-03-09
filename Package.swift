// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WireGuardKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "WireGuardKit", targets: ["WireGuardKit"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WireGuardKit",
            dependencies: ["WireGuardKitGo", "WireGuardKitC"]
        ),
        .target(
            name: "WireGuardKitC",
            dependencies: [],
            publicHeadersPath: "."
        ),
        .target(
            name: "WireGuardKitGo",
            dependencies: ["WireGuardKitGoBinary"],
            exclude: [
                "goruntime-boottime-over-monotonic.diff",
                "go.mod",
                "go.sum",
                "api-apple.go",
                "Makefile",
                "build_binary.sh"
            ],
            publicHeadersPath: "."
        ),
        .binaryTarget(
            name: "WireGuardKitGoBinary",
            url: "",
            checksum: "4f5111862263d278c55fab8a75f2b7a04c5bcc3cbea674ca1c11c14d2ea3a654"
        )
    ]
)
