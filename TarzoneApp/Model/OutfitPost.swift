//
//  CombinePost.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import Foundation


struct OutfitPost: Identifiable{
    
    var id : String
    var outfit : Outfit
    var likes : Int
    var isLiked : Bool = false
    var description : String
    var season : Seasons?
    var userId : String
    var savedBy : [String]
    
}
enum Seasons: String {
    case Spring_Summer = "Spring/Summer"
    case Fall_Winter = "Fall/Winter"
    case Resort = "Resort"
    case Pre_Fall = "Pre-Fall"
    case Other = "Other"
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
        
    case .Other:
        return "Other"
    }}
    
    

