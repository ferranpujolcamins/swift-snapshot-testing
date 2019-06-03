@testable import SnapshotTesting
extension TestCase {
  func testCreateSnapshotSingleLine() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: """
    NEW_SNAPSHOT
    """)
  }
}