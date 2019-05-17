//
//  String+SpecialCharactersTests.swift
//  SnapshotTesting
//
//  Created by Ferran Pujol Camins on 17/05/2019.
//

import XCTest
@testable import SnapshotTesting

class String_SpecialCharactersTests: XCTestCase {

  func testUnicodeLiterals() {
    XCTAssertTrue(#"\u{0}"#.hasEscapedSpecialCharactersLiteral(),
                  "An unicode literal is a special character")

    XCTAssertTrue(#"\u{00}"#.hasEscapedSpecialCharactersLiteral(),
                  "An unicode literal is a special character")

    XCTAssertTrue(#"\u{000}"#.hasEscapedSpecialCharactersLiteral(),
                  "An unicode literal is a special character")

    XCTAssertTrue(#"\u{0000}"#.hasEscapedSpecialCharactersLiteral(),
                  "An unicode literal is a special character")

    XCTAssertTrue(#"\u{00000}"#.hasEscapedSpecialCharactersLiteral(),
                  "An unicode literal is a special character")

    XCTAssertTrue(#"\u{000000}"#.hasEscapedSpecialCharactersLiteral(),
                  "An unicode literal is a special character")

    XCTAssertTrue(#"\u{0000000}"#.hasEscapedSpecialCharactersLiteral(),
                  "An unicode literal is a special character")

    XCTAssertTrue(#"\u{00000000}"#.hasEscapedSpecialCharactersLiteral(),
                  "An unicode literal is a special character")

    XCTAssertTrue(#"\u{1F496}"#.hasEscapedSpecialCharactersLiteral(),
                  "An unicode literal is a special character")

    XCTAssertTrue(#"\u{1a496}"#.hasEscapedSpecialCharactersLiteral(),
                  "An unicode literal is a special character")
  }

  func testUnescapedLiterals() {
    XCTAssertFalse("".hasEscapedSpecialCharactersLiteral(),
                   "An empty string has no special characters")

    XCTAssertFalse("\0".hasEscapedSpecialCharactersLiteral(),
                  "An unescape literal must not be matched")

    XCTAssertFalse("\\".hasEscapedSpecialCharactersLiteral(),
                  "An unescape literal must not be matched")

    XCTAssertFalse("\n".hasEscapedSpecialCharactersLiteral(),
                  "An unescape literal must not be matched")

    XCTAssertFalse("\r".hasEscapedSpecialCharactersLiteral(),
                  "An unescape literal must not be matched")

    XCTAssertFalse("\"".hasEscapedSpecialCharactersLiteral(),
                  "An unescape literal must not be matched")

    XCTAssertFalse("\'".hasEscapedSpecialCharactersLiteral(),
                  "An unescape literal must not be matched")

    XCTAssertFalse("\u{0}".hasEscapedSpecialCharactersLiteral(),
                   "An unescape unicode literal must not be matched")
  }

  func testFromEscapedLiteral() {
    XCTAssertTrue("\\0".hasEscapedSpecialCharactersLiteral(),
                  "A null character is a special character")

    XCTAssertTrue("\\\\".hasEscapedSpecialCharactersLiteral(),
                  "A horizontal tab is a special character")

    XCTAssertTrue("\\n".hasEscapedSpecialCharactersLiteral(),
                  "A line feed is a special character")

    XCTAssertTrue("\\r".hasEscapedSpecialCharactersLiteral(),
                  "A carriage return is a special character")

    XCTAssertTrue("\\\"".hasEscapedSpecialCharactersLiteral(),
                  "A double quotation mark is a special character")

    XCTAssertTrue("\\'".hasEscapedSpecialCharactersLiteral(),
                  "A single quotation mark is a special character")
  }

  func testFromRawLiteral() {
    XCTAssertTrue(#"\0"#.hasEscapedSpecialCharactersLiteral(),
                  "A null character is a special character")

    XCTAssertTrue(#"\\"#.hasEscapedSpecialCharactersLiteral(),
                  "A horizontal tab is a special character")

    XCTAssertTrue(#"\n"#.hasEscapedSpecialCharactersLiteral(),
                  "A line feed is a special character")

    XCTAssertTrue(#"\r"#.hasEscapedSpecialCharactersLiteral(),
                  "A carriage return is a special character")

    XCTAssertTrue(#"\""#.hasEscapedSpecialCharactersLiteral(),
                  "A double quotation mark is a special character")

    XCTAssertTrue(#"\'"#.hasEscapedSpecialCharactersLiteral(),
                  "A single quotation mark is a special character")
  }
}
