//
//  ListView.swift
//  SimpleToDo
//
//  Created by Takahiro Tominaga on 2022/04/13.
//

import SwiftUI

struct ListView: View {

    var items: [TodoItem]

    let buttonSize: CGFloat = 70
    let paddingTop: CGFloat = 40

    var body: some View {
        ZStack {
            VStack(spacing: 0) {

                titleText

                HorizontalDivider(color: Color.mainFontColor, height: 2)
                    .padding(.vertical, 8)

                mainList
            }

            addButton
                .padding(.vertical, 30)
        }
        .padding(.top, paddingTop)
        .background(Color.backGround)
    }
}

extension ListView {

    var titleText: some View {

        Text("defaultTitle")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.mainFontColor)
    }

    var mainList: some View {

        ScrollView(showsIndicators: false) {

            ForEach(items) { item in
                ListRowView(item: item)
            }

            Spacer()
        }
    }

    var addButton: some View {

        HStack(alignment: .bottom) {

            Spacer()

            VStack(alignment: .trailing) {

                Spacer()

                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: buttonSize, height: buttonSize)
                    .foregroundColor(Color.red)
            }
        }
        .padding()
    }
}

struct ListView_Previews: PreviewProvider {

    static let items = [
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

    static var previews: some View {
        ListView(items: items)
            .ignoresSafeArea(.all)
    }
}
