//
//  MockData.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 2.05.2023.
//

import Foundation

struct MockData {
    

    
    
    var users: [User] = [
        User(name: "Rabia Abdioğlu", userName: "@rabiabdglu", userImage: "user_1", privacy: false, hasFollowed: true, isMe: true, followers: 10, following: 22),
    
    
        User(name: "Enes Tuğberk Kılıç", userName: "@enesraf", userImage: "user_2", privacy: false, hasFollowed: true, isMe: false, followers: 10, following: 22),
        
    
        User(name: "Semiha Arslan Abdioğlu", userName: "@semihanim", userImage: "user_3", privacy: true, hasFollowed: true, isMe: false, followers: 10, following: 22),
        
    
        User(name: "Yusuf Emre Abdioğlu", userName: "@emredersin", userImage: "user_4", privacy: false, hasFollowed: false, isMe: false, followers: 10, following: 22),
        
    
        User(name: "Emirhan Çağlar", userName: "@emirhanim", userImage: "user_5", privacy: false, hasFollowed: true, isMe: false, followers: 10, following: 22),
        
    
    
        User(name: "Enes Tuğberk Kılıç", userName: "@enesraf", userImage: "user_2", privacy: false, hasFollowed: true, isMe: false, followers: 10, following: 22),
        
    
        User(name: "Semiha Arslan Abdioğlu", userName: "@semihanim", userImage: "user_3", privacy: true, hasFollowed: true, isMe: false, followers: 10, following: 22),
        
    
        User(name: "Yusuf Emre Abdioğlu", userName: "@emredersin", userImage: "user_4", privacy: false, hasFollowed: false, isMe: false, followers: 10, following: 22),
        
    
        User(name: "Emirhan Çağlar", userName: "@emirhanim", userImage: "user_5", privacy: false, hasFollowed: true, isMe: false, followers: 10, following: 22),
        
    
    
        User(name: "Enes Tuğberk Kılıç", userName: "@enesraf", userImage: "user_2", privacy: false, hasFollowed: true, isMe: false, followers: 10, following: 22),
        
    
        User(name: "Semiha Arslan Abdioğlu", userName: "@semihanim", userImage: "user_3", privacy: true, hasFollowed: true, isMe: false, followers: 10, following: 22),
        
    
        User(name: "Yusuf Emre Abdioğlu", userName: "@emredersin", userImage: "user_4", privacy: false, hasFollowed: false, isMe: false, followers: 10, following: 22),
        
    
        User(name: "Emirhan Çağlar", userName: "@emirhanim", userImage: "user_5", privacy: false, hasFollowed: true, isMe: false, followers: 10, following: 22),
        
        
        
        User(name: "Enes Tuğberk Kılıç", userName: "@enesraf", userImage: "user_2", privacy: false, hasFollowed: true, isMe: false, followers: 10, following: 22),
        
    
 
    
    ]
    
    
    var cloths: [Cloth] = [
        Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1),
        Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 2),
        Cloth(idSubCategory: "2", color: "white", product_id: "", url: "", clothImage: "dress", size: "s", createdAt: Date.now, userId: 3),
        Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now,  userId: 4),
        Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now,  userId: 5),
        Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now,  userId: 0),
        Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now,userId: 1)
        
        
 ]
    
    var combines: [Combine]=[
     
        Combine(top: Cloth(idSubCategory: "1", color: "black", product_id: "id", url: "url", clothImage: "empty", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "empty", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "4", color: "white", product_id: "", url: "", clothImage: "empty", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "5", color: "black", product_id: "", url: "", clothImage: "empty", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "6", color: "blue", product_id: "", url: "", clothImage: "empty", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "7", color: "black", product_id: "", url: "", clothImage: "empty", size: "", createdAt: Date.now, userId: 1), userId: 1),
        
        Combine(top: Cloth(idSubCategory: "1", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "4", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "5", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "6", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "7", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1),
        Combine(top: Cloth(idSubCategory: "1", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "3", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "4", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "5", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "6", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "7", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1),
        Combine(top: Cloth(idSubCategory: "1", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "3", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "4", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "5", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "6", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "7", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1)
        
    ]
    
    
    
    var posts: [CombinePost] = [
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", isLiked : false, description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 2),
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", isLiked : true , description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 0),
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20" , isLiked : true, description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 3),
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20",  isLiked : true, description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20",  isLiked : true, description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        CombinePost(combine: Combine(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1)
        
    
        
      

]
    
    
    
    var categorys: [Category] = [
    
        Category(catName: "Top"),
        Category(catName: "Bottom"),
        Category(catName: "Dress"),
        Category(catName: "Shoe"),
        Category(catName: "Bag"),
        Category(catName: "Outwear"),
        Category(catName: "Accessory")
        ]
        
    var subCategorys: [subCategory] = [
    
        subCategory(catId:Category(catName:  "Top"),subCatName: "tshirt"),
        subCategory(catId: Category(catName: "Bottom"),subCatName: "jogger"),
        subCategory(catId: Category(catName: "Dress"),subCatName: "dress"),
        subCategory(catId: Category(catName: "Shoe"),subCatName: "sportshoe"),
        subCategory(catId: Category(catName: "Bag"),subCatName: "fannybag"),
        subCategory(catId: Category(catName: "Outwear"),subCatName: "jacket"),
        subCategory(catId: Category(catName: "Accessory"),subCatName: "hat")
        ]
        

    var savedCloth : [Inspiration] = [
    
        Inspiration(userId: 0, savedCombinesId: [0,1,2]),
        Inspiration(userId: 1, savedCombinesId: [3,4,5]),
        Inspiration(userId: 2, savedCombinesId: [0,1,3]),
        Inspiration(userId: 3, savedCombinesId: [0,2,4]),
        Inspiration(userId: 4, savedCombinesId: [0,1,2]),
        Inspiration(userId: 5, savedCombinesId: [0,1,2])

    
    ]
            
}
