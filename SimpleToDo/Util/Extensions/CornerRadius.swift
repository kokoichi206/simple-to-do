//
//  CornerRadius.swift
//  SimpleToDo
//
//  Created by Takahiro Tominaga on 2022/04/14.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect, byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CornerRadius_Previews: PreviewProvider {
    static var previews: some View {
        Color.black
            .frame(height: 200)
            .cornerRadius(60, corners: [.topRight, .bottomLeft])
    }
}
