//
//  Cloth.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 2.05.2023.
//
import Foundation
import SwiftUI
 
struct Cloth: Identifiable {
    
    let id = UUID()
    let idSubCategory : String
    var color : String
    var product_id : String // dışarı yönlendirme
    var url : String // site urlsi
    var clothImage : String
    var size : String
    var createdAt : Date
    var userId : Int
}

