@testable import SnapshotTesting
extension TestCase {
  func testUpdateSnapshot() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: """
    NEW_SNAPSHOT
    """)
  }
}