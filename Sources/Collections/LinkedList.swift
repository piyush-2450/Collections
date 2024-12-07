//
//  LinkedList.swift
//  Collections
//
//  Created by Piyush Banerjee on 06-Mar-2022.
//  Copyright © 2022 Piyush Banerjee. All rights reserved.
//

import Foundation

public final class LinkedList<T> {
	// MARK: + Internal scope

	var indexNodeMap: [Index: WeakRef<Node>] = [:]

	// MARK: + Public scope

	public typealias Index = UInt

	public final class Node {
		// MARK: ++ Internal scope

		var next: Node?
		weak var previous: Node?

		// MARK: ++ Public scope

		public var value: T
		public fileprivate(set) var index: Index?

		public init(_ value: T) {
			self.value = value
		}
	}

	public private(set) var head: Node?
	public private(set) var tail: Node?
	public private(set) var count: Index = 0

	public init() {
		//
	}

	@discardableResult
	public func append(_ value: T) -> Node {
		defer {
			count += 1
		}

		let newNode = Node(value)
		let newIndex = count + 1

		indexNodeMap[newIndex] = .init(newNode)

		if let tailNode = tail {
			tailNode.next = newNode
			newNode.previous = tailNode
		} else {
			head = newNode
		}
		tail = newNode

		return newNode
	}

	public func remove(_ node: Node) {
		defer {
			count -= 1
		}

		let prev = node.previous
		let next = node.next

		if let prev = prev {
			prev.next = next
		} else {
			head = next
		}

		if let next = next {
			next.previous = prev
		} else {
			tail = prev
		}

		node.previous = nil
		node.next = nil

		if let index = node.index {
			node.index = nil
			indexNodeMap[index] = nil
		}
	}

	public func forEach(_ body: (T) -> Void) {
		var currentNode = head
		while let node = currentNode {
			body(node.value)
			currentNode = node.next
		}
	}

	public subscript(index: Index) -> Node? {
		get {
			indexNodeMap[index]?.value
		}
	}
}
