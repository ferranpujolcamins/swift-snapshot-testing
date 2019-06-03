@testable import SnapshotTesting
extension TestCase {
  func testUpdateSnapshotWithLongerExtendedDelimiter2() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: ##"""
    "#
    """##)
  }
}