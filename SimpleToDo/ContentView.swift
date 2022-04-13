//
//  ContentView.swift
//  SimpleToDo
//
//  Created by Takahiro Tominaga on 2022/04/11.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        ListView()
            .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
