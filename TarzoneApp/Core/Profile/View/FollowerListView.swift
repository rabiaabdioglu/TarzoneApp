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
import Firebase

struct FollowerListView: View {
    var user: User
    var pageName = "Followers"
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var followViewModel =  FollowViewModel()
    var isCurrentUser: Bool {
        user.id == Auth.auth().currentUser?.uid
    }
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ScrollView(.vertical, showsIndicators: false){
                    if !followViewModel.followingUsersList.isEmpty && pageName == "Following" {
                        ForEach(followViewModel.followingUsersList, id: \.id) { user in
                            HStack {
                                FollowView(user: user)
                            }
                        }
                    } else if !followViewModel.followerUsersList.isEmpty && pageName == "Follower" {
                        ForEach(followViewModel.followerUsersList, id: \.id) { user in
                            HStack {
                                FollowView(user: user)
                            }
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
        .onAppear() {
            if pageName == "Following" {
                followViewModel.follows(userId: user.id)
            } else if pageName == "Follower" {
                followViewModel.followers(userId: user.id)
            }
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
