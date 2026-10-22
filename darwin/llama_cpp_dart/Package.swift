// swift-tools-version: 5.9

import PackageDescription

// Keep this URL and checksum pinned to the same immutable release asset.
//
// This is necessarily updated *after* the tag it references: CI builds and
// uploads llama-xcframework.zip from the tag, and only then is its checksum
// known. Do not re-tag to pick this commit up — that would rebuild and replace
// the asset, changing the checksum and invalidating this pin again. The value
// that reaches consumers is the one in the published pub.dev package.
let package = Package(
    name: "llama_cpp_dart",
    platforms: [
        .iOS("14.0"),
        .macOS("12.0"),
    ],
    products: [
        .library(
            name: "llama-cpp-dart",
            targets: ["llama_cpp_dart"]
        ),
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
    ],
    targets: [
        .target(
            name: "llama_cpp_dart",
            dependencies: [
                .product(
                    name: "FlutterFramework",
                    package: "FlutterFramework"
                ),
                "llama",
            ]
        ),
        .binaryTarget(
            name: "llama",
            url: "https://github.com/PradyX/llama_cpp_dart/releases/download/llama-b11819/llama-xcframework.zip",
            checksum: "e64b155c792e8c4dcbed2f4e22740af7aae3ce4e3edfdaf9d6cd1925774ce15e"
        ),
    ]
)
