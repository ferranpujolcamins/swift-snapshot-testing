import XCTest
@testable import SnapshotTesting
extension InlineSnapshotsValidityTests {
  func testCreateSnapshotWithShorterExtendedDelimiter1() {
    _assertInlineSnapshot(matching: #"\""#, as: .lines, with: #"""
    \"
    """#)
  }
}