@testable import SnapshotTesting
extension TestCase {
  func testUpdateSnapshotWithExtendedDelimiter2() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: ##"""
    "#
    """##)
  }
}