import XCTest
@testable import SnapshotTesting
extension InlineSnapshotsValidityTests {
  func testCreateSnapshotWithTrailingBackslash() {
    _assertInlineSnapshot(matching: #"\"#, as: .lines, with: #"""
    \
    """#)
  }
}
