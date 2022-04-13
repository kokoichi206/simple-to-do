//
//  CustomDivider.swift
//  SimpleToDo
//
//  Created by Takahiro Tominaga on 2022/04/13.
//

import SwiftUI

struct HorizontalDivider: View {

    var color: Color = .gray
    var height: CGFloat = 4

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: height)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

struct CustomDivider_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalDivider()
    }
}
