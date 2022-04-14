//
//  UserDefaultsManager.swift
//  SimpleToDo
//
//  Created by Takahiro Tominaga on 2022/04/15.
//

import Foundation

/*
 UserDefaults
 */
struct UserDefaultsManager {

    let todoListKey: String = "todo_list"

    func getTodoItems() -> [TodoItem] {
        guard
            let data = UserDefaults.standard.data(forKey: todoListKey),
            let savedItems = try? JSONDecoder().decode([TodoItem].self, from: data)
        else { return []}
        return savedItems
    }

    func addTodo(item: TodoItem) {
        var items = getTodoItems()
        items.append(contentsOf: [item])
        saveTodoItems(items: items)
    }

    func saveTodoItems(items: [TodoItem]) {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: todoListKey)
        }
    }
}
