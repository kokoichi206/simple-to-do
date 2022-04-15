//
//  SimpleToDoUITests.swift
//  SimpleToDoUITests
//
//  Created by Takahiro Tominaga on 2022/04/11.
//

import XCTest
import SimpleToDo

class SimpleToDoUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state
        // - such as interface orientation - required for your tests before they run.
        // The setUp method is a good place to do this.
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_ListView_titleAndButton_displayCorrectly() {
        // Arrange
        let listTitle = app.buttons[TestTags.listTitle]
        let addButton = app.buttons[TestTags.addButton]

        // Act

        // Assert
        XCTAssertTrue(listTitle.exists)
        XCTAssertTrue(addButton.exists)
    }

    func test_ListView_tapAddButton_openAddView() {
        // Arrange
        let addButton = app.buttons[TestTags.addButton]
        let addView = app.staticTexts[TestTags.addText]
        XCTAssertFalse(addView.exists)

        // Act
        addButton.tap()

        // Assert
        XCTAssertTrue(addView.exists)
    }

    func test_ListView_firstAddView_keyboardIsOpen() {
        // Arrange
        let addButton = app.buttons[TestTags.addButton]
        let addView = app.staticTexts[TestTags.addText]
        addButton.tap()
        XCTAssertTrue(addView.exists)

        // Act

        // Assert
        XCTAssertEqual(1, app.keyboards.count)
    }

    func test_AddView_tapNextWithEmpty_closeKeyboard() {
        // シミュレータではキーボードが開かないのでテストをスキップする
        #if !targetEnvironment(simulator)
        // Arrange
        let addButton = app.buttons[TestTags.addButton]
        let addView = app.staticTexts[TestTags.addText]
        addButton.tap()
        XCTAssertTrue(addView.exists)

        // Act
        if app.buttons["次へ"].exists {
            app.buttons["次へ"].tap()
        } else if app.buttons["next"].exists {
            app.buttons["next"].tap()
        }

        // Assert
        XCTAssertFalse(addView.exists)
        XCTAssertEqual(0, app.keyboards.count)
        #endif
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
