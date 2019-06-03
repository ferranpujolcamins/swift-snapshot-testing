@testable import SnapshotTesting
extension TestCase {
  func testCreateSnapshotWithShorterExtendedDelimiter1() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: #"""
    \"
    """#)
  }
}
