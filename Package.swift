// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "SwiftMacros",
    platforms: [
        .iOS("13.0"),
        .macOS("10.15")
    ],
    products: [
        .library(name: "SwiftMacros", targets: ["SwiftMacros"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", branch: "main"),
    ],
    targets: [
        .macro(name: "SwiftMacrosPlugin",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftOperators", package: "swift-syntax"),
                .product(name: "SwiftParser", package: "swift-syntax"),
                .product(name: "SwiftParserDiagnostics", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
               ],
               path: "SwiftMacrosPlugin"
            ),
        .target(name: "SwiftMacros",
            dependencies: ["SwiftMacrosPlugin"],
            path: "SwiftMacros"
        ),
        .testTarget(name: "SwiftMacrosTest",
            dependencies: [
                "SwiftMacrosPlugin",
            ],
            path: "SwiftMacrosTest"
        )
    ]
)

