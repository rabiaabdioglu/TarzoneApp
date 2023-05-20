//
//  MockData.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 2.05.2023.
//

import Foundation

struct MockData {
    

    
    
    var users: [User] = [
        User(id: NSUUID().uuidString, email: "r@gmail.com", userName: "@rabiabdglu", name: "Rabia Abdioğlu", userImage: "user_1", privacy: false, hasFollowed: true,  followers: 10, following: 22),
    
    
        User(id: NSUUID().uuidString, email:   "r@gmail.com",userName: "@enesraf", name: "Enes Tuğberk Kılıç", userImage: "user_2", privacy: false, hasFollowed: true,  followers: 10, following: 22),
        
    
        User(id: NSUUID().uuidString, email:   "r@gmail.com",userName: "@semihanim", name: "Semiha Arslan Abdioğlu", userImage: "user_3", privacy: true, hasFollowed: true,  followers: 10, following: 22),
        
    
        User(id: NSUUID().uuidString, email:   "r@gmail.com",userName: "@emredersin", name: "Yusuf Emre Abdioğlu", userImage: "user_4", privacy: false, hasFollowed: false, followers: 10, following: 22),
        
    
        User(id: NSUUID().uuidString, email:   "r@gmail.com",userName: "@emirhanim", name: "Emirhan Çağlar", userImage: "user_5", privacy: false, hasFollowed: true,followers: 10, following: 22),
        
    
    
        User(id: NSUUID().uuidString, email:   "r@gmail.com",userName: "@enesraf", name: "Enes Tuğberk Kılıç", userImage: "user_2", privacy: false, hasFollowed: true,  followers: 10, following: 22),
 
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
    
    var outfits: [Outfit]=[
     
        Outfit(top: Cloth(idSubCategory: "1", color: "black", product_id: "id", url: "url", clothImage: "empty", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "empty", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "4", color: "white", product_id: "", url: "", clothImage: "empty", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "5", color: "black", product_id: "", url: "", clothImage: "empty", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "6", color: "blue", product_id: "", url: "", clothImage: "empty", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "7", color: "black", product_id: "", url: "", clothImage: "empty", size: "", createdAt: Date.now, userId: 1), userId: 1),
        
        Outfit(top: Cloth(idSubCategory: "1", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "4", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "5", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "6", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "7", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1),
        Outfit(top: Cloth(idSubCategory: "1", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "3", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "4", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "5", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "6", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "7", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1),
        Outfit(top: Cloth(idSubCategory: "1", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "3", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "4", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "5", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "6", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "7", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1)
        
    ]
    
    
    
    var posts: [OutfitPost] = [
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", isLiked : false, description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 2),
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", isLiked : true , description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 0),
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20" , isLiked : true, description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 3),
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20",  isLiked : true, description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20",  isLiked : true, description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1),
        
        OutfitPost(outfit: Outfit(top: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now, userId: 1), bottom: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now, userId: 1), dress: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now, userId: 1), shoe: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now, userId: 1), bag: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now, userId: 1), outwear: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now, userId: 1), accessory: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now, userId: 1), userId: 1), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["casual","floral","denim"], userId: 1)
        
    
        
      

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
    
        Inspiration(userId: 0, savedOutfitId: [0,1,2]),
        Inspiration(userId: 1, savedOutfitId: [3,4,5]),
        Inspiration(userId: 2, savedOutfitId: [0,1,3]),
        Inspiration(userId: 3, savedOutfitId: [0,2,4]),
        Inspiration(userId: 4, savedOutfitId: [0,1,2]),
        Inspiration(userId: 5, savedOutfitId: [0,1,2])

    
    ]
            
}
