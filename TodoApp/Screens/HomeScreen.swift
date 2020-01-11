import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import Combine


struct HomeScreen: View {
    
    @State private var task: String = ""
    @ObservedObject var a = DataProvider()
    
    let db = Firestore.firestore().collection("Todo")
    
    init() {
        getData()
    }
    
    func addData() -> Void {
        var ref: DocumentReference? = nil
        ref = db.addDocument(data: ["content": task]) {
            err in
            if err != nil {
                print("Error adding document: \((err?.localizedDescription)!)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func getData() -> Void {
        db.addSnapshotListener {
            (documentSnapshot, error) in
            if error != nil {
                print("Error: " + (error?.localizedDescription)!)
            }
            let contents = documentSnapshot!.documentChanges.map{ $0.document.data()["content"] as! String }
            DispatchQueue.main.async {
                self.a.array = contents
            }
            
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        print(offsets)
        //        db.document("Todo").delete(at)
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("What do you want to note ?", text: $task)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: addData) {
                    Text("Add")
                }
            }.padding()
            Button("Sign Out") {
                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                print("Logout Successful!")
            }
            List(a.array, id: \.self) {
                item in TodoItem(todoContent: item)
            }
            .navigationBarTitle(Text("Home"), displayMode: .inline)
        }
    }
}

struct TodoItem: View {
    var todoContent: String = ""
    
    var body: some View {
        HStack {
            Text(todoContent)
            Spacer()
            Button(action: {
                print("Hello")
            }) {
                Text("Delete").padding().foregroundColor(Color.white)
                }.background(Color.red).cornerRadius(10)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}



final class DataProvider: ObservableObject {
    let didChange = PassthroughSubject<DataProvider, Never>()
    
    var array = [String]() {
        didSet {
            objectWillChange.send()
        }
    }
}
