@testable import SnapshotTesting
extension TestCase {
  func testUpdateSnapshotWithExtendedDelimiter1() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: #"""
    \"
    """#)
  }
}