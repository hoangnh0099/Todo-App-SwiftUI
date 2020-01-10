//
//  VerifyScreen.swift
//  TodoApp
//
//  Created by Nguyễn Huy Hoàng on 1/10/20.
//  Copyright © 2020 Nguyễn Huy Hoàng. All rights reserved.
//

import SwiftUI

struct VerifyScreen: View {
    
    @State private var otpCode: String = ""
    
    var body: some View {
        VStack {
            Text("Verify Code")
                .bold()
                .font(.largeTitle)
            TextField("OTP Code", text: $otpCode)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.horizontal)
            NavigationLink(destination: HomeScreen()) {
                Text("Login")
                    .frame(width: 100)
                    .foregroundColor(Color.white)
                    .padding(10)
            }.background(Color("Button")).clipShape(Capsule()).padding()
        }
        
        .navigationBarTitle(Text("Home"), displayMode: .inline)
    }
}

struct VerifyScreen_Previews: PreviewProvider {
    static var previews: some View {
        VerifyScreen()
    }
}
