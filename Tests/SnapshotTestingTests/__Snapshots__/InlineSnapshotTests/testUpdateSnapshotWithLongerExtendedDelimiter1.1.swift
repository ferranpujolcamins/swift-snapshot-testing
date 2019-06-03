@testable import SnapshotTesting
extension TestCase {
  func testUpdateSnapshotWithLongerExtendedDelimiter1() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: #"""
    \"
    """#)
  }
}