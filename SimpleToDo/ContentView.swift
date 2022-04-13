//
//  ContentView.swift
//  SimpleToDo
//
//  Created by Takahiro Tominaga on 2022/04/11.
//

import SwiftUI

struct ContentView: View {
    let items = [
        TodoItem(title: "Read xxx book", done: true),
        TodoItem(title: "Read yyy book", done: false),
        TodoItem(title: "Wake up", done: false),
        TodoItem(title: "Run 5km", done: false),
        TodoItem(title: "Work", done: false)
    ]
    var body: some View {
        ListView(items: items)
            .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
