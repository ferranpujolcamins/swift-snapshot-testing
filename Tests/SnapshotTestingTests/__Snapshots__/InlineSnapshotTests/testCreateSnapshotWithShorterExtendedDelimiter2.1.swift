@testable import SnapshotTesting
extension TestCase {
  func testCreateSnapshotWithShorterExtendedDelimiter2() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: ##"""
    "#
    """##)
  }
}
