// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "WikiTranslate",
    products: [
        .library(name: "WikiTranslate", targets: ["WikiTranslateCore"]),
        .executable(name: "wt", targets: ["wt"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kiliankoe/CLISpinner", .upToNextMajor(from: "0.3.6")),
        .package(url: "https://github.com/IBM-Swift/BlueSignals", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/Raureif/WikipediaKit", .revision("v1.0.0-beta.5")),
    ],
    targets: [
        .target(
            name: "WikiTranslateCore",
            dependencies: ["WikipediaKit"]),
        .target(
            name: "wt",
            dependencies: ["WikiTranslateCore", "CLISpinner", "Signals"])
    ]
)
