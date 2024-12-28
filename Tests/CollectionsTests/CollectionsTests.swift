@testable import Collections
import Foundation
import Testing

// swiftlint:disable no_magic_numbers
@Test
internal func test0001() async throws {
	let grid: Grid<String> = .init(20, 30)

	grid[15, 16] = "15_16"

	#expect(grid[15, 16] == "15_16")
	#expect(grid[16, 15] == nil)

	var items: [String] = []
	grid.forEach { _, item in
		if let item {
			items.append(item)
		}
	}

	#expect(items.count == 1)
}
// swiftlint:enable no_magic_numbers
