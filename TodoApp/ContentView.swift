//
//  ContentView.swift
//  TodoApp
//
//  Created by Nguyễn Huy Hoàng on 1/9/20.
//  Copyright © 2020 Nguyễn Huy Hoàng. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let tasks = Array(0...1000)
    @State var newTask: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .trailing, spacing: 0) {
                TextField("What do you want to note ?", text: $newTask)
                List {
                    Section(header: Text("Task today")) {
                        ForEach(tasks, id: \.self) {
                            result in Text(String(result))
                        }
                        
                    }
                }
            }
            .navigationBarTitle(
                Text("Todo App")
                    .font(.title)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
