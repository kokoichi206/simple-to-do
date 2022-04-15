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

    @Published var items: [TodoItem] = [] {
        didSet {
            saveItems()
        }
    }
    @Published var isAdding = false
    @Published var showingAlert = false

    let service: TodoServiceProtocol

    init(service: TodoServiceProtocol = TodoService()) {

        self.service = service

        getItems()
    }

    /*
     DBから値を取得する。
     */
    func getItems() {
        items = service.loadTodoItems()
    }

    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    func addItem(title: String) {
        let newItem = TodoItem(title: title, done: false)
        items.append(newItem)
    }

    func saveItems() {
        service.saveTodoItems(items: items)
    }

    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }

    func toggleDone(item: TodoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.toggleDone()
        }
    }

    func onTapAddButton() {
        isAdding = true
    }

    /*
     アイテム追加キーボードの"Return"キーを押した時にtextが有限だった時の処理。
     */
    func onTapReturnButton(title: String) {
        addItem(title: title)
    }

    /*
     アイテム追加キーボードの"Return"キーを押した時にtextがNullだった時の処理。
     */
    func onTapReturnButtonWithNullText() {
        self.isAdding = false
    }

    func onTapDeleteButton() {
        showingAlert = true
    }

    /*
     ダイアログ内のキャンセルボタンが押された時の処理
     */
    func onTapCancelButtonInDialog() {
        print("onTapCancelButtonInDialog")
    }

    /*
     ダイアログ内の削除ボタンが押された時の処理
     */
    func onTapDeleteButtonInDialog() {
        print("onTapDeleteButtonInDialog")
    }
}
