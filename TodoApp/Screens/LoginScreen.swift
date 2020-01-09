//
//  LoginScreen.swift
//  TodoApp
//
//  Created by Nguyễn Huy Hoàng on 1/10/20.
//  Copyright © 2020 Nguyễn Huy Hoàng. All rights reserved.
//

import SwiftUI

struct LoginScreen: View {
    
    @State private var phoneNumber: String = ""
    
    var body: some View {
        VStack {
            Text("Login")
                .bold()
                .font(.largeTitle)
            TextField("Phone number", text: $phoneNumber)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.horizontal)
            NavigationLink(destination: VerifyScreen()) {
                Text("Login")
                    .frame(width: 100)
                    .foregroundColor(Color.white)
                    .padding(10)
            }.background(Color("Button")).clipShape(Capsule()).padding()
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
