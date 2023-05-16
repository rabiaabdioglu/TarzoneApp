//
//  TabbarView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI



struct TabbarView: View {
@State private var tabContainerViewModels = TabContainerViewModel()

var body: some View {
   
    // Tab bar çerçevesi
            
           VStack{
           

        TabView(selection: $tabContainerViewModels.selectedTab) {
            
           ForEach(tabContainerViewModels.tabItemViewModels, id: \.self) { viewModel in
               tabView(for: viewModel.tabItems)
               
               
                   .tabItem {
                    
                       Image(  viewModel.tabImage)
                           
                       Text(viewModel.tabName)

                   }

               
                       .tag(viewModel.tabItems)

           }
        }
        .accentColor(.teal)
            }

    
}

@ViewBuilder
func tabView(for tabItemType: TabItem.TabItems) -> some View {
    switch tabItemType {
    case .timeline:
        TimeLineContainerView()
    case .inspiration:
        Text("Saved")
    case .scanCloth:
        Text("Scan")
    case .combineLab:
        Text("Combine")
    case .profile:
        FollowerListContainerView(user: MockData().users[1])    }
}
}

struct TabbarView_Previews: PreviewProvider {
static var previews: some View {
    TabbarView()
    
}
}
