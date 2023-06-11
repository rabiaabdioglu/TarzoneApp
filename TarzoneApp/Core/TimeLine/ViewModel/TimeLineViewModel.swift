//
//  TimeLineViewModel.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 6.06.2023.
//

import Foundation
import Firebase

//TimelineView, PostGridView, ChoosenPostView, OutfitView, SavedOutfitView bu Viewmodele bağlı

@MainActor
class TimeLineViewModel: ObservableObject {
    @Published var outfitPost : OutfitPost?
    @Published var outfit = [Outfit]()
    @Published var inspirationOutfit = [Outfit]()
    @Published var profileOutfit = [Outfit]()
    @Published var cloths = [Cloth]()
    @Published var ownerUser : User?
    @Published var isReportButtonEnable : Bool = true
    @Published var isLoading = true
    @Published var userIdForProfileViews : String?
    @Published var isPrivateProfile  : Bool? = true
    init() {
        refresh()
    }
    // Reset and refresh for catch changes
    func refresh() {
        Task {
            do {
                try await fetchOutfit()
                try await fetchOutfitInspirations()
                try await fetchProfileOutfit()
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
                self.isReportButtonEnable = true
                self.refresh()
            }}
    }
    // MARK: FETCH outfit , cloth and user data for TimelineView and ChoosenPostView (and subviews)
    func fetchOutfit() async throws {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("outfitCloths").whereField("userId", isNotEqualTo: currentUserID).getDocuments()
        let fetchedOutfit = try snapshot.documents.compactMap({ try $0.data(as: Outfit.self) })
        DispatchQueue.main.async { [weak self] in
            self?.outfit = fetchedOutfit
            self?.isLoading = false
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
            let savedBy = outfitPostData["savedBy"] as? [String] ?? []
            // Check if "season" field exists and is a valid string
            let season = Seasons(rawValue: seasonRawValue)
            DispatchQueue.main.async { [weak self , season] in
                var outfitPost = OutfitPost(id: id, outfit: chosenOutfit, likes: likes, description: description, season: season, userId: userId, savedBy: savedBy)
                outfitPost.isLiked = false
                self?.outfitPost = outfitPost
                self?.outfitPost?.likes = outfitPost.savedBy.count
                if outfitPost.savedBy.contains(Auth.auth().currentUser!.uid) {
                    self?.outfitPost?.isLiked = true
                } else {
                    self?.outfitPost?.isLiked = false
                }
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
    // MARK: Inspire Outfit Functions
    func inspireOutfit() {
        Task {
            do {
                try await inspireOutfitAsync(outfitPost: self.outfitPost!)
            } catch {
                print("Error cancelling inspire outfit: \(error)")
            }
        }
    }
    private func inspireOutfitAsync(outfitPost: OutfitPost) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        do {
            getOutfitPostDocument(outfitId: outfitPost.id) { documentID in
                if let documentID = documentID {
                    var savedBy = outfitPost.savedBy
                    savedBy.append(uid)
                    Firestore.firestore().collection("outfitPost").document(documentID).updateData([
                        "savedBy": FieldValue.arrayUnion([uid])
                    ]) { error in
                        if let error = error {
                            print("Error updating like count: \(error)")
                        } else {
                            DispatchQueue.main.async {
                                self.outfitPost?.likes += 1
                                self.outfitPost?.isLiked = true
                            }
                        }
                    }
                    self.outfitPost = outfitPost
                } else {
                    print("OutfitPost document not found or error occurred")
                }
            }
            self.outfitPost = outfitPost
        }
    }
    func cancelInspireOutfit() {
        Task {
            do {
                try await cancelInspireOutfitAsync(outfitPost: self.outfitPost!)
            } catch {
                print("Error cancelling inspire outfit: \(error)")
            }
        }
    }
    private func cancelInspireOutfitAsync(outfitPost: OutfitPost) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        do {
            getOutfitPostDocument(outfitId: outfitPost.id) { documentID in
                if let documentID = documentID {
                    Firestore.firestore().collection("outfitPost").document(documentID).updateData([
                        "savedBy": FieldValue.arrayRemove([uid])
                    ]) { error in
                        if let error = error {
                            print("Error updating like count: \(error)")
                        } else {
                            DispatchQueue.main.async {
                                self.outfitPost?.likes -= 1
                                self.outfitPost?.isLiked = false
                            }
                        }
                    }
                    self.outfitPost = outfitPost
                } else {
                    print("OutfitPost document not found or error occurred")
                }
            }
            self.outfitPost = outfitPost
        }
    }
    // MARK: Fetch for Inspiration
    func fetchOutfitInspirations() async throws {
        guard let currentUserID = Auth.auth().currentUser?.uid else {
            // Handle the case when the current user is not available
            return
        }
        let querySnapshot = try await Firestore.firestore()
            .collection("outfitPost")
            .whereField("savedBy", arrayContains: currentUserID)
            .getDocuments()
        let fetchedOutfitIDs = querySnapshot.documents.compactMap { $0["outfitId"] as? String }
        let updatedOutfits = try await fetchOutfitsWithIDs(fetchedOutfitIDs)
        DispatchQueue.main.async { [weak self] in
            self?.inspirationOutfit = updatedOutfits
            self?.isLoading = false
        }
    }
    func fetchOutfitsWithIDs(_ outfitIDs: [String]) async throws -> [Outfit] {
        var updatedOutfits: [Outfit] = []
        for outfitID in outfitIDs {
            let outfitClothsSnapshot = try await Firestore.firestore()
                .collection("outfitCloths")
                .whereField("id", isEqualTo: outfitID)
                .getDocuments()
            let outfits = outfitClothsSnapshot.documents.compactMap { document -> Outfit? in
                guard let outfitData = try? document.data(as: Outfit.self) else {
                    return nil
                }
                return outfitData
            }
            updatedOutfits.append(contentsOf: outfits)
        }
        return updatedOutfits
    }
    // MARK: Delete Outfit POST
    func deleteOutfitPost(outfitPost: OutfitPost) {
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
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let outfitPostRef = Firestore.firestore().collection("outfitPost")
        let query = outfitPostRef.whereField("id", isEqualTo: outfitPost.id)
            .whereField("userId", isEqualTo: userId)
            .limit(to: 1)
        do {
            let snapshot = try await query.getDocuments()
            guard let document = snapshot.documents.first else { return }
            try await outfitPostRef.document(document.documentID).delete()
        }
        catch {
            print("Error cancelling inspire outfit: \(error)")
        }
    }
    private func deleteOutfitAsync(outfitId: String) async throws{
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let outfitRef = Firestore.firestore().collection("outfitCloths")
        let query = outfitRef.whereField("id", isEqualTo: outfitId)
            .whereField("userId", isEqualTo: userId)
            .limit(to: 1)
        do {
            let snapshot = try await query.getDocuments()
            guard let document = snapshot.documents.first else { return }
            try await outfitRef.document(document.documentID).delete()
        }
        catch {
            print("Error cancelling inspire outfit: \(error)")
        }
        self.reset()
    }
    // MARK: Report Outfit
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
    // MARK: Profile Views functions
    func fetchProfileOutfit() async throws {
        let snapshot = try await Firestore.firestore().collection("outfitCloths").whereField("userId", isEqualTo: userIdForProfileViews as Any).getDocuments()
        let fetchedOutfit = try snapshot.documents.compactMap({ try $0.data(as: Outfit.self) })
        DispatchQueue.main.async { [weak self] in
            self?.profileOutfit = fetchedOutfit
            self?.isLoading = false
        }
    }
    func updatePrivacy() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        let userRef = db.collection("users").document(uid)
        userRef.getDocument { [self] snapshot, error in
            guard let document = snapshot else {
                print("Error fetching document: \(String(describing: error))")
                return
            }
            if document.exists {
                let isPrivate = isPrivateProfile // Set this to true or false based on the desired privacy status
                userRef.updateData(["privacy": isPrivate as Any]) { error in
                    if let error = error {
                        print("Error updating privacy status: \(error)")
                    } else {
                        print("Privacy status updated successfully")
                    }
                }
            } else {
                print("User document does not exist")
            }
        }
    }
}
