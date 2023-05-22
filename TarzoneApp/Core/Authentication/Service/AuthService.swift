//
//  AuthService.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 19.05.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase
class AuthService{
    
    @Published var userSession : FirebaseAuth.User?
    @Published var currentUser : User?
    static let shared = AuthService()
    
    init(){
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
        guard let currenyUid = self.userSession?.uid else{return}
        let snapshot = try await Firestore.firestore().collection("users").document(currenyUid).getDocument()
        print( "DEBUG: Snapshot data \(String(describing: snapshot.data()))")

        self.currentUser = try? snapshot.data(as: User.self)
        
        
    }
    
    
    func signOut() {
        
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    private func uploadUserData(uid: String, username: String, email: String) async{
        
        let user = User(id: uid, email: email, userName: username)
        self.currentUser = user
        guard let ecodedUser = try? Firestore.Encoder().encode(user) else{ return  }
           
        try? await Firestore.firestore().collection("users").document(user.id).setData(ecodedUser)
        
    }
    
        
    
}
