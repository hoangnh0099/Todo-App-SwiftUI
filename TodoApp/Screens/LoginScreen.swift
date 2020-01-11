import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestore

struct LoginScreen: View {
    
    func signInAnonymous() -> Void {
        Auth.auth().signInAnonymously() {
            (authResult, error) in
            if (error != nil) {
                print("Error: " + error!.localizedDescription)
                return
            }
            
            UserDefaults.standard.set(true, forKey: "status")
            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
            print("Login Successful!")
        }
    }
    
    var body: some View {
        VStack {
            Text("Login")
                .bold()
                .font(.largeTitle)
            
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
