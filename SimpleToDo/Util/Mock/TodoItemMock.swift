//
//  TodoItemMock.swift
//  SimpleToDo
//
//  Created by Takahiro Tominaga on 2022/04/13.
//

import Foundation

extension TodoItem {

    static let mockItem1 = TodoItem(title: "Wake up", done: false)
    static let mockItem2 = TodoItem(title: "F●ck SwiftUI", done: true)

    static let mockItems = [
        TodoItem(title: "Read xxx book", done: true),
        TodoItem(title: "Read yyy book", done: false),
        TodoItem(title: "Wake up", done: false),
        TodoItem(title: "Run 5km", done: false),
        TodoItem(title: "Work", done: false),
        TodoItem(title: "Read xxx book", done: true),
        TodoItem(title: "Read yyy book", done: false),
        TodoItem(title: "Wake up", done: false),
        TodoItem(title: "Run 5km", done: false),
        TodoItem(title: "Work", done: false),
        TodoItem(title: "Read xxx book", done: true),
        TodoItem(title: "Read yyy book", done: false),
        TodoItem(title: "Wake up", done: false),
        TodoItem(title: "Run 5km", done: false),
        TodoItem(title: "Work", done: false)
    ]
}
