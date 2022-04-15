//
//  ListViewModelTests.swift
//  SimpleToDoTests
//
//  Created by Takahiro Tominaga on 2022/04/15.
//

import XCTest
@testable import SimpleToDo

class MyListViewModelTests: XCTestCase {

    var viewModel: ListViewModel!
    var mockService: MockTodoService!

    override func setUp() {
        mockService = MockTodoService()
        // デフォルトののMock data（DB）を用意する
        mockService.loadItems = TodoItem.mockItems
        viewModel = .init(service: mockService)
    }

    func test_ViewModel_init_loadVideosInServiceIsCalled() {
        // Arrange

        // Act

        // Assert
        XCTAssertTrue(mockService.isLoadTodoItemsCalled)
    }

    func test_ViewModel_getItems_canSetItemsFromDB() {
        // Arrange
        let items = [TodoItem.mockItem1, TodoItem.mockItem2]
        mockService.loadItems = items

        // Act
        viewModel.getItems()

        // Assert
        XCTAssertEqual(items, viewModel.items)
    }

    func test_ViewModel_deleteItem_canDeleteCorrectly() {
        // Arrange
        let deleteIndex = 1
        let beforeItems = viewModel.items

        // Act
        viewModel.deleteItem(indexSet: IndexSet(integer: deleteIndex))

        // Assert
        for (idx, item) in viewModel.items.enumerated() {
            if idx < deleteIndex {
                XCTAssertEqual(item, beforeItems[idx])
            } else if idx > deleteIndex {
                XCTAssertEqual(item, beforeItems[idx + 1])
            }
        }
    }

    func test_ViewModel_addItem_canAddItems() {
        // Arrange
        let newItemTitle = "new Item Title"
        XCTAssertNotEqual(newItemTitle, viewModel.items.last?.title)

        // Act
        viewModel.addItem(title: newItemTitle)

        // Assert
        XCTAssertEqual(newItemTitle, viewModel.items.last?.title)
    }

    func test_ViewModel_saveItems_saveVideosInServiceIsCalled() {
        // Arrange

        // Act
        viewModel.saveItems()

        // Assert
        XCTAssertTrue(mockService.isSaveTodoItemsCalled)
        XCTAssertEqual(TodoItem.mockItems, mockService.savedItems)
    }

    func test_ViewModel_moveItem_canMoveCorrectly() {
        // Arrange
        let fromIndex = 1
        let toIndex = 3
        let beforeItems = viewModel.items

        // Act
        viewModel.moveItem(from: IndexSet(integer: fromIndex), to: toIndex)

        // Assert
        for (idx, item) in viewModel.items.enumerated() {
            if idx < fromIndex {
                XCTAssertEqual(item, beforeItems[idx])
            } else if idx < toIndex - 1 {
                XCTAssertEqual(item, beforeItems[idx + 1])
            } else if idx == toIndex - 1 {
                XCTAssertEqual(item, beforeItems[fromIndex])
            } else {
                XCTAssertEqual(item, beforeItems[idx])
            }
        }
    }

    func test_ViewModel_toggleDone_canToggleCorrectly() {
        // Arrange
        let before = viewModel.items.last?.done

        // Act
        viewModel.toggleDone(item: viewModel.items.last!)

        // Assert
        XCTAssertNotEqual(before, viewModel.items.last!.done)
    }

    func test_ViewModel_deleteItem_canCallSaveItemsInService() {
        // Arrange
        let deleteIndex = 1

        // Act
        viewModel.deleteItem(indexSet: IndexSet(integer: deleteIndex))

        // Assert
        XCTAssertTrue(mockService.isSaveTodoItemsCalled)
    }

    func test_ViewModel_addItem_canCallSaveItemsInService() {
        // Arrange
        let newItemTitle = "new Item Title"
        XCTAssertNotEqual(newItemTitle, viewModel.items.last?.title)

        // Act
        viewModel.addItem(title: newItemTitle)

        // Assert
        XCTAssertTrue(mockService.isSaveTodoItemsCalled)
    }

    func test_ViewModel_moveItem_canCallSaveItemsInService() {
        // Arrange
        let fromIndex = 1
        let toIndex = 3

        // Act
        viewModel.moveItem(from: IndexSet(integer: fromIndex), to: toIndex)

        // Assert
        XCTAssertTrue(mockService.isSaveTodoItemsCalled)
    }

    func test_ViewModel_toggleDone_canCallSaveItemsInService() {
        // Arrange

        // Act
        viewModel.toggleDone(item: viewModel.items.last!)

        // Assert
        XCTAssertTrue(mockService.isSaveTodoItemsCalled)
    }

    func test_ViewModel_onTapDeleteButtonInDialog_deleteAllItems() {
        // Arrange
        XCTAssertFalse(viewModel.items.isEmpty)

        // Act
        viewModel.onTapDeleteButtonInDialog()

        // Assert
        XCTAssertTrue(viewModel.items.isEmpty)
    }
}
