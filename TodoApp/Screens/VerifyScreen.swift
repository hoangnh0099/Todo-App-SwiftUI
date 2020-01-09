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
        NavigationView {
            TextField("OTP Code", text: $otpCode)
            Button(action: {}) {
                Text("Login")
            }
            .navigationBarTitle(Text("Verify"))
        }
    }
}

struct VerifyScreen_Previews: PreviewProvider {
    static var previews: some View {
        VerifyScreen()
    }
}
