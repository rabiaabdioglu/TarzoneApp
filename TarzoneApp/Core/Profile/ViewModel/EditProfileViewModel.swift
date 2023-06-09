//
//  EditProfileViewModel.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 22.05.2023.
//

import Foundation
import PhotosUI
import Firebase
import SwiftUI

@MainActor
class EditProfileViewModel: ObservableObject{
    @Published  var fullname = ""
    @Published  var bio = ""
    @Published  var user: User
    @Published var selectedImage: PhotosPickerItem?{
        didSet {Task {await loadImage(fromItem: selectedImage)}}
    }
    @Published var profileImage: String?
    private var uiImage: UIImage?
    init(user: User){
        self.user = user
        self.profileImage = user.userImage
        self.fullname = user.name!
        self.bio = user.description!
    }
    func loadImage (fromItem  item :PhotosPickerItem? )async {
        guard let item = item else{return}
        guard let data = try? await item.loadTransferable(type: Data.self ) else{return}
        guard let uiImage = UIImage(data: data) else{return}
        self.uiImage = uiImage
    }
    func updateUserData() async throws{
        var data = [String:Any]()
        if let uiImage = uiImage{
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage, imageType: "profileImages")
            data["userImage"]=imageUrl
            self.profileImage = imageUrl
        }
        if !fullname.isEmpty && user.name != fullname{
            data["name"]=fullname
            print("DEBUG: Update fullname \(fullname)")
        }
        if !bio.isEmpty && user.description != bio{
            data["description"]=bio
            print("DEBUG: Update fullname \(bio)")
        }
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
