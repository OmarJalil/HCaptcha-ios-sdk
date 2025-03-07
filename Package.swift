// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HCaptcha",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "HCaptcha",
            targets: ["HCaptcha"]
        ),
        .library(
            name: "HCaptcha_RxSwift",
            targets: ["HCaptcha_RxSwift"]
        )
    ],
    dependencies: [
        .package(url: "git@github.com:ReactiveX/RxSwift.git", .upToNextMajor(from: "5.0.0"))
    ],
    targets: [
        .target(
            name: "HCaptcha",
            path: "HCaptcha",
            exclude: ["Classes/Rx", "Example"],
            resources: [
                .process("Assets/hcaptcha.html")
            ]
        ),
        .target(
            name: "HCaptcha_RxSwift",
            dependencies: [
                "HCaptcha",
                .product(name: "RxSwift", package: "RxSwift"),
            ],
            path: "HCaptcha/Classes/Rx"
        )
    ]
)
