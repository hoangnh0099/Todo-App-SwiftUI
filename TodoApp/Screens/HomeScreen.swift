//
//  HomeScreen.swift
//  TodoApp
//
//  Created by Nguyễn Huy Hoàng on 1/10/20.
//  Copyright © 2020 Nguyễn Huy Hoàng. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            ScrollView {
                List {
                    Text("Hello")
                }
            }
            .navigationBarTitle(Text("Home"))
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
