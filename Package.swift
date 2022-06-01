// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AnyErrorConvertible",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v9),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "AnyErrorConvertible",
            targets: ["AnyErrorConvertible"]),
        .library(
            name: "AnyErrorConvertibleAction",
            targets: ["AnyErrorConvertibleAction"])
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0")),
        .package(url: "https://github.com/RxSwiftCommunity/Action.git", .upToNextMajor(from: "4.0.0"))
    ],
    targets: [
        .target(
            name: "AnyErrorConvertible",
            dependencies: []),
        .target(
            name: "AnyErrorConvertibleAction",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "Action", package: "Action"),
                "AnyErrorConvertible"
            ]),
        .testTarget(
            name: "AnyErrorConvertibleTests",
            dependencies: [
                "AnyErrorConvertible"
            ]),
        .testTarget(
            name: "AnyErrorConvertibleActionTests",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxTest", package: "RxSwift"),
                "AnyErrorConvertibleAction"
            ])
    ]
)
