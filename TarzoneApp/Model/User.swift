//
//  User.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 2.05.2023.
//

import Foundation


struct User: Identifiable {

    let id = UUID()
    var name : String
    var userName : String
    var userImage : String
    var privacy : Bool = true
    var hasFollowed : Bool = false
    var isMe : Bool = false

    
    
    
}
