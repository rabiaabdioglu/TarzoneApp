//
//  Combine.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 2.05.2023.
//


import Foundation

struct Outfit: Identifiable {
    
    let id = UUID()
    var top : Cloth
    var bottom : Cloth
    var dress : Cloth
    var shoe : Cloth
    var bag : Cloth
    var outwear : Cloth
    var accessory : Cloth
    var userId : Int


}
