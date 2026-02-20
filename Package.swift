// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "swift-mh",
    platforms: [
        .iOS(.v17),   // Sets minimum to iOS 17 (recommended for 2026)
        .macOS(.v14)  // Sets minimum to macOS Sonoma
    ],
    products: [
        .library(name: "MH", targets: ["MH"]),
        .library(name: "MHFoundation", targets: ["MHFoundation"]),
        .library(name: "MHSwiftUI", targets: ["MHSwiftUI"]),
        .library(name: "MHSwiftData", targets: ["MHSwiftData"]),
        .library(name: "MHCoreData", targets: ["MHCoreData"]),
    ],
    //dependencies: [
        // This points to the folder created by the Git Submodule
    //    .package(path: "swift-mh-swiftui")
    //    ],
    targets: [
        .target(
            name: "MH",
            dependencies: ["MHSwiftUI", "MHFoundation", "MHSwiftData", "MHCoreData"]
        ),
        .target(
            name: "MHFoundation"
        ),
        .target(
            name: "MHSwiftData"
        ),
        .target(
            name: "MHCoreData"
        ),
        .target(
            name: "MHSwiftUI",
            dependencies: ["MHFoundation"]
        )
    ]
)




