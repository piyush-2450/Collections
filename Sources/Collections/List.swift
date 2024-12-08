//
//  List.swift
//  Collections
//
//  Created by Piyush Banerjee on 06-Mar-2022.
//  Copyright © 2022 Piyush Banerjee. All rights reserved.
//

import Foundation

open class List<T> {
	// MARK: Internal scope

	var nodes: [Index: T] = [:]

	func index(
		row: Index,
		column: Index
	) -> Index {
		row * columns + column
	}

	func listIndex(_ index: Index) -> ListIndex {
		(
			row: index / columns,
			column: index % columns
		)
	}

	deinit {
		//
	}

	// MARK: Public scope

	public typealias Index = Int
	public typealias ListIndex = (
		row: Index,
		column: Index
	)

	public let rows: Index
	public let columns: Index

	public init(
		rows: Index,
		columns: Index
	) {
		self.rows = rows
		self.columns = columns
	}

	open subscript(
		row: Index,
		column: Index
	) -> T? {
		get {
			nodes[
				index(
					row: row,
					column: column
				)
			]
		}
		set {
			nodes[
				index(
					row: row,
					column: column
				)
			] = newValue
		}
	}

	open func forEach(_ body: (Index, Index, T?) -> Void) {
		for index in nodes.keys.sorted() {
			let listIndex: ListIndex = listIndex(index)
			body(
				listIndex.row,
				listIndex.column,
				nodes[index]
			)
		}
	}
}
