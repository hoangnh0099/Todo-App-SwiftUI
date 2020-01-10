//
//  HomeScreen.swift
//  TodoApp
//
//  Created by Nguyễn Huy Hoàng on 1/10/20.
//  Copyright © 2020 Nguyễn Huy Hoàng. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    
    let a = Array(1...1000)
    
    var body: some View {
        VStack {
            List {
                ForEach(a, id: \.self) {
                    item in Text(String(item))
                }
            }
            
        }
        .navigationBarTitle(Text("Home"), displayMode: .inline)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
