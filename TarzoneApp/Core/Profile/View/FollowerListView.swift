//
//  FollowerListContainerView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//
//
//  FollowView.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 11.05.2023.
//

import Foundation
import SwiftUI


struct FollowerListView: View {
    var user: User
    var pageName = "Followers"
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {

            VStack(alignment: .leading) {
                ScrollView(.vertical, showsIndicators: false){
                    
                    ForEach(MockData().users, id: \.id) { user in
                        HStack {
                            FollowView(user: user)
                        }
                        
                    }
                }
                .padding()
                
                }
                .font(Font.custom("HelveticaNeue-Light", size: 15))
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle(pageName, displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: backButton)
        
              }
          }

          var backButton: some View {
              Button(action: {
                  presentationMode.wrappedValue.dismiss()
              }) {
                  Image(systemName: "chevron.left")
                      .imageScale(.large)
                      .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
              }
          
    }
}

struct FollowerListView_Previews: PreviewProvider {
    static var previews: some View {
        FollowerListView(user: MockData().users[1])
    }
}
