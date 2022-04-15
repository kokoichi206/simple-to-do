//
//  TodoItem.swift
//  SimpleToDo
//
//  Created by Takahiro Tominaga on 2022/04/13.
//

import Foundation

/*
 Todo1つ分のモデル
 */
struct TodoItem: Identifiable, Codable, Equatable {

    let id: String
    let title: String
    let done: Bool

    init(id: String = UUID().uuidString, title: String, done: Bool) {
        self.id = id
        self.title = title
        self.done    = done
    }

    func updateTitle(newTitle: String) -> TodoItem {
        return TodoItem(id: id, title: newTitle, done: done)
    }

    func toggleDone() -> TodoItem {
        return TodoItem(id: id, title: title, done: !done)
    }

}
