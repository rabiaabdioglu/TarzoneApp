//
//  User.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 2.05.2023.
//

import Foundation


struct User: Identifiable ,Codable{

    let id : String
    let email : String
    var userName : String
    var name : String?
    var userImage : String?
    var privacy : Bool? = true
    var hasFollowed : Bool? = false
    var followers : Int32? = 0
    var following : Int32? = 0
    
    
    
}

extension User{
    
    static var MOCK_USERS:[User]=[
        .init(id: NSUUID().uuidString, email: "r@gmail.com", userName: "@rabiabdglu", name: "Rabia Abdioğlu", userImage: "user_1", privacy: false, hasFollowed: true, followers: 10, following: 22),
        
            .init(id: NSUUID().uuidString, email:   "r@gmail.com",userName: "@enesraf", name: "Enes Tuğberk Kılıç", userImage: "user_2", privacy: false, hasFollowed: true, followers: 10, following: 22),
            
        
            .init(id: NSUUID().uuidString, email:   "r@gmail.com",userName: "@semihanim", name: "Semiha Arslan Abdioğlu", userImage: "user_3", privacy: true, hasFollowed: true, followers: 10, following: 22),
            
        
            .init(id: NSUUID().uuidString, email:   "r@gmail.com",userName: "@emredersin", name: "Yusuf Emre Abdioğlu", userImage: "user_4", privacy: false, hasFollowed: false,  followers: 10, following: 22),
            
        
            .init(id: NSUUID().uuidString, email:   "r@gmail.com",userName: "@emirhanim", name: "Emirhan Çağlar", userImage: "user_5", privacy: false, hasFollowed: true,  followers: 10, following: 22)
            
        
        
    
    ]
    
}
