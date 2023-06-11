//
//  User.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 2.05.2023.
//

import Foundation
import Firebase

struct User: Identifiable ,Codable{

    let id : String
    var email : String?
    var userName : String
    var name : String?
    var userImage : String?
    var privacy : Bool? = true
    var hasFollowed : Bool? = false
    var followers : Int32? = 0
    var following : Int32? = 0
    var postCount : Int32? = 0
    var description :String?
    var isCurrentUser: Bool{
        
        
        guard let currentUid = Auth.auth().currentUser?.uid else{ return false}
        return currentUid == id
        
    }
    
}

