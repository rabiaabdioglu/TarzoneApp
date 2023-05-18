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
    var likes : String
    var isLiked : Bool = false
    var description : String
    var season : Seasons
    var hashtag :  [String]
    var userId : Int
    
}
enum Seasons {
    case Spring_Summer
    case Fall_Winter
    case Resort
    case Pre_Fall
}

func seasonToString(_ season: Seasons) -> String {
    switch season {
    case .Spring_Summer:
        return "Spring/Summer"
    case .Fall_Winter:
        return "Fall/Winter"
    case .Resort:
        return "Resort"
    case .Pre_Fall:
        return "Pre-Fall"
    }
    
    
}
