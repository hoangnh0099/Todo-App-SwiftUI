import SwiftUI

struct ContentView: View {
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                if status {
                    HomeScreen()
                } else {
                    LoginScreen()
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
