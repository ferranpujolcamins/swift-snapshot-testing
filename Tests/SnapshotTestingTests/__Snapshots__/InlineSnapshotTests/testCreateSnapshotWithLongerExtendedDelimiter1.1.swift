import XCTest
@testable import SnapshotTesting
extension InlineSnapshotsValidityTests {
  func testCreateSnapshotWithLongerExtendedDelimiter1() {
    _assertInlineSnapshot(matching: #"\""#, as: .lines, with: #"""
    \"
    """#)
  }
}