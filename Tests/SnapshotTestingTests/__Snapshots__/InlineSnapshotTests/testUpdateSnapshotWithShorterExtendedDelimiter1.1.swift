import XCTest
@testable import SnapshotTesting
extension InlineSnapshotsValidityTests {
  func testUpdateSnapshotWithShorterExtendedDelimiter1() {
    _assertInlineSnapshot(matching: #"\""#, as: .lines, with: #"""
    \"
    """#)
  }
}