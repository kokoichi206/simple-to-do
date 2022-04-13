//
//  ListRowView.swift
//  SimpleToDo
//
//  Created by Takahiro Tominaga on 2022/04/13.
//

import SwiftUI

struct ListRowView: View {

    let item: TodoItem

    let paddingVertical: CGFloat = 8
    let paddingHorizontal: CGFloat = 12

    var body: some View {

        VStack {

            HStack {

                Image(systemName: item.done ? "checkmark.square" : "square")
                    .font(.title)
                    .foregroundColor(Color.mainFontColor)
                    .padding(.trailing, 4)

                Text(item.title)
                    .font(.title)
                    .foregroundColor(Color.mainFontColor)

                Spacer()
            }
            .padding(.vertical, paddingVertical)
            .padding(.horizontal, paddingHorizontal)
            .frame(maxWidth: .infinity)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListRowView(item: TodoItem(title: "do something", done: false))
                .background(Color.black)
            ListRowView(item: TodoItem(title: "DONE!", done: true))
                .background(Color.black)
        }

    }
}
