import XCTest
@testable import SnapshotTesting

class InlineSnapshotTests: XCTestCase {

  func testCreateSnapshotSingleLine() {
    let diffable = "NEW_SNAPSHOT"
    let source = """
    _assertInlineSnapshot(matching: "\(diffable)", as: .lines, with: "")
    """

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
    ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testCreateSnapshotMultiLine() {
    let diffable = "NEW_SNAPSHOT"
    let source = #"""
    _assertInlineSnapshot(matching: "\#(diffable)", as: .lines, with: """
    """)
    """#

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
    ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testUpdateSnapshot() {
    let diffable = "NEW_SNAPSHOT"
    let source = #"""
    _assertInlineSnapshot(matching: "\#(diffable)", as: .lines, with: """
    OLD_SNAPSHOT
    """)
    """#

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
    ).sourceCode

    assertSnapshot(source: newSource)
  }

//  func testUpdateSnapshotWithMoreLines() {
//    let diffable = "NEW_SNAPSHOT\nNEW_SNAPSHOT"
//    let source = #"""
//    _assertInlineSnapshot(matching: "\#(diffable)", as: .lines, with: """
//    OLD_SNAPSHOT
//    """)
//    """#
//
//    var recordings: Recordings = [:]
//    let newSource = writeInlineSnapshot(
//      &recordings,
//      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
//      ).sourceCode
//
//    assertSnapshot(source: newSource)
//  }

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
    let diffable = #"\""#
    let source = """
    _assertInlineSnapshot(matching: #"\(diffable)"#, as: .lines, with: "")
    """

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

  func testCreateSnapshotEscapedNewlineLastLine() {
    let diffable = #"\"#
    let source = """
    _assertInlineSnapshot(matching: #"\(diffable)"#, as: .lines, with: "")
    """

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

//  func testCreateSnapshotWithExtendedDelimiterSingleLine2() {
//    let diffable = ##"\"""#"##
//    let source = ##"""
//    _assertInlineSnapshot(matching: ##"\##(diffable)"##, as: .lines, with: "")
//    """##
//
//    var recordings: Recordings = [:]
//    let newSource = writeInlineSnapshot(
//      &recordings,
//      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
//      ).sourceCode
//
//    assertSnapshot(source: newSource)
//  }

  func testCreateSnapshotWithExtendedDelimiter1() {
    let diffable = #"\""#
    let source = ##"""
    _assertInlineSnapshot(matching: #"\##(diffable)"#, as: .lines, with: #"""
    """#)
    """##

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

//  func testCreateSnapshotWithExtendedDelimiter2() {
//    let diffable = ##"\"""#"##
//    let source = ###"""
//    _assertInlineSnapshot(matching: ##"\###(diffable)"##, as: .lines, with: ##"""
//    """##)
//    """###
//
//    var recordings: Recordings = [:]
//    let newSource = writeInlineSnapshot(
//      &recordings,
//      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
//      ).sourceCode
//
//    assertSnapshot(source: newSource)
//  }

  func testCreateSnapshotWithLongerExtendedDelimiter1() {
    let diffable =  #"\""#
    let source = ###"""
    _assertInlineSnapshot(matching: #"\###(diffable)"#, as: .lines, with: ##"""
    """##)
    """###

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

//  func testCreateSnapshotWithLongerExtendedDelimiter2() {
//    let diffable = ##"\"""#"##
//    let source = ####"""
//    _assertInlineSnapshot(matching: ##"\####(diffable)"##, as: .lines, with: ###"""
//    """###)
//    """####
//
//    var recordings: Recordings = [:]
//    let newSource = writeInlineSnapshot(
//      &recordings,
//      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
//      ).sourceCode
//
//    assertSnapshot(source: newSource)
//  }

  func testCreateSnapshotWithShorterExtendedDelimiter1() {
    let diffable = #"\""#
    let source = #"""
    _assertInlineSnapshot(matching: #"\#(diffable)"#, as: .lines, with: """
    """)
    """#

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

//  func testCreateSnapshotWithShorterExtendedDelimiter2() {
//    let diffable = ##"\"""#"##
//    let source = ##"""
//    _assertInlineSnapshot(matching: ##"\##(diffable)"##, as: .lines, with: #"""
//    """#)
//    """##
//
//    var recordings: Recordings = [:]
//    let newSource = writeInlineSnapshot(
//      &recordings,
//      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
//      ).sourceCode
//
//    assertSnapshot(source: newSource)
//  }

  func testUpdateSnapshotWithExtendedDelimiter1() {
    let diffable = #"\""#
    let source = ##"""
    _assertInlineSnapshot(matching: #"\##(diffable)"#, as: .lines, with: #"""
    \"
    """#)
    """##

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

//  func testUpdateSnapshotWithExtendedDelimiter2() {
//    let diffable = ##"\"\"\"#"##
//    let source = ###"""
//    _assertInlineSnapshot(matching: ##"\###(diffable)"##, as: .lines, with: ##"""
//    "#
//    """##)
//    """###
//
//    var recordings: Recordings = [:]
//    let newSource = writeInlineSnapshot(
//      &recordings,
//      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
//      ).sourceCode
//
//    assertSnapshot(source: newSource)
//  }

  func testUpdateSnapshotWithLongerExtendedDelimiter1() {
    let diffable = #"\""#
    let source = #"""
    _assertInlineSnapshot(matching: #"\#(diffable)"#, as: .lines, with: """
    \"
    """)
    """#

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

//  func testUpdateSnapshotWithLongerExtendedDelimiter2() {
//    let diffable = ##"\"""#"##
//    let source = ##"""
//    _assertInlineSnapshot(matching: ##"\##(diffable)"##, as: .lines, with: #"""
//    "#
//    """#)
//    """##
//
//    var recordings: Recordings = [:]
//    let newSource = writeInlineSnapshot(
//      &recordings,
//      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
//      ).sourceCode
//
//    assertSnapshot(source: newSource)
//  }

  func testUpdateSnapshotWithShorterExtendedDelimiter1() {
    let diffable = #"\""#
    let source = ###"""
    _assertInlineSnapshot(matching: #"\###(diffable)"#, as: .lines, with: ##"""
    \"
    """##)
    """###

    var recordings: Recordings = [:]
    let newSource = writeInlineSnapshot(
      &recordings,
      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
      ).sourceCode

    assertSnapshot(source: newSource)
  }

//  func testUpdateSnapshotWithShorterExtendedDelimiter2() {
//    let diffable = ##"\"""#"##
//    let source = ####"""
//    _assertInlineSnapshot(matching: ##"\####(diffable)"##, as: .lines, with: ###"""
//    "#
//    """###)
//    """####
//
//    var recordings: Recordings = [:]
//    let newSource = writeInlineSnapshot(
//      &recordings,
//      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
//      ).sourceCode
//
//    assertSnapshot(source: newSource)
//  }

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

//  func testUpdateSnapshotCombined1() {
//    let diffable = ##"""
//    ▿ User
//      - bio: "Blobbed around the world."
//      - id: 1
//      - name: "Bl#\"\"#obby"
//    """##
//
//    let source = ######"""
//    _assertInlineSnapshot(matching: ##"\######(diffable)"##, as: .lines, with: #####"""
//    """#####)
//    """######
//
//    var recordings: Recordings = [:]
//    let newSource = writeInlineSnapshot(
//      &recordings,
//      Context(sourceCode: source, diffable: diffable, fileName: "filename", lineIndex: 1)
//      ).sourceCode
//
//    assertSnapshot(source: newSource)
//  }
}

func assertSnapshot(source: String, record: Bool = false, file: StaticString = #file, testName: String = #function, line: UInt = #line) {
  let indentedSource = source.split(separator: "\n").map { "    " + $0 }.joined(separator: "\n")
  let decoratedCode = """
  import XCTest
  @testable import SnapshotTesting
  extension InlineSnapshotsValidityTests {
    func \(testName) {
  \(indentedSource)
    }
  }
  """
  assertSnapshot(matching: decoratedCode, as: .swift, record: record, file: file, testName: testName, line: line)
}

extension Snapshotting where Value == String, Format == String {
  public static var swift: Snapshotting {
    var snapshotting = Snapshotting(pathExtension: "txt", diffing: .lines)
    snapshotting.pathExtension = "swift"
    return snapshotting
  }
}

// Class that is extended with the generated code to check that it builds.
// Besides that, the generated code is a test itself, which tests that the
// snapshotted value is equal to the original value.
// With this test we check that we escaped correctly
// e.g. if we enclose \" in """ """ instead of #""" """#,
// the character sequence will be interpreted as " instead of \"
// The generated tests check this issues.
class InlineSnapshotsValidityTests: XCTestCase {}
