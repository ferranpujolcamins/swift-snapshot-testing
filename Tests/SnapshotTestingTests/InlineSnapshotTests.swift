import XCTest
@testable import SnapshotTesting

class InlineSnapshotTests: XCTestCase {

  func testCreateSnapshotSingleLine() {
    let source = #"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: "")
    """#

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: "NEW_SNAPSHOT", fileName: "filename", lineIndex: 1)
    ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testCreateSnapshotMultiLine() {
    let source = #"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: """
    """)
    """#

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: "NEW_SNAPSHOT", fileName: "filename", lineIndex: 1)
    ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testUpdateSnapshot() {
    let source = #"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: """
    OLD_SNAPSHOT
    """)
    """#

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: "NEW_SNAPSHOT", fileName: "filename", lineIndex: 1)
    ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testUpdateSnapshotWithMoreLines() {
    let source = #"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: """
    OLD_SNAPSHOT
    """)
    """#

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: "NEW_SNAPSHOT\nNEW_SNAPSHOT", fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

//  func testUpdateSnapshotWithLessLines() {
//    let source = #"""
//    _assertInlineSnapshot(matching: post, as: .lines), with: """
//    OLD_SNAPSHOT
//    OLD_SNAPSHOT
//    """)
//    """#
//
//    var recordings: Recordings = [:]
//    let newSource = writeInlineSnapshot(
//      &recordings,
//      Context(sourceCode: source, diffable: "NEW_SNAPSHOT", fileName: "filename", lineIndex: 1)
//      ).sourceCode
//
//    assertSnapshot(source: newSource)
//  }

  func testCreateSnapshotWithExtendedDelimiterSingleLine1() {
    let source = ##"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: "")
    """##

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: #"\""#, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testCreateSnapshotWithExtendedDelimiterSingleLine2() {
    let source = ##"""
    func test() {
      _assertInlineSnapshot(matching: "value", as: .lines, with: "")
    }
    """##

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: ##""#"##, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testCreateSnapshotWithExtendedDelimiter1() {
    let source = ##"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: #"""
    """#)
    """##

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: #"\""#, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testCreateSnapshotWithExtendedDelimiter2() {
    let source = ###"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: ##"""
    """##)
    """###

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: ##""#"##, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testCreateSnapshotWithLongerExtendedDelimiter1() {
    let source = ###"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: ##"""
    """##)
    """###

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: #"\""#, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testCreateSnapshotWithLongerExtendedDelimiter2() {
    let source = ####"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: ###"""
    """###)
    """####

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: ##""#"##, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testCreateSnapshotWithShorterExtendedDelimiter1() {
    let source = #"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: """
    """)
    """#

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: #"\""#, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testCreateSnapshotWithShorterExtendedDelimiter2() {
    let source = ##"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: #"""
    """#)
    """##

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: ##""#"##, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testUpdateSnapshotWithExtendedDelimiter1() {
    let source = ##"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: #"""
    \"
    """#)
    """##

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: #"\""#, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testUpdateSnapshotWithExtendedDelimiter2() {
    let source = ###"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: ##"""
    "#
    """##)
    """###

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: ##""#"##, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testUpdateSnapshotWithLongerExtendedDelimiter1() {
    let source = ##"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: """
    \"
    """)
    """##

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: #"\""#, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testUpdateSnapshotWithLongerExtendedDelimiter2() {
    let source = ###"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: #"""
    "#
    """#)
    """###

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: ##""#"##, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testUpdateSnapshotWithShorterExtendedDelimiter1() {
    let source = ###"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: ##"""
    \"
    """##)
    """###

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: #"\""#, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testUpdateSnapshotWithShorterExtendedDelimiter2() {
    let source = ####"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: ###"""
    "#
    """###)
    """####

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: ##""#"##, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

  // TODO: add more tests lie this with different amount of lines
//  func testUpdateSeveralSnapshots() {
//    let source = """
//    _assertInlineSnapshot(matching: post, as: .lines, with: \"""
//    OLD_SNAPSHOT
//    \""")
//
//    _assertInlineSnapshot(matching: post, as: .lines, with: \"""
//    OLD_SNAPSHOT
//    \""")
//    """
//
//    var recordings: Recordings = [:]
//    let context1 = Context(sourceCode: source, diffable: "NEW_SNAPSHOT\nwith two lines", fileName: "filename", lineIndex: 2)
//    let contextAfterFirstSnapshot = writeInlineSnapshot(&recordings, context1)
//
//    let context2 = Context(sourceCode: contextAfterFirstSnapshot.sourceCode, diffable: "NEW_SNAPSHOT", fileName: "filename", lineIndex: 6)
//    let newSource = writeInlineSnapshot(&recordings, context2).sourceCode
//
//    assertSnapshot(source: newSource)
//  }

  func testUpdateSnapshotCombined1() {
    let source = ######"""
    _assertInlineSnapshot(matching: "value", as: .lines, with: #####"""
    """#####)
    """######

    let diffable = ##"""
    ▿ User
      - bio: "Blobbed around the world."
      - id: 1
      - name: "Bl#\"\"#obby"
    """##

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }
}

func assertSnapshot(source: String, file: StaticString = #file, testName: String = #function, line: UInt = #line) {
  let indentedSource = source.split(separator: "\n").map { "    " + $0 }.joined(separator: "\n")
  let decoratedCode = """
  @testable import SnapshotTesting
  extension TestCase {
    func \(testName) {
  \(indentedSource)
    }
  }
  """
  assertSnapshot(matching: decoratedCode, as: .swift, file: file, testName: testName, line: line)
}

extension Snapshotting where Value == String, Format == String {
  public static var swift: Snapshotting {
    var snapshotting = Snapshotting(pathExtension: "txt", diffing: .lines)
    snapshotting.pathExtension = "swift"
    return snapshotting
  }
}

// Dummy class that is extended with the generated code to check that it builds.
class TestCase {}
