@testable import SnapshotTesting
extension TestCase {
  func testCreateSnapshotWithLongerExtendedDelimiter2() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: ##"""
    "#
    """##)
  }
}
