//
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 6.06.2023.
//

import Foundation
import Firebase

//TimelineView, PostGridView, ChoosenPostView, OutfitView bu Viewmodele bağlı

@MainActor
class InspirationViewModel: ObservableObject {
    @Published var outfitPost : OutfitPost?
    @Published var outfit = [Outfit]()
    @Published var cloths = [Cloth]()
    @Published var isLoading = true
    @Published var ownerUser : User?
    @Published var inspiration : Inspiration?
    
    init() {
        refresh()
    }
    
    func refresh() {
        Task {
            do {
                try await fetchOutfit()
            } catch {
                print("Error: \(error)")
            }
        }
    }

    
    func reset() {
        Task {
            DispatchQueue.main.async { [self] in
                self.outfit.removeAll()
                self.cloths.removeAll()
                self.isLoading = true
                self.ownerUser = nil
                self.outfitPost = nil
                self.inspiration = nil
                self.refresh()
            }}
        
    }
    
    
    func fetchOutfit() async throws {
        print("fetched outfit")
        let snapshot = try await Firestore.firestore().collection("outfitCloths").getDocuments()
        let fetchedOutfit = try snapshot.documents.compactMap({ try $0.data(as: Outfit.self) })
        
        DispatchQueue.main.async { [weak self] in
            self?.outfit = fetchedOutfit
            self?.isLoading = false // Yeni bir veri alındığında isLoading değerini false olarak güncelle
        }
    }

    
    
    func fetchOutfitCloths(outfitData: Outfit) async  {
        let clothIds = [outfitData.top, outfitData.bottom, outfitData.fullbody, outfitData.shoe, outfitData.bag, outfitData.outwear, outfitData.accessory]
        // Clear the cloths array before fetching new cloths
        DispatchQueue.main.async { [weak self] in
            self?.cloths.removeAll()
        }
        for clothId in clothIds {
            do {
                if !clothId.isEmpty {
                    let querySnapshot = try await Firestore.firestore().collection("cloth").whereField("id", isEqualTo: clothId).getDocuments()
                    
                    if let clothData = try querySnapshot.documents.first?.data(as: Cloth.self) {
                        DispatchQueue.main.async { [weak self] in
                            self?.cloths.append(clothData)
                        }
                    }
                }
            } catch {
                print("Error fetching cloth: \(error)")
            }
        }
        
    }
    
    func fetchOutfitPost(chosenOutfit: Outfit) async throws {
        // resetSelectedPost()
        let querySnapshot = try await Firestore.firestore().collection("outfitPost").whereField("outfitId", isEqualTo: chosenOutfit.id).getDocuments()
        
        if let outfitPostData = querySnapshot.documents.first?.data() {
            let userId = outfitPostData["userId"] as? String ?? ""
            let likes = outfitPostData["likes"] as? Int ?? 0
            let seasonRawValue = outfitPostData["season"] as? String ?? ""
            let description = outfitPostData["description"] as? String ?? ""
            let id = outfitPostData["id"] as? String ?? ""
            // Check if "season" field exists and is a valid string
            let season = Seasons(rawValue: seasonRawValue)
            
            DispatchQueue.main.async { [weak self , season] in
                var outfitPost = OutfitPost(id: id, outfit: chosenOutfit, likes: likes, description: description, season: season, userId: userId)
                outfitPost.isLiked = false
                self?.outfitPost = outfitPost
                
            }
            do {
                try await  getUserDetail(userId: userId)
            } catch {
                print("Error fetching outfit post: \(error)")
            }
            
        }
        
    }
    func getUserDetail(userId: String) async throws  {
        
        let querySnapshot = try await Firestore.firestore().collection("users").whereField("id", isEqualTo: userId).getDocuments()
        
        if let userData = querySnapshot.documents.first?.data() {
            let userId = userData["id"] as? String ?? ""
            let email = userData["email"] as? String ?? ""
            let followers = userData["followers"] as? Int32 ?? 0
            let following = userData["following"] as? Int32 ?? 0
            let hasFollowed = userData["hasFollowed"] as? Bool ?? false
            let name = userData["name"] as? String ?? ""
            let userImage = userData["userImage"] as? String ?? ""
            let userName = userData["userName"] as? String ?? ""
            let description = userData["description"] as? String ?? ""
            let privacy = userData["privacy"] as? Bool ?? true
            
            
            
            DispatchQueue.main.async {
                let ownerUser =  User(id: userId, email: email, userName: userName, name: name, userImage: userImage, privacy: privacy, hasFollowed: hasFollowed, followers: followers, following: following, description: description)
                
                self.ownerUser = ownerUser
                
            }
            
        }
        
        
    }
    func inspireOutfit(outfitPost: OutfitPost) {
        print("inspireOutfit")
        Task {
            do {
                try await inspireOutfitAsync(outfitPost: outfitPost)
            } catch {
                print("Error cancelling inspire outfit: \(error)")
            }
        }
    }
    
    private func inspireOutfitAsync(outfitPost: OutfitPost) async throws{
        //OUTFİT
        print("inspireOutfitAsync")
        
        guard let uid = Auth.auth().currentUser?.uid else{return}
        let inspireRef = Firestore.firestore().collection("inspirationOutfit").document()
        
        var inspire = [String:Any]()
        
        
        inspire["id"] = inspireRef.documentID
        inspire["userId"] = uid
        inspire["outfitPostId"] = outfitPost.id
        
        
        
        print(inspireRef.documentID)
        print(outfitPost.id)
        try await Firestore.firestore().collection("inspirationOutfit").addDocument(data: inspire)
        
        getOutfitPostDocument(outfitId: outfitPost.id) { documentID in
            if let documentID = documentID {
                print(documentID)
                // Belge bulundu, güncelleme yapabilirsiniz
                Firestore.firestore().collection("outfitPost").document(documentID).updateData(["likes": outfitPost.likes + 1]) { error in
                    if let error = error {
                        print("Error updating like count: \(error)")
                    } else {
                        DispatchQueue.main.async {
                            self.outfitPost?.likes  += 1
                        }
                    }
                }
            } else {
                // Belge bulunamadı veya hata oluştu
                print("OutfitPost document not found or error occurred")
            }
        }
        self.outfitPost = outfitPost
        
        // Outfit postunu güncelledikten sonra refresh işlemini başlat
        
        print("Inspire added : \(inspire)")
        print("OutfitPost likes : \(String(describing: self.outfitPost?.likes))")
    }
    func cancelInspireOutfit(outfitPost: OutfitPost) {
        print("cancelInspireOutfit")
        
        Task {
            do {
                try await cancelInspireOutfitAsync(outfitPost: outfitPost)
            } catch {
                print("Error cancelling inspire outfit: \(error)")
            }
        }
    }
    
    private func cancelInspireOutfitAsync(outfitPost: OutfitPost) async throws {
        print("cancelInspireOutfitAsync")
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        // Silme işlemi
        let inspirationRef = Firestore.firestore().collection("inspirationOutfit")
        let query = inspirationRef.whereField("outfitPostId", isEqualTo: outfitPost.id)
            .whereField("userId", isEqualTo: userId)
            .limit(to: 1)
        
        do {
            let snapshot = try await query.getDocuments()
            guard let document = snapshot.documents.first else { return }
            
            // Kaydı sil
            try await inspirationRef.document(document.documentID).delete()
            
            getOutfitPostDocument(outfitId: outfitPost.id) { documentID in
                if let documentID = documentID {
                    
                    // Belge bulundu, güncelleme yapabilirsiniz
                    Firestore.firestore().collection("outfitPost").document(documentID).updateData(["likes": outfitPost.likes - 1]) { error in
                        if let error = error {
                            print("Error updating like count: \(error)")
                        } else {
                            DispatchQueue.main.async {
                                self.outfitPost?.likes  -= 1
                            }
                        }
                    }
                } else {
                    // Belge bulunamadı veya hata oluştu
                    print("OutfitPost document not found or error occurred")
                }
            }
            print("Inspire deleted : \(document)")
            print("OutfitPost likes : \(String(describing: self.outfitPost?.likes))")
        } catch {
            print("Error cancelling inspire outfit: \(error)")
        }
        
        
    }
    
    func deleteOutfitPost(outfitPost: OutfitPost) {
        print("deleteOutfitPost")
        Task {
            do {
                try await deleteOutfitPostAsync(outfitPost: outfitPost)
                try await deleteOutfitAsync(outfitId: outfitPost.outfit.id)
            } catch {
                print("Error cancelling inspire outfit: \(error)")
            }
        }
    }
    
    private func deleteOutfitPostAsync(outfitPost: OutfitPost) async throws{
        
        print("deleteOutfitAsync")
        guard let userId = Auth.auth().currentUser?.uid else { return }
        // Silme işlemi
        
        let outfitPostRef = Firestore.firestore().collection("outfitPost")
        let query = outfitPostRef.whereField("id", isEqualTo: outfitPost.id)
            .whereField("userId", isEqualTo: userId)
            .limit(to: 1)
        
        do {
            let snapshot = try await query.getDocuments()
            guard let document = snapshot.documents.first else { return }
            
            // Kaydı sil
            try await outfitPostRef.document(document.documentID).delete()
            
            print("Outfit deleted : \(document)")
        }
        catch {
            print("Error cancelling inspire outfit: \(error)")
        }
        
    }
    private func deleteOutfitAsync(outfitId: String) async throws{
        
        print("deleteOutfitAsync")
        guard let userId = Auth.auth().currentUser?.uid else { return }
        // Silme işlemi
        let outfitRef = Firestore.firestore().collection("outfitCloths")
        let query = outfitRef.whereField("id", isEqualTo: outfitId)
            .whereField("userId", isEqualTo: userId)
            .limit(to: 1)
        
        do {
            let snapshot = try await query.getDocuments()
            guard let document = snapshot.documents.first else { return }
            
            // Kaydı sil
            try await outfitRef.document(document.documentID).delete()
            
            print("Outfit deleted : \(document)")
        }
        catch {
            print("Error cancelling inspire outfit: \(error)")
        }
        self.reset()

    }
    
    func reportOutfit(outfitPost: OutfitPost) async throws{
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let reportRef = Firestore.firestore().collection("reportedOutfit").document()
        
        var report = [String:Any]()
        
        
        let message = "Şikayet Edilen Outfit Post:\n\n" +
        "Outfit ID: \(outfitPost.id)\n" +
        "Owner ID: \(outfitPost.userId)\n" +
        "Outfit ID: \(outfitPost.outfit.id)\n" +
        "Description: \(outfitPost.description)\n"
        
        report["reportId"] = reportRef.documentID
        report["userId"] = uid
        report["reportMessage"] = message
        
        try await Firestore.firestore().collection("reportedOutfit").addDocument(data: report)
        isReportButtonEnable = false
    }
    func resetSelectedPost() {
        DispatchQueue.main.async { [self] in
            self.ownerUser = nil
            self.outfitPost = nil
        }
    }
    
    
    
    
    func getOutfitPostDocument(outfitId: String, completion: @escaping (String?) -> Void) {
        Firestore.firestore().collection("outfitPost").whereField("id", isEqualTo: outfitId).limit(to: 1).getDocuments { (snapshot, error) in
            if let error = error {
                print("Error fetching outfitPost documents: \(error)")
                completion(nil)
                return
            }
            
            guard let documents = snapshot?.documents, let document = documents.first else {
                print("No outfitPost documents found")
                completion(nil)
                return
            }
            
            let documentID = document.documentID
            print("Found outfitPost document with ID: \(documentID)")
            completion(documentID)
        }
    }

    
    
}
