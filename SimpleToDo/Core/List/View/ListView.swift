//
//  ListView.swift
//  SimpleToDo
//
//  Created by Takahiro Tominaga on 2022/04/13.
//

import SwiftUI

/*
 メイン画面。
 */
struct ListView: View {

    let buttonSize: CGFloat = 70
    let paddingTop: CGFloat = 40

    @ObservedObject var viewModel = ListViewModel()

    @State var text = ""

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 0) {

                titleText

                HorizontalDivider(color: Color.mainFontColor, height: 2)
                    .padding(.vertical, 8)

                mainList
            }

            addButton
                .padding(.vertical, 30)

            if viewModel.isAdding {
                VStack {
                    CustomTextField(text: $text) {
                        viewModel.onTapReturnButton(title: text)
                        self.text = ""
                    } onReturnClickedWithNull: {
                        viewModel.onTapReturnButtonWithNullText()
                        print("onTapReturnButtonWithNullText")
                        self.text = ""
                    }

                }
                .background(Color.clear)
            }
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

        List {
            ForEach(viewModel.items) { item in
                ListRowView(item: item)
                    .background(Color.backGround)
                    .listRowBackground(Color.backGround)
                    .listRowInsets(EdgeInsets())
                    .onTapGesture {
                        viewModel.toggleDone(item: item)
                    }
            }
            .onDelete(perform: viewModel.deleteItem)
            .onMove(perform: viewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .foregroundColor(Color.mainFontColor)
    }

    var addButton: some View {

        Button {
            // TODO: 好きな文字を入れられるようにする。
            viewModel.onTapAddButton()
            print(viewModel.isAdding)
        } label: {
            addButtonView
        }
    }

    var addButtonView: some View {

        Image(systemName: "plus.circle.fill")
            .resizable()
            .frame(width: buttonSize, height: buttonSize)
            .foregroundColor(Color.red)
            .padding()
    }
}

struct ListView_Previews: PreviewProvider {

    static var previews: some View {
        ListView()
            .ignoresSafeArea(.all)
    }
}
