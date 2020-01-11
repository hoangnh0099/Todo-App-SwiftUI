import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import Combine

struct dataset: Identifiable {
    var id = ""
    var content = ""
}

class GetData: ObservableObject {
    var didChange = PassthroughSubject<GetData, Never>()
    var data = [dataset]() {
        didSet {
            objectWillChange.send()
        }
    }
    
    init() {
        let db = Firestore.firestore().collection("Todo")
        db.addSnapshotListener {
            (documentSnapshot, error) in
            if error != nil {
                print("Error: " + (error?.localizedDescription)!)
                return
            }
            
            for i in (documentSnapshot?.documentChanges)! {
                let content = i.document.data()["content"] as! String
                let id = i.document.documentID

                DispatchQueue.main.async {
                    self.data.append(dataset(id: id, content: content))
                }
            }
            
        }
    }
}

struct HomeScreen: View {
    
    @State private var task: String = ""
    @ObservedObject var todoData: GetData = GetData()
    let db = Firestore.firestore().collection("Todo")
    
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
        self.task = ""
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
            List(todoData.data) {
                item in TodoItem(todoId: item.id, todoContent: item.content)
            }
            .navigationBarTitle(Text("Home"), displayMode: .inline)
        }
    }
}

struct TodoItem: View {
    @State var todoId = ""
    @State var todoContent = ""
    let db = Firestore.firestore().collection("Todo")
    
    func deleteTodo(id: String) -> Void {
        db.document(id).delete() {
            err in
            if err != nil {
                print("Error removing document: \(String(describing: err))")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
    var body: some View {
        HStack {
            Text(todoContent)
            Spacer()
            Button(action: { () -> Void in self.deleteTodo(id: self.todoId)} ) {
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
