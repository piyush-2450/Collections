// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Collections",
	platforms: [
		.iOS(.v12),
		.macOS(.v12)
	],
	products: [
		// Products define the executables and libraries a package produces, making them visible to other packages.
		.library(
			name: "Collections",
			targets: ["Collections"]
		),
	],
	dependencies: [
		.package(
			url: "https://github.com/realm/SwiftLint.git",
			branch: "main"
		)
	],
	targets: [
		// Targets are the basic building blocks of a package, defining a module or a test suite.
		// Targets can depend on other targets in this package and products from dependencies.
		.target(
			name: "Collections",
			dependencies: [],
			plugins: [
				.plugin(
					name: "SwiftLintBuildToolPlugin",
					package: "swiftlint"
				)
			]
		),
		.testTarget(
			name: "CollectionsTests",
			dependencies: ["Collections"],
			plugins: [
				.plugin(
					name: "SwiftLintBuildToolPlugin",
					package: "swiftlint"
				)
			]
		),
	]
)
