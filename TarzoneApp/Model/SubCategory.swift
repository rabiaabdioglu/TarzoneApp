//
//  SubCategory.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 2.05.2023.
//

import Foundation


struct subCategory: Identifiable {
    
    let id = UUID()
    let catId : Category
    let subCatName : String
    
}
