@testable import SnapshotTesting
extension TestCase {
  func testCreateSnapshotWithExtendedDelimiter1() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: #"""
    \"
    """#)
  }
}