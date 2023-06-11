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
            if user.id == "0" {
                //tabbar geçişi için
            } else {
                isProfileActive = true
            }
        }) {
            HStack {
                CircularProfileImageView(user: user)
                VStack(alignment: .leading) {
                    Text(user.name ?? "User Name")
                        .font(Font.custom("HelveticaNeue", size: UIScreen.screenWidth * 0.03))
                        .padding(0.1)
                        .foregroundColor(.black)
                    Text("@" + user.userName )
                        .font(Font.custom("HelveticaNeue-Light", size: UIScreen.screenWidth * 0.025))
                        .padding(0.1)
                        .foregroundColor(.black)
                }
            }
        }
        .padding(.trailing, 1)
        .fullScreenCover(isPresented: $isProfileActive, content: {
            if  user.isCurrentUser == true{
                CurrentUser(user: user)
                .edgesIgnoringSafeArea(.all)}
            else{
                ProfileView(user: user)
                .edgesIgnoringSafeArea(.all)}
        })
    }
}
