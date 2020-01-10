import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestore

struct LoginScreen: View {
    
    @State private var phoneNumber: String = ""
    
    func signInAnonymous() -> Void {
        Auth.auth().signInAnonymously() {
            (authResult, error) in
            if (error != nil) {
                print("Error: " + error!.localizedDescription)
                return
            }
            
            UserDefaults.standard.set(true, forKey: "status")
            print("Login Successful!")
        }
    }
    
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
            
            // Anonymous Login
            NavigationLink(destination: HomeScreen()) {
                Button(action: signInAnonymous) {
                    Text("Anonymous Login")
                        .frame(width: 200)
                        .foregroundColor(Color.white)
                        .padding()
                }
            }.background(Color("Button")).clipShape(Capsule()).padding()
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
