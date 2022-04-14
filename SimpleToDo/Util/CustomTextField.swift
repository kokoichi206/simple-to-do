//
//  CustomTextView.swift
//  SimpleToDo
//
//  Created by Takahiro Tominaga on 2022/04/13.
//

import SwiftUI

struct CustomTextField: View {

    var fontSize: CGFloat = 20
    let cornerRadius: CGFloat = 20
    @State private var becomeFirstResponder = false
    @State private var keyboardHeight: CGFloat = 0.0

    @ObservedObject var keyboard: KeyboardObserver = KeyboardObserver()

    @Binding var text: String
    var onReturnClicked: () -> Void
    var onReturnClickedWithNull: () -> Void

    var body: some View {

        HStack(alignment: .bottom) {
            VStack(spacing: 0) {

                // フォントサイズ0のTextView
                MyUITextView(text: $text, becomeFirstResponder: $becomeFirstResponder, onReturnClicked: {
                    onReturnClicked()
                }, onReturnClickedWithNull: {
                    onReturnClickedWithNull()
                })
                .onAppear {
                    // onAppearでキーボードを開く
                    self.becomeFirstResponder = true
                }

                // 実際の表示View
                HStack(spacing: 0) {
                    Text(text.isEmpty ? "todo" : text)
                        .font(.title2)
                        .foregroundColor(Color.mainFontColor.opacity(0.4))
                        .padding(12)

                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(
                    ZStack {
                        Color.backGround
                        Color.black.opacity(0.5)
                    }
                )
                .cornerRadius(cornerRadius, corners: [.topLeft, .topRight])

            }
            .offset(y: -keyboardHeight)
            .onReceive(
                // キーボードを検知
                NotificationCenter.default.publisher(
                    for: UIResponder.keyboardWillShowNotification)) { notification in
                if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                    let keyboardHeight = keyboardFrame.cgRectValue.height
                    print(keyboardHeight)
                    self.keyboardHeight = keyboardHeight
                }
            }
        }
    }
}

struct MyUITextView: UIViewRepresentable {

    @Binding var text: String
    @Binding var becomeFirstResponder: Bool
    var onReturnClicked: () -> Void
    var onReturnClickedWithNull: () -> Void

    func makeCoordinator() -> Coordinator {

        return MyUITextView.Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> some UITextView {

        let textView = UITextView()

        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 0.0)

        textView.delegate = context.coordinator
        textView.sizeToFit()

        textView.returnKeyType = .next

        return textView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        // 開幕と同時にTextViewを表示させる
        if self.becomeFirstResponder {
            DispatchQueue.main.async {
                uiView.becomeFirstResponder()
                self.becomeFirstResponder = false
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }

    class Coordinator: NSObject, UITextViewDelegate {

        var parent: MyUITextView
        let hint: String = "todo"

        init(parent: MyUITextView) {

            self.parent = parent
        }

        func textViewDidChange(_ textView: UITextView) {

            parent.text = textView.text
        }

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            // \n は『return』を意味する。
            if text == "\n" {
                if textView.text.count == 0 {
                    // 何も入力がない場合、キーボードを閉じる。
                    textView.resignFirstResponder()
                    parent.onReturnClickedWithNull()
                    return false
                } else {
                    // 入力がある場合、親から渡された関数を呼ぶ。
                    parent.onReturnClicked()
                    textView.text = ""
                    return false
                }
            }
            return true
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {

    @State static var text: String = ""
    @State static var containerHeight: CGFloat = 0

    static var previews: some View {
        CustomTextField(text: $text, onReturnClicked: {

        }, onReturnClickedWithNull: {

        })
        .background(Color.backGround)
        .padding(0)
    }
}
