@testable import SnapshotTesting
extension TestCase {
  func testUpdateSnapshotWithShorterExtendedDelimiter1() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: #"""
    \"
    """#)
  }
}