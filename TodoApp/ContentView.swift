import SwiftUI

struct ContentView: View {
    
    @State var newTask: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                LoginScreen()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
