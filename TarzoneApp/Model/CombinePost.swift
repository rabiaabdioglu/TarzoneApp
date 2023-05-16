//
//  CombinePost.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import Foundation


struct CombinePost: Identifiable {
    
    let id = UUID()
    let combine : Combine
    let likes : String
    let isLiked : Bool = false
    var description : String
    var season : Seasons
    var hashtag :  [String]
}
enum Seasons {
    case Spring_Summer
    case Fall_Winter
    case Resort
    case Pre_Fall
}

