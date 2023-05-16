//
//  MockData.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 2.05.2023.
//

import Foundation

struct MockData {
    

    
    
    var users: [User] = [
        User(name: "Rabia Abdioğlu", userName: "@rabiabdglu", userImage: "user_1", privacy: false, hasFollowed: true, isMe: true),
    
    
        User(name: "Enes Tuğberk Kılıç", userName: "@enesraf", userImage: "user_2", privacy: false, hasFollowed: true, isMe: false),
        
    
        User(name: "Semiha Arslan Abdioğlu", userName: "@semihanim", userImage: "user_3", privacy: true, hasFollowed: true, isMe: false),
        
    
        User(name: "Yusuf Emre Abdioğlu", userName: "@emredersin", userImage: "user_4", privacy: false, hasFollowed: false, isMe: false),
        
    
        User(name: "Emirhan Çağlar", userName: "@emirhanim", userImage: "user_5", privacy: false, hasFollowed: true, isMe: false),
        
    
    
        User(name: "Enes Tuğberk Kılıç", userName: "@enesraf", userImage: "user_2", privacy: false, hasFollowed: true, isMe: false),
        
    
        User(name: "Semiha Arslan Abdioğlu", userName: "@semihanim", userImage: "user_3", privacy: true, hasFollowed: true, isMe: false),
        
    
        User(name: "Yusuf Emre Abdioğlu", userName: "@emredersin", userImage: "user_4", privacy: false, hasFollowed: false, isMe: false),
        
    
        User(name: "Emirhan Çağlar", userName: "@emirhanim", userImage: "user_5", privacy: false, hasFollowed: true, isMe: false),
        
    
    
        User(name: "Enes Tuğberk Kılıç", userName: "@enesraf", userImage: "user_2", privacy: false, hasFollowed: true, isMe: false),
        
    
        User(name: "Semiha Arslan Abdioğlu", userName: "@semihanim", userImage: "user_3", privacy: true, hasFollowed: true, isMe: false),
        
    
        User(name: "Yusuf Emre Abdioğlu", userName: "@emredersin", userImage: "user_4", privacy: false, hasFollowed: false, isMe: false),
        
    
        User(name: "Emirhan Çağlar", userName: "@emirhanim", userImage: "user_5", privacy: false, hasFollowed: true, isMe: false),
        
    
    
        User(name: "Enes Tuğberk Kılıç", userName: "@enesraf", userImage: "user_2", privacy: false, hasFollowed: true, isMe: false),
        
    
        User(name: "Semiha Arslan Abdioğlu", userName: "@semihanim", userImage: "user_3", privacy: true, hasFollowed: true, isMe: false),
        
    
        User(name: "Yusuf Emre Abdioğlu", userName: "@emredersin", userImage: "user_4", privacy: false, hasFollowed: false, isMe: false),
        
    
        User(name: "Emirhan Çağlar", userName: "@emirhanim", userImage: "user_5", privacy: false, hasFollowed: true, isMe: false)
    
 
    
    ]
    
    
    var cloths: [Cloth] = [
        Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now),
        Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now),
        Cloth(idSubCategory: "2", color: "white", product_id: "", url: "", clothImage: "dress", size: "s", createdAt: Date.now),
        Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now),
        Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now),
        Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now),
        Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now)
        
        
 ]
    
    var combines: [Combine]=[
        Combine(topId: Cloth(idSubCategory: "1", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now), bottomId: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now), dressId: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now), shoeId: Cloth(idSubCategory: "4", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now), bagId: Cloth(idSubCategory: "5", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now), outwearId: Cloth(idSubCategory: "6", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now), accessoryId: Cloth(idSubCategory: "7", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now)),
        Combine(topId: Cloth(idSubCategory: "1", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now), bottomId: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now), dressId: Cloth(idSubCategory: "3", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now), shoeId: Cloth(idSubCategory: "4", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now), bagId: Cloth(idSubCategory: "5", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now), outwearId: Cloth(idSubCategory: "6", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now), accessoryId: Cloth(idSubCategory: "7", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now)),
        Combine(topId: Cloth(idSubCategory: "1", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now), bottomId: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now), dressId: Cloth(idSubCategory: "3", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now), shoeId: Cloth(idSubCategory: "4", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now), bagId: Cloth(idSubCategory: "5", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now), outwearId: Cloth(idSubCategory: "6", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now), accessoryId: Cloth(idSubCategory: "7", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now))
        
    ]
    
    
    
    var posts: [CombinePost] = [
        
        CombinePost(combine: Combine(topId: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now), bottomId: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now), dressId: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now), shoeId: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now), bagId: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now), outwearId: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now), accessoryId: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now)), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["#casual","floral","denim"]),
        
        CombinePost(combine: Combine(topId: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now), bottomId: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now), dressId: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now), shoeId: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now), bagId: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now), outwearId: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now), accessoryId: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now)), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["#casual","floral","denim"]),
        
        CombinePost(combine: Combine(topId: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now), bottomId: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now), dressId: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now), shoeId: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now), bagId: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now), outwearId: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now), accessoryId: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now)), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["#casual","floral","denim"]),
        
        CombinePost(combine: Combine(topId: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now), bottomId: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now), dressId: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now), shoeId: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now), bagId: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now), outwearId: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now), accessoryId: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now)), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["#casual","floral","denim"]),
        
        CombinePost(combine: Combine(topId: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now), bottomId: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now), dressId: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now), shoeId: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now), bagId: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now), outwearId: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now), accessoryId: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now)), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["#casual","floral","denim"]),
        
        CombinePost(combine: Combine(topId: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now), bottomId: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now), dressId: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now), shoeId: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now), bagId: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now), outwearId: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now), accessoryId: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now)), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["#casual","floral","denim"]),
        
        CombinePost(combine: Combine(topId: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now), bottomId: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now), dressId: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now), shoeId: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now), bagId: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now), outwearId: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now), accessoryId: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now)), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["#casual","floral","denim"]),
        
        CombinePost(combine: Combine(topId: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now), bottomId: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now), dressId: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now), shoeId: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now), bagId: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now), outwearId: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now), accessoryId: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now)), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["#casual","floral","denim"]),
        
        CombinePost(combine: Combine(topId: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now), bottomId: Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now), dressId: Cloth(idSubCategory: "", color: "", product_id: "", url: "", clothImage: "", size: "", createdAt: Date.now), shoeId: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now), bagId: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now), outwearId: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now), accessoryId: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now)), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["#casual","floral","denim"]),
        
        CombinePost(combine: Combine(topId: Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "", size: "M", createdAt: Date.now), bottomId: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "", size: "M", createdAt: Date.now), dressId: Cloth(idSubCategory: "2", color: "tan", product_id: "", url: "", clothImage: "dress", size: "", createdAt: Date.now), shoeId: Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now), bagId: Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now), outwearId: Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now), accessoryId: Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now)), likes: "20", description: "", season: Seasons.Fall_Winter, hashtag: ["#casual","floral","denim"]),
        
    
        
      

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
        

    
            
}
