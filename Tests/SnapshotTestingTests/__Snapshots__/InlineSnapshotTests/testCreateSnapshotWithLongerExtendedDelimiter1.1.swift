@testable import SnapshotTesting
extension TestCase {
  func testCreateSnapshotWithLongerExtendedDelimiter1() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: #"""
    \"
    """#)
  }
}
