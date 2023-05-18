//
//  UserProfile.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI

struct UserProfileView: View {
    var user: User
    @Environment(\.presentationMode) var presentationMode

    @State private var isProfileActive = false
    
    
    var body: some View {
        
        Button(action: {
            if user.isMe {
            //tabbar geçişi için
                
            } else {
                isProfileActive = true
            }
        }) {
            HStack {
                Image(user.userImage)
                    .resizable()
                    .cornerRadius(100)
                    .frame(width: UIScreen.screenWidth * 0.13, height: UIScreen.screenWidth * 0.13, alignment: .center)
                    .clipped() 
                    .padding(.leading, 5)
                
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(Font.custom("HelveticaNeue", size: 13))
                        .padding(0.1)
                        .foregroundColor(.black)

                    Text(user.userName)
                        .font(Font.custom("HelveticaNeue-Light", size: 11))
                        .padding(0.1)
                        .foregroundColor(.black)

                }
            }
        }
        .padding(.trailing, 1)
        .fullScreenCover(isPresented: $isProfileActive, content: {
            
            ProfileView(user: user)
                .edgesIgnoringSafeArea(.all)
            
            
        })
        
        
    }
    

    struct UserProfileView_Previews: PreviewProvider {
        static var previews: some View {
            UserProfileView(user: MockData().users[0])
        }
    }
}



