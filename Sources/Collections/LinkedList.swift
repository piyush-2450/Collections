//
//  LinkedList.swift
//  Collections
//
//  Created by Piyush Banerjee on 06-Mar-2022.
//  Copyright © 2022 Piyush Banerjee. All rights reserved.
//

import Foundation

public final class LinkedList<T> {
	public final class Node {
		var value: T
		var next: Node?
		weak var previous: Node?

		init(_ value: T) {
			self.value = value
		}
	}

	private(set) var head: Node?
	private(set) var tail: Node?

	@discardableResult
	public func append(_ value: T) -> Node {
		let newNode = Node(value)
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
	}

	public func forEach(_ body: (T) -> Void) {
		var currentNode = head
		while let node = currentNode {
			body(node.value)
			currentNode = node.next
		}
	}
}
