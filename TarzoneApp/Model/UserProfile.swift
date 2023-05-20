//
//  userProfile.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 2.05.2023.
//

import Foundation

struct userProfile: Identifiable {
    
    let id = UUID()
    var user : User
    var followersId : [String]
    var followedId  : [String]
    let description : String
    var outfitPosts: [OutfitPost]
    
    
}
