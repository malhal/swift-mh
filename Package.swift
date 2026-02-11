// swift-tools-version: 5.9
// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "swift-mh",
    products: [
        .library(name: "MH", targets: ["MH"]),
    ],
    dependencies: [
        // This points to the folder created by the Git Submodule
        .package(path: "swift-mh-swiftui"),
        .package(path: "swift-mh-foundation")
        ],
    targets: [
        .target(
            name: "MH",
            dependencies: [
                .product(name: "MHSwiftUI", package: "swift-mh-swiftui"),
                .product(name: "MHFoundation", package: "swift-mh-foundation")
            ]
        )
    ]
)




