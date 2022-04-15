//
//  TodoServiceProtocol.swift
//  SimpleToDo
//
//  Created by Takahiro Tominaga on 2022/04/15.
//

import Foundation

protocol TodoServiceProtocol {

    func loadTodoItems() -> [TodoItem]

    func saveTodoItems(items: [TodoItem])
}
