//
//  MockTodoService.swift
//  SimpleToDoTests
//
//  Created by Takahiro Tominaga on 2022/04/15.
//

import Foundation
@testable import SimpleToDo

class MockTodoService: TodoServiceProtocol {

    var loadItems: [TodoItem] = []

    var isLoadTodoItemsCalled = false
    func loadTodoItems() -> [TodoItem] {
        isLoadTodoItemsCalled = true
        return loadItems
    }

    var isSaveTodoItemsCalled = false
    var savedItems: [TodoItem]?
    func saveTodoItems(items: [TodoItem]) {
        isSaveTodoItemsCalled = true
        savedItems = items
    }
}
