import XCTest
@testable import SnapshotTesting
extension InlineSnapshotsValidityTests {
  func testCreateSnapshotWithExtendedDelimiter1() {
    _assertInlineSnapshot(matching: #"\""#, as: .lines, with: #"""
    \"
    """#)
  }
}
