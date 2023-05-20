//
//  FollowView.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 11.05.2023.
//

import Foundation
import SwiftUI


struct FollowView: View {
    var user: User
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
                HStack {
                    
                    UserProfileView(user: user)
                    Spacer()

                    Button(action: {
                        // Eylem
                    }) {
                        HStack {
                            Spacer()
                            Text(user.hasFollowed!  ? " Follow " : " Unfollow ")
                                .font(Font.system(size: UIScreen.screenWidth * 0.020, weight: .semibold))
                                .foregroundColor(user.hasFollowed! ? Color.blue : Color.white)
                                .clipped()
                            Spacer()
                        }
                    }
                    .padding()
                    .background(user.hasFollowed! ? Color.white : Color.blue)
                    .frame(width: UIScreen.screenWidth * 0.30 , height: UIScreen.screenHeight * 0.04, alignment: .center)
                    .clipped()
                    .cornerRadius(6)
                    .border(user.hasFollowed! ? Color.blue : Color.white, width: 0.5)
                    
                }
            
            
                .padding(.all, UIScreen.screenHeight * 0.003)
            }
        .padding(.all, UIScreen.screenWidth * 0.003)
        }
       

        
        
    
}

struct FollowView_Previews: PreviewProvider {
    static var previews: some View {
        FollowView(user: MockData().users[2])
    }
}
