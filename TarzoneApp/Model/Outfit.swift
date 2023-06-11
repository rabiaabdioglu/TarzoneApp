//
//  Combine.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 2.05.2023.
//


import Foundation

struct Outfit: Identifiable , Encodable, Decodable , Hashable{
    //CLOTHS İD
    var id : String
    var top : String
    var bottom : String
    var fullbody : String
    var shoe : String
    var bag : String
    var outwear : String
    var accessory : String
    var userId : String
    

}
