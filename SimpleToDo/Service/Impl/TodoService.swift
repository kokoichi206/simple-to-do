//
//  TodoService.swift
//  SimpleToDo
//
//  Created by Takahiro Tominaga on 2022/04/15.
//

import Foundation

struct TodoService: TodoServiceProtocol {
    /*
     ローカルに保存されている全てのTodoItemの情報を読み込む
     */
    func loadTodoItems() -> [TodoItem] {
        return UserDefaultsManager().getTodoItems()
    }

    /*
     ローカルにTodoItemの情報を書き込む
     */
    func saveTodoItems(items: [TodoItem]) {
        UserDefaultsManager().saveTodoItems(items: items)
    }
}
