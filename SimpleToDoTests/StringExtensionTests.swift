//
//  StringExtensionTests.swift
//  SimpleToDoTests
//
//  Created by Takahiro Tominaga on 2022/04/16.
//

import XCTest
@testable import SimpleToDo

class StringExtensionTests: XCTestCase {

    func test_isBlank_extected_true() {

        // isEmpty
        XCTAssertTrue("".isBlank)
        // 半角スペース
        XCTAssertTrue(" ".isBlank)
        XCTAssertTrue("  ".isBlank)
        // 全角スペース
        XCTAssertTrue("　".isBlank)
        XCTAssertTrue("　　".isBlank)
        // 半角 + 全角
        XCTAssertTrue(" 　".isBlank)
    }

    func test_isBlank_extected_false() {

        XCTAssertFalse("Hello".isBlank)
        XCTAssertFalse("こんにちは世界".isBlank)
        XCTAssertFalse("hi, やぁ".isBlank)
        XCTAssertFalse("あ　い".isBlank)
    }
}
