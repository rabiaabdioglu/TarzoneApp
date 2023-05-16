//
//  UserProfile.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI

struct UserProfileView: View {
    
    var user : User
    var body: some View {
        
        HStack {
            
            Image(user.userImage)
                .resizable()
                .cornerRadius(100)
                .frame(width: UIScreen.screenWidth * 0.13, height:  UIScreen.screenWidth * 0.13, alignment: .center)
                .clipped()
                .padding(.leading , 5)
            
            VStack (alignment: .leading){
                
                Text(user.name)
                    .font(Font.system(size: 12, weight: .semibold))
                    .padding(0.1)
                Text(user.userName)
                    .font(Font.system(size: 12, weight: .semibold))
                    .padding(0.1)

            }
        }
        .padding(.trailing , 1)
        
    }
    
    struct UserProfileView_Previews: PreviewProvider {
        static var previews: some View {
            UserProfileView(user: MockData().users[1])
        }
    }
}
