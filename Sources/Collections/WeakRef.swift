//
//  LinkedList.swift
//  Collections
//
//  Created by Piyush Banerjee on 06-Mar-2022.
//  Copyright © 2022 Piyush Banerjee. All rights reserved.
//

import Foundation

public final class WeakRef<T: AnyObject> {
	// MARK: + Internal scope

	deinit {
		//
	}

	// MARK: + Public scope

	public weak var value: T?

	public init(_ value: T? = nil) {
		self.value = value
	}
}
