import SwiftUI
import Firebase

struct HomeScreen: View {
    
    @State private var task: String = ""
    
    let a = Array(1...1000)
    
    var body: some View {
        VStack {
            HStack {
                TextField("What do you want to note ?", text: $task)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    // Action
                }) {
                    Text("Add")
                }
            }.padding()
            Button("Sign Out") {
                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
            }
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
