//  AuthService.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 19.05.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase
import CoreData
import FirebaseStorage
import Kingfisher

class AuthService{
    @Published var userSession : FirebaseAuth.User?
    @Published var currentUser : User?
    static let shared = AuthService()
    let container: NSPersistentContainer
    init(){
        container = NSPersistentContainer(name: "TarzoneApp") // Update with your data model file name
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data in DataController \(error.localizedDescription)")
            }
        }
        self.userSession = Auth.auth().currentUser
        Task{try await loadUserData()}
    }
    @MainActor
    func login (withEmail email : String, password: String)async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        }catch{
            print( "DEBUG: Failed to log in user with error \(error.localizedDescription)")
        }
        Task{try await loadUserData()}
        try await  fetchClothes()
    }
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
        deleteCloth()
    }
    @MainActor
    func createUser ( email : String, password: String,username: String)async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await self.uploadUserData(uid: result.user.uid, username: username, email: email)
        }catch{
            print( "DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
    }
    //fetch user
    @MainActor
    func loadUserData() async throws{
        guard let currentUid = self.userSession?.uid else{return}
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        print( "Current user login success.")
        self.currentUser = try? snapshot.data(as: User.self)
    }
    private func uploadUserData(uid: String, username: String, email: String) async{
        let user = User(id: uid, email: email, userName: username)
        self.currentUser = user
        guard let ecodedUser = try? Firestore.Encoder().encode(user) else{ return  }
        try? await Firestore.firestore().collection("users").document(user.id).setData(ecodedUser)
    }
    // MARK: SAVE AND DELETE CLOTHS IN COREDATA
    func deleteCloth(){
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ClothData")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(deleteRequest)
            try context.save()
            print("All data deleted successfully.")
        } catch {
        }
    }
    // Fetch all clothes data and images from Firestore and save to Core Data
    @MainActor
    func fetchClothes() async throws {
        guard let currentUid = self.userSession?.uid else { return }
        let querySnapshot = try await Firestore.firestore().collection("cloth").whereField("userId", isEqualTo: currentUid).getDocuments()
        // Access the persistent container
        let context = container.viewContext
        // Clear existing cloth data in Core Data
        deleteCloth()
        var subCatId = 0
        for document in querySnapshot.documents {
            let clothData = document.data()
            // Create a new ClothData object and set its properties
            guard let clothDataObject = NSEntityDescription.insertNewObject(forEntityName: "ClothData", into: context) as? ClothData else {
                fatalError("Failed to create ClothData object.")
            }
            // Set the values for the ClothData object
            clothDataObject.imageUrl = clothData["clothImage"] as? String
            clothDataObject.clothId = clothData["id"] as? String
            subCatId = clothData["idSubCategory"] as! Int
            clothDataObject.subCatId = String(subCatId)
            clothDataObject.userId = clothData["userId"] as? String
            // Download the cloth image from Firebase Storage
            if let imageUrl = clothDataObject.imageUrl, let url = URL(string: imageUrl) {
                let request = URLRequest(url: url)
                do {
                    let (data, _) = try await URLSession.shared.data(for: request)
                    clothDataObject.clothImage = data
                    print("Cloth image downloaded and assigned successfully.")
                } catch {
                    print("Failed to download cloth image: \(error.localizedDescription)")
                }
            }
        }
        //     Save the changes to Core Data
        do {
            try context.save()
            print("Cloth data saved successfully.")
        } catch {
            print("Failed to save cloth data: \(error.localizedDescription)")
        }
    }
}
