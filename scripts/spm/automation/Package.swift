// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Automation",
    platforms: [
        .macOS(.v10_15),
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/files.git", from: "4.0.2"),
        .package(url: "https://github.com/apple/swift-syntax.git", from: "510.0.2"),
    ],
    targets: [
        .executableTarget(
            name: "Automations",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftParser", package: "swift-syntax"),
                .product(name: "Files", package: "files"),
            ],
            path: "Sources"
        )
    ]
)
