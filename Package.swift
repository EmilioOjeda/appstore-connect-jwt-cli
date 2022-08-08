// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "AppStoreConnectTokenCLI",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .executable(
            name: "appstore-connect-jwt",
            targets: ["AppStoreConnectTokenCLI"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/JohnSundell/Files.git",
            from: "4.2.0"),
        .package(
            url: "https://github.com/apple/swift-argument-parser.git",
            from: "1.1.3"),
        .package(
            url: "https://github.com/EmilioOjeda/appstore-connect-jwt.git",
            exact: "1.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "AppStoreConnectTokenCLI",
            dependencies: [
                .product(name: "Files", package: "Files"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "AppStoreConnectToken", package: "appstore-connect-jwt"),
            ]),
    ]
)
