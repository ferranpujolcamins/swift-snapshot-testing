@testable import SnapshotTesting
extension TestCase {
  func testUpdateSnapshotWithShorterExtendedDelimiter2() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: ##"""
    "#
    """##)
  }
}