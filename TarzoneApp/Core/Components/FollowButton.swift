//
//  FollowButton.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 11.06.2023.
//

import SwiftUI

struct FollowButton: View {
    @ObservedObject var followViewModel = FollowViewModel()
    var user: User
    @Binding var followingCount: Int
    @Binding var followersCount: Int
    @Binding var followCheck: Bool
    init(user: User, followCheck: Binding<Bool>, followingCount: Binding<Int>, followersCount: Binding<Int>) {
        self.user = user
        self._followCheck = followCheck
        self._followingCount = followingCount
        self._followersCount = followersCount
    }
    func follow() {
        if !self.followCheck {
            followViewModel.follow(userId: user.id, followingCount: { (followingCount) in
                self.followingCount = followingCount
            }, followersCount: { (followersCount) in
                self.followersCount = followersCount
            })
            self.followCheck = true
        } else {
            followViewModel.unfollow(userId: user.id, followingCount: { (followingCount) in
                self.followingCount = followingCount
            }, followersCount: { (followersCount) in
                self.followersCount = followersCount
            })
            self.followCheck = false
        }
    }
    var body: some View {
        Button(action: follow) {
            Text(self.followCheck ? "Unfollow" : "Follow")
                .font(Font.system(size: UIScreen.screenWidth * 0.020, weight: .semibold))
                .foregroundColor(self.followCheck ? Color.blue : Color.white)
                .clipped()
        }
        .padding()
        .frame(width: UIScreen.screenWidth * 0.30 , height: UIScreen.screenHeight * 0.04, alignment: .center)
        .background(self.followCheck ? Color.white : Color.blue)
        .cornerRadius(6)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.blue, lineWidth: 0.5)
        )
    }
}
