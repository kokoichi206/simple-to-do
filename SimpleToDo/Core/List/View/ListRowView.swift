//
//  ListRowView.swift
//  SimpleToDo
//
//  Created by Takahiro Tominaga on 2022/04/13.
//

import SwiftUI

/*
 Todo１つ分のView。
 */
struct ListRowView: View {

    let item: TodoItem

    let paddingVertical: CGFloat = 8
    let paddingHorizontal: CGFloat = 12

    var body: some View {

        ZStack {

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
            
            // 終了しているものには横線を入れる。
            if item.done {
                HorizontalDivider(color: Color.mainFontColor.opacity(0.3), height: 2)
            }
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListRowView(item: TodoItem.mockItem1)
                .background(Color.black)
            ListRowView(item: TodoItem.mockItem2)
                .background(Color.black)
        }

    }
}
