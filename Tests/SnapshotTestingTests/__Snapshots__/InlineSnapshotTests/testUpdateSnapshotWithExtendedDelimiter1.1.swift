import XCTest
@testable import SnapshotTesting
extension InlineSnapshotsValidityTests {
  func testUpdateSnapshotWithExtendedDelimiter1() {
    _assertInlineSnapshot(matching: #"\""#, as: .lines, with: #"""
    \"
    """#)
  }
}