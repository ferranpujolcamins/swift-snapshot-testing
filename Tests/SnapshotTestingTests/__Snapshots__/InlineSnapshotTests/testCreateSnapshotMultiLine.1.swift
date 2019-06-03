@testable import SnapshotTesting
extension TestCase {
  func testCreateSnapshotMultiLine() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: """
    NEW_SNAPSHOT
    """)
  }
}