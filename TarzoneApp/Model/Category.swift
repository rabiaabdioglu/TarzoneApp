//
//  Category.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 2.05.2023.
//

import Foundation


struct Category: Identifiable {
    let id : Int
    let name: String
    let subcategories: [Subcategory]
}
