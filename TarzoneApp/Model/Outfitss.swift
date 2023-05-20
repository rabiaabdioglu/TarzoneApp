//
//  Combines.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 18.05.2023.
//

import Foundation

struct Outfitss: Identifiable {
    
    let id = UUID()
    var clothes : [Int?] = [nil, nil, nil, nil, nil, nil,nil]
    var userId : Int


}
/*
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
         Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now,userId: 1),
         
         Cloth(idSubCategory: "0", color: "black", product_id: "id", url: "url", clothImage: "top", size: "M", createdAt: Date.now, userId: 1),
         Cloth(idSubCategory: "1", color: "tan", product_id: "", url: "", clothImage: "bottom", size: "M", createdAt: Date.now, userId: 2),
         Cloth(idSubCategory: "2", color: "white", product_id: "", url: "", clothImage: "dress", size: "s", createdAt: Date.now, userId: 3),
         Cloth(idSubCategory: "3", color: "white", product_id: "", url: "", clothImage: "shoe", size: "37", createdAt: Date.now,  userId: 4),
         Cloth(idSubCategory: "4", color: "black", product_id: "", url: "", clothImage: "bag", size: "", createdAt: Date.now,  userId: 5),
         Cloth(idSubCategory: "5", color: "blue", product_id: "", url: "", clothImage: "outwear", size: "38", createdAt: Date.now,  userId: 0),
         Cloth(idSubCategory: "6", color: "black", product_id: "", url: "", clothImage: "accessory", size: "", createdAt: Date.now,userId: 1)
         
         
  ]
     

     
     var outfit : [Outfit]=[
         Outfit(clothes: [0,nil,nil,3,4,5,nil], userId: 0),
         Outfit(clothes: [7,1,2,nil,4,nil,6], userId: 1),
         Outfit(clothes: [0,1,2,nil,4,5,6], userId: 2),
         Outfit(clothes: [0,1,2,nil,4,5,6], userId: 0),
         Outfit(clothes: [0,nil,nil,3,4,5,nil], userId: 0),
         Outfit(clothes: [7,1,2,nil,4,nil,6], userId: 1),
         Outfit(clothes: [0,1,2,nil,4,5,6], userId: 2),
         Outfit(clothes: [0,1,2,nil,4,5,6], userId: 0)
     ]
     
     var posts: [CombinePost] = [
         CombinePost(userId: 0, outfitId: 0, likes: 20, description: "Todays", season: Seasons.Pre_Fall, hashtag: ["casual","floral","denim"]),
         CombinePost(userId: 1, outfitId: 1, likes: 1, description: "Date", season: Seasons.Resort,  hashtag: ["floral","denim"]),
         CombinePost(userId: 1, outfitId: 2, likes: 230, description: "Weekend", season: Seasons.Fall_Winter,  hashtag: ["casual","floral","denim","casual","floral","denim"]),
         CombinePost(userId: 0, outfitId: 3, likes: 30, description: "Todays", season: Seasons.Spring_Summer, hashtag: ["casual","floral","denim","casual","floral","denim"]),
         CombinePost(userId: 2, outfitId: 4, likes: 30, description: "Todays", season: Seasons.Pre_Fall,  hashtag: ["casual","floral","denim"]),
         CombinePost(userId: 3, outfitId: 5, likes: 40, description: "Todays", season: Seasons.Pre_Fall,  hashtag: ["casual","floral","denim"]),
         CombinePost(userId: 4, outfitId: 6, likes: 60, description: "Todays", season: Seasons.Pre_Fall, hashtag: ["casual","floral","denim"]),
         CombinePost(userId: 5, outfitId: 7, likes: 10, description: "Todays", season: Seasons.Pre_Fall,  hashtag: ["casual","floral","denim"]),
         CombinePost(userId: 6, outfitId: 8, likes: 20, description: "Todays", season: Seasons.Pre_Fall,  hashtag: ["casual","floral","denim"]),
         CombinePost(userId: 1, outfitId: 9, likes: 20, description: "Todays", season: Seasons.Pre_Fall,  hashtag: ["casual","floral","denim"]),
         CombinePost(userId: 2, outfitId: 10, likes: 20, description: "Todays", season: Seasons.Pre_Fall,  hashtag: ["casual","floral","denim"]),
         CombinePost(userId: 4, outfitId: 11, likes: 20, description: "Todays", season: Seasons.Pre_Fall,  hashtag: ["casual","floral","denim"]),
         CombinePost(userId: 4, outfitId: 6, likes: 60, description: "Todays", season: Seasons.Pre_Fall, hashtag: ["casual","floral","denim"]),
         CombinePost(userId: 5, outfitId: 7, likes: 10, description: "Todays", season: Seasons.Pre_Fall,  hashtag: ["casual","floral","denim"]),
         CombinePost(userId: 6, outfitId: 8, likes: 20, description: "Todays", season: Seasons.Pre_Fall,  hashtag: ["casual","floral","denim"]),
         CombinePost(userId: 1, outfitId: 9, likes: 20, description: "Todays", season: Seasons.Pre_Fall,  hashtag: ["casual","floral","denim"]),
         CombinePost(userId: 2, outfitId: 10, likes: 20, description: "Todays", season: Seasons.Pre_Fall,  hashtag: ["casual","floral","denim"]),
         CombinePost(userId: 4, outfitId: 11, likes: 20, description: "Todays", season: Seasons.Pre_Fall,  hashtag: ["casual","floral","denim"])



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
**/
