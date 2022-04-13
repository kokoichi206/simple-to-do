//
//  ListViewModel.swift
//  SimpleToDo
//
//  Created by Takahiro Tominaga on 2022/04/13.
//

import Foundation

/*
 メイン画面のViewModel。
 */
class ListViewModel: ObservableObject {

    @Published var items: [TodoItem] = []

    init() {
        getItems()
    }

    /*
     DBから値を取得する。
     */
    func getItems() {
        // TODO: DBから持ってくるようにする。
        items = TodoItem.mockItems
    }

    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    func addItem(title: String) {
        let newItem = TodoItem(title: title, done: false)
        items.append(newItem)
    }

    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }

    func toggleDone(item: TodoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.toggleDone()
        }
    }
}
