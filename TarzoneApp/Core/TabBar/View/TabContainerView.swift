//
//  TabbarView.swift
//  Tarzone
//

//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI



struct TabbarView: View {
    
@State private var tabContainerViewModels = TabContainerViewModel()
@State private var selectedTab: TabItem.TabItems = .timeline // Default tab
    let user :User

var body: some View {
    
        TabView(selection: $tabContainerViewModels.selectedTab) {
            
           ForEach(tabContainerViewModels.tabItemViewModels, id: \.self) { viewModel in
               tabView(for: viewModel.tabItems)
               
                   .tabItem {
                    
                       Image(viewModel.tabImage)
                           
                       Text(viewModel.tabName)

                   }         .tag(viewModel.tabItems)
               

           }
        }
        .accentColor(.teal)
          
}

@ViewBuilder
func tabView(for tabItemType: TabItem.TabItems) -> some View {
    
    switch tabItemType {
    case .timeline:
        TimeLineView()
    case .inspiration:
        SavedOutfitView()
    case .scanCloth:
        ScanClothView()
    case .outfitLab:
        CreateOutfitView()
    case .profile:
        CurrentUser(user: user)    }
}
    
    
    
}

struct TabbarView_Previews: PreviewProvider {
static var previews: some View {
    TabbarView(user : MockData().users[0])
    
}
}
