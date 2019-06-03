@testable import SnapshotTesting
extension TestCase {
  func testUpdateSnapshotCombained1() {
    _assertInlineSnapshot(matching: "value", as: .lines, with: ##"""
    ▿ User
      - bio: "Blobbed around the world."
      - id: 1
      - name: "Bl#\"\"#obby"
    """##)
  }
}
