// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "blinkid_flutter",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(name: "blinkid-flutter", targets: ["blinkid_flutter"])
    ],
    dependencies: [
       // .package(url: "https://github.com/BlinkID/blinkid-ios.git", exact: .init(7,7,0)),
    ],
    targets: [
        .target(
            name: "blinkid_flutter",
            dependencies: [
                "BlinkIDUX",
                "BlinkID"
            ],
            resources: []
        ),
        .binaryTarget(
            name: "BlinkIDUX",
            path: "./Frameworks/BlinkIDUX.xcframework"),
        .binaryTarget(
            name: "BlinkID",
            path: "./Frameworks/BlinkID.xcframework")
    ]
)
