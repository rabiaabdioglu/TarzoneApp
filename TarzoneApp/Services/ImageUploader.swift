//
//  ImageUploader.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 22.05.2023.
//

import Foundation
import Firebase
import FirebaseStorage


struct ImageUploader{
    static func uploadImage(image: UIImage, imageType: String) async throws -> String?
    {
        
        guard let  imageData = image.jpegData( compressionQuality: 0.5) else {return nil}
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/\(imageType)/\(filename)")
        do{
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
            return nil
        }
        
        
    }
}

