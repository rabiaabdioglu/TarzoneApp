//
//  MockData.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 2.05.2023.
//

import Foundation
import Firebase
struct MockData {
   
    let categories: [Category] = [
       Category( id: 0, name: "Accessory", subcategories: [
           Subcategory( id: 0, name: "Belt"),
           Subcategory( id: 1, name: "Beret"),
           Subcategory( id: 2, name: "Bow"),
           Subcategory( id: 3, name: "Brooch"),
           Subcategory( id: 4, name: "Glasses"),
           Subcategory( id: 5, name: "Gloves"),
           Subcategory( id: 6, name: "Hair"),
           Subcategory( id: 7, name: "Hat"),
           Subcategory( id: 8, name: "Hijab"),
           Subcategory( id: 9, name: "Jewelry"),
           Subcategory( id: 10, name: "Scarf"),
           Subcategory( id: 11, name: "Socks"),
           Subcategory( id: 12, name: "Ties"),
           Subcategory( id: 13, name: "Watch")
        ]),
       Category( id: 1, name: "Bag", subcategories: [
           Subcategory( id: 14, name: "Backpack"),
           Subcategory( id: 15, name: "Beach"),
           Subcategory( id: 16, name: "Fanny"),
           Subcategory( id: 17, name: "Mailman"),
           Subcategory( id: 18, name: "Portfolio"),
           Subcategory( id: 19, name: "Sleeve"),
           Subcategory( id: 20, name: "Sports"),
           Subcategory( id: 21, name: "Strap"),
           Subcategory( id: 22, name: "Wallet")
        ]),
       Category( id: 2, name: "Bottom", subcategories: [
           Subcategory( id: 23, name: "Bikini"),
           Subcategory( id: 24, name: "Capri"),
           Subcategory( id: 25, name: "Capris"),
           Subcategory( id: 26, name: "Culottes"),
           Subcategory( id: 27, name: "Cutoffs"),
           Subcategory( id: 28, name: "Jean"),
           Subcategory( id: 29, name: "Jeans"),
           Subcategory( id: 30, name: "Jeggings"),
           Subcategory( id: 31, name: "Joggers"),
           Subcategory( id: 32, name: "Leggings"),
           Subcategory( id: 33, name: "Mini"),
           Subcategory( id: 34, name: "Pantolon"),
           Subcategory( id: 35, name: "Pants"),
           Subcategory( id: 36, name: "Salopet"),
           Subcategory( id: 37, name: "Sarong"),
           Subcategory( id: 38, name: "Shorts"),
           Subcategory( id: 39, name: "Skirt"),
           Subcategory( id: 40, name: "Skort"),
           Subcategory( id: 41, name: "Sweatpants"),
           Subcategory( id: 42, name: "Sweatshorts"),
           Subcategory( id: 43, name: "SwimTrunks"),
           Subcategory( id: 44, name: "Tights")
        ]),
       Category( id: 3, name: "FullBody", subcategories: [
           Subcategory( id: 45, name: "Abaya"),
           Subcategory( id: 46, name: "Dress"),
           Subcategory( id: 47, name: "Jumpsuit"),
           Subcategory( id: 48, name: "Onesie"),
           Subcategory( id: 49, name: "Romper"),
           Subcategory( id: 50, name: "Swimsuit")
        ]),
       Category( id: 4, name: "Outwear", subcategories: [
           Subcategory( id: 51, name: "Anorak"),
           Subcategory( id: 52, name: "Blazer"),
           Subcategory( id: 53, name: "Caftan"),
           Subcategory( id: 54, name: "Cardigan"),
           Subcategory( id: 55, name: "Coat"),
           Subcategory( id: 56, name: "Jacket"),
           Subcategory( id: 57, name: "Kaban"),
           Subcategory( id: 58, name: "Kimono"),
           Subcategory( id: 59, name: "Parka"),
           Subcategory( id: 60, name: "Peacoat"),
           Subcategory( id: 61, name: "Poncho"),
           Subcategory( id: 62, name: "RainCoat"),
           Subcategory( id: 63, name: "Robe"),
           Subcategory( id: 64, name: "TrenchCoat"),
           Subcategory( id: 65, name: "Vest")
        ]),
       Category( id: 5, name: "Shoe", subcategories: [
           Subcategory( id: 66, name: "Babet"),
           Subcategory( id: 67, name: "Boots"),
           Subcategory( id: 68, name: "Espadril"),
           Subcategory( id: 69, name: "Heels"),
           Subcategory( id: 70, name: "Loafer"),
           Subcategory( id: 71, name: "Outdoor"),
           Subcategory( id: 72, name: "Oxford"),
           Subcategory( id: 73, name: "Sandals"),
           Subcategory( id: 74, name: "Slippers"),
           Subcategory( id: 75, name: "Sports")
        ]),
       Category( id: 6, name: "Top", subcategories: [
           Subcategory( id: 76, name: "Atlet"),
           Subcategory( id: 77, name: "Bikini"),
           Subcategory( id: 78, name: "Blouse"),
           Subcategory( id: 79, name: "Bustier"),
           Subcategory( id: 80, name: "Cutoffs"),
           Subcategory( id: 81, name: "Henley"),
           Subcategory( id: 82, name: "Hoodie"),
           Subcategory( id: 83, name: "Shirt"),
           Subcategory( id: 84, name: "Sweater"),
           Subcategory( id: 85, name: "Sweatshirt"),
           Subcategory( id: 86, name: "Tank"),
           Subcategory( id: 87, name: "Tee"),
           Subcategory( id: 88, name: "Top"),
           Subcategory( id: 89, name: "Tshirt"),
           Subcategory( id: 90, name: "Tunic")
        ])
    ]
    
}
