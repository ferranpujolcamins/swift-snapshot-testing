import XCTest
@testable import SnapshotTesting
extension InlineSnapshotsValidityTests {
  func testCreateSnapshotSingleLine() {
    _assertInlineSnapshot(matching: "NEW_SNAPSHOT", as: .lines, with: """
    NEW_SNAPSHOT
    """)
  }
}