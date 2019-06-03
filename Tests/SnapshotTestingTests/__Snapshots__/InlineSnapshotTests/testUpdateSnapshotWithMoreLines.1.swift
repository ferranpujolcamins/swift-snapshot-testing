@testable import SnapshotTesting
extension TestCase {
  func testUpdateSnapshotWithMoreLines() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: """
    NEW_SNAPSHOT
    NEW_SNAPSHOT
    """)
  }
}