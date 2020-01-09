import SwiftUI

struct ContentView: View {
    
    @State var newTask: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Login()
            }
        }
    }
}

struct Login: View {
    
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
            NavigationLink(destination: Verify()) {
                Text("Login")
                    .frame(width: 100)
                    .foregroundColor(Color.white)
                    .padding(10)
            }.background(Color("Button")).clipShape(Capsule()).padding()
        }
    }
}

struct Verify: View {
    
    @State private var otpcode: String = ""
    
    var body: some View {
        NavigationView {
            TextField("OTP Code", text: $otpcode)
            Button(action: {}) {
                Text("Login")
            }
            .navigationBarTitle(Text("Verify"))
        }
    }
}

struct Home: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
