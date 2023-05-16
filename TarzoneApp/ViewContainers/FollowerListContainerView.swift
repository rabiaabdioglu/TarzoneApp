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


struct FollowerListContainerView: View {
    var user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.vertical, showsIndicators: false){

            ForEach(MockData().users, id: \.id) { user in
                HStack {
                        FollowView(user: user)
                    }
              
                }
            }
        }

        
        
    }
}

struct FollowerListContainerView_Previews: PreviewProvider {
    static var previews: some View {
        FollowerListContainerView(user: MockData().users[1])
    }
}
