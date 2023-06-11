//
//
//  FollowViewModel.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 11.06.2023.
//

import Foundation
import Firebase
import SwiftUI

class FollowViewModel: ObservableObject{
    @Published var following = 0
    @Published var followers = 0
    @Published var followCheck = false
    @Published var followerUsersList: [User] = []
    @Published var followingUsersList: [User] = []
    static var userIds: [String] = []
    static var following =  Firestore.firestore().collection("following")
    static var followers =  Firestore.firestore().collection("followers")
    static func followingCollection(userId: String) -> CollectionReference {
        return following.document(userId).collection("following")
    }
    static func followersCollection(userId: String) -> CollectionReference {
        return followers.document(userId).collection("followers")
    }
    static func followingId(userId: String) -> DocumentReference {
        return following.document(Auth.auth().currentUser!.uid).collection("following").document(userId)
    }
    static func followersId(userId: String) -> DocumentReference {
        return followers.document(userId).collection("followers").document(Auth.auth().currentUser!.uid)
    }
    func followState(userId : String){
        FollowViewModel.followingId(userId: userId).getDocument{ [self]
            (document,error) in
            if let doc = document , doc.exists{
                self.followCheck = true
            }
            else{
                self.followCheck = false
            }
        }
    }
    // MARK: Get follow information for profile views
    func follows(userId : String){
        FollowViewModel.followingCollection(userId: userId).getDocuments{
            (querysnapshot,error) in
            if let doc = querysnapshot?.documents {
                FollowViewModel.userIds.removeAll()
                self.following = doc.count
                for document in doc {
                    let followingUserId = document.documentID
                    if userId != followingUserId {
                        FollowViewModel.userIds.append(followingUserId)
                    }
                }
            }
        }
        if  !FollowViewModel.userIds.isEmpty {
            getUser(ListType: "Following")
        }
    }
    func followers(userId : String){
        FollowViewModel.followersCollection(userId: userId).getDocuments{
            (querysnapshot,error) in
            if let doc = querysnapshot?.documents {
                FollowViewModel.userIds.removeAll()
                self.followers = doc.count
                for document in doc {
                    let followerUserId = document.documentID
                    FollowViewModel.userIds.append(followerUserId)
                }
            }
        }
        if  !FollowViewModel.userIds.isEmpty {
            getUser(ListType: "Follower")
        }
    }
    // MARK: FollowService
    func updateFollowCount(userId: String, followingCount: @escaping(_ followingCount: Int)-> Void, followersCount: @escaping(_ followersCount: Int)-> Void){
        FollowViewModel.followingCollection(userId: userId).getDocuments{
            (snap, error) in
            if let doc = snap?.documents{
                followingCount(doc.count)
            }
        }
        FollowViewModel.followersCollection(userId: userId).getDocuments{
            (snap, error) in
            if let doc = snap?.documents{
                followersCount(doc.count)
            }
        }
    }
    func manageFollow(userId: String, followCheck: Bool, followingCount: @escaping(_ followingCount: Int)-> Void, followersCount: @escaping(_ followersCount: Int)-> Void){
        if !followCheck{
            follow(userId: userId, followingCount: followingCount, followersCount: followersCount)
        }
        else {
            unfollow(userId: userId, followingCount: followingCount, followersCount: followersCount)
        }
    }
    // MARK: Follow and Unfollow process
    func follow(userId: String, followingCount: @escaping(_ followingCount: Int)-> Void, followersCount: @escaping(_ followersCount: Int)-> Void){
        FollowViewModel.followingId(userId: userId).setData([:]){
            (error) in
            if error == nil {
                self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
            }
        }
        FollowViewModel.followersId(userId: userId).setData([:]){
            (error) in
            if error == nil {
                self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
            }
        }
    }
    func unfollow(userId: String, followingCount: @escaping(_ followingCount: Int)-> Void, followersCount: @escaping(_ followersCount: Int)-> Void){
        FollowViewModel.followingId(userId: userId).getDocument{
            (document , error) in
            if let doc = document, doc.exists{
                doc.reference.delete()
                self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
            }
        }
        FollowViewModel.followersId(userId: userId).getDocument{
            (document , error) in
            if let doc = document, doc.exists{
                doc.reference.delete()
                self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
            }
        }
    }
    func formatNumber(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        if number >= 1_000_000_000 {
            let formattedNumber = Double(number) / 1_000_000_000.0
            formatter.positiveSuffix = "B"
            return formatter.string(from: NSNumber(value: formattedNumber)) ?? ""
        } else if number >= 1_000_000 {
            let formattedNumber = Double(number) / 1_000_000.0
            formatter.positiveSuffix = "M"
            return formatter.string(from: NSNumber(value: formattedNumber)) ?? ""
        } else if number >= 1_000 {
            let formattedNumber = Double(number) / 1_000.0
            formatter.positiveSuffix = "K"
            return formatter.string(from: NSNumber(value: formattedNumber)) ?? ""
        }
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
    // MARK: Get user for follow list
    func getUser(ListType: String) {
        let userIdsToFetch = FollowViewModel.userIds
        Firestore.firestore().collection("users").whereField("id", in: userIdsToFetch).getDocuments { [self] (querySnapshot, error) in
            if let error = error {
                print("Error fetching users: \(error)")
                return
            }
            var userList: [User] = []
            for document in querySnapshot!.documents {
                let user = document.data()
                let id = user["id"] as? String
                let userName = user["userName"] as? String
                let name = user["name"] as? String
                let userImage = user["userImage"] as? String
                let privacy = user["privacy"] as? Bool
                let description = user["description"] as? String
                let userObject = User(id: id ?? "", userName: userName ?? "", name: name, userImage: userImage, privacy: privacy, description: description)
                userList.append(userObject)
            }
            DispatchQueue.main.async { [self] in
                if ListType == "Following" {
                    followingUsersList = userList
                } else if ListType == "Follower"{
                    followerUsersList = userList
                }
            }
        }
    }
}
