@testable import Collections
import Foundation
import Testing

// swiftlint:disable no_magic_numbers
@Test
internal func test0001() async throws {
	let list: List<String> = .init(
		rows: 20,
		columns: 30
	)

	list[15, 16] = "15_16"

	#expect(list[15, 16] == "15_16")
	#expect(list[16, 15] == nil)

	var items: [String] = []
	list.forEach { _, _, item in
		if let item {
			items.append(item)
		}
	}

	#expect(items.count == 1)
}
// swiftlint:enable no_magic_numbers
