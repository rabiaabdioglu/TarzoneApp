//
//  TabContainerViewModel.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 11.05.2023.
//

import Foundation

final class TabContainerViewModel : ObservableObject{
    
    @Published var selectedTab: TabItem.TabItems = .timeline
    
    let tabItemViewModels = [
        TabItem(tabImage: "timeline", tabName: "Timeline", tabItems: .timeline),
        .init(tabImage: "inspiration", tabName: "Saved", tabItems: .inspiration),
        .init(tabImage: "scanCloth", tabName: "Scan", tabItems: .scanCloth),
        .init(tabImage: "combineLab", tabName: "Combine", tabItems: .combineLab),
        .init(tabImage: "profile", tabName: "Profile", tabItems: .profile)

    
    
    ]
    
    
}
