import XCTest
@testable import SnapshotTesting
extension InlineSnapshotsValidityTests {
  func testUpdateSnapshot() {
    _assertInlineSnapshot(matching: "NEW_SNAPSHOT", as: .lines, with: """
    NEW_SNAPSHOT
    """)
  }
}