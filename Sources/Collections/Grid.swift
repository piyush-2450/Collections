//
//  Grid.swift
//  Collections
//
//  Created by Piyush Banerjee on 06-Mar-2022.
//  Copyright © 2022 Piyush Banerjee. All rights reserved.
//

import Foundation

open class Grid<T> {
	// MARK: Internal scope

	var nodes: [LinearIndex: T] = [:]

	func linearIndex(_ indices: [LinearIndex]) -> LinearIndex {
		guard indices.count == dimensions.count else {
			fatalError("Number of indices must match the number of dimensions.")
		}

		// swiftlint:disable explicit_type_interface
		return zip(indices, dimensions)
			.reduce(0) { result, pair in
				let (index, size) = pair
				guard index >= 0,
						index < size else {
					fatalError("Index \(index) is out of bounds for dimension size \(size).")
				}
				return result * size + index
			}
		// swiftlint:enable explicit_type_interface
	}

	func gridIndex(_ linearIndex: LinearIndex) -> GridIndex {
		var linearIndex: LinearIndex = linearIndex
		var result: GridIndex = []

		for size in dimensions.reversed() {
			result.insert(linearIndex % size, at: 0)
			linearIndex /= size
		}

		return result
	}

	deinit {
		//
	}

	// MARK: Public scope

	public typealias LinearIndex = Int
	public typealias GridIndex = [LinearIndex]

	public let dimensions: GridIndex

	public func linearIndex(_ indices: LinearIndex...) -> LinearIndex {
		linearIndex(indices)
	}

	public func linearToGridIndex(_ index: LinearIndex) -> GridIndex {
		gridIndex(index)
	}

	public init(_ dimensions: LinearIndex...) {
		guard dimensions.isEmpty == false,
			  dimensions
			.allSatisfy({ $0 > 0 }) else {
			fatalError("Dimensions must be non-empty and all values must be greater than zero.")
		}
		self.dimensions = dimensions
	}

	open subscript(indices: [LinearIndex]) -> T? {
		get {
			nodes[linearIndex(indices)]
		}
		set {
			nodes[linearIndex(indices)] = newValue
		}
	}

	@inlinable
	open subscript(indices: LinearIndex...) -> T? {
		get {
			self[indices]
		}
		set {
			self[indices] = newValue
		}
	}

	open func forEach(_ body: (GridIndex, T?) -> Void) {
		for linearIndex in nodes.keys.sorted() {
			body(
				gridIndex(linearIndex),
				nodes[linearIndex]
			)
		}
	}
}
