@testable import SnapshotTesting
extension TestCase {
  func testCreateSnapshotWithExtendedDelimiterSingleLine2() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: ##"""
    "#
    """##)
  }
}
