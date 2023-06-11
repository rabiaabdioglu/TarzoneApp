//
//  Cloth.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 2.05.2023.
//
import Foundation
import SwiftUI
 import Firebase
struct Cloth: Identifiable , Encodable , Hashable , Decodable{
    
    var id : String
    var userId : String
    var idCategory : Int
    var idSubCategory : Int
    var color : String
    var url : String // site urlsi
    var clothImage : String
    var size : String
    var createdAt : Timestamp
    var hashtags: [String]
    
    
}

