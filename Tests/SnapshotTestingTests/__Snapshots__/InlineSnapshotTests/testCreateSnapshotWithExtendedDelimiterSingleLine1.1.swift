@testable import SnapshotTesting
extension TestCase {
  func testCreateSnapshotWithExtendedDelimiterSingleLine1() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: #"""
    \"
    """#)
  }
}
