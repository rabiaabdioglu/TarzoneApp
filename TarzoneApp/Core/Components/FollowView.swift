//
//  FollowView.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 11.05.2023.
//

import Foundation
import SwiftUI
import Firebase

struct FollowView: View {
    var user: User
    @StateObject private var followViewModel =  FollowViewModel()
    var isCurrentUser: Bool {
        user.id == Auth.auth().currentUser?.uid
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                UserProfileView(user: user)
                    .disabled(isCurrentUser)
                Spacer()
                if !isCurrentUser {
                    Spacer()
                    FollowButton(user: user, followCheck: $followViewModel.followCheck, followingCount: $followViewModel.following, followersCount: $followViewModel.followers)
                        .frame(width: UIScreen.screenWidth * 0.30 , height: UIScreen.screenHeight * 0.04, alignment: .leading)
                        .cornerRadius(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.blue, lineWidth: 0.5)
                        )
                        .padding(.trailing , 2)
                    Spacer()
                }
            }
            .padding(.all, UIScreen.screenHeight * 0.003)
        }
        .padding(.all, UIScreen.screenWidth * 0.003)
    }
}
