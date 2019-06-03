@testable import SnapshotTesting
extension TestCase {
  func testCreateSnapshotWithExtendedDelimiter2() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: ##"""
    "#
    """##)
  }
}