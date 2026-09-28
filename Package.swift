// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Mico",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .executable(name: "Mico", targets: ["Mico"])
    ],
    targets: [
        .executableTarget(
            name: "Mico",
            path: "Sources/Mico"
        )
    ]
)
