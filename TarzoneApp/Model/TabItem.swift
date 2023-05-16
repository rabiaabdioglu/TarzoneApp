//
//  Tabbar.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 11.05.2023.
//

import Foundation
struct  TabItem : Hashable{
    
    let tabImage : String
    let tabName  : String
    let tabItems : TabItems
    
    enum TabItems{
        
        case timeline
        case inspiration
        case scanCloth
        case combineLab
        case profile
    }
}
