//
//  ChoosenClothViewModel.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 8.06.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase
import CoreData
import FirebaseStorage
import Kingfisher

// SAVE AND DELETE CLOTH Functions 
@MainActor
class ChoosenClothViewModel: ObservableObject {
    @Published  var isShowingSaveSuccessfulMessage = false
    @Published var isButtonEnabled = true
    @Published var message : String = ""
    let container: NSPersistentContainer
    init(){
        container = NSPersistentContainer(name: "TarzoneApp")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data in DataController \(error.localizedDescription)")
            }
        }
    }
    //for pickerStyle
    let tableItems = [
        "Category",
        "SubCategory",
        "Color",
        "Size",
        "Url",
        "Hashtag"
    ]
    //SAVE cloth
    func saveClothToCloset(cloth : Cloth) async throws{
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let clothRef = Firestore.firestore().collection("cloth").document()
        let cloth = Cloth(id: clothRef.documentID ,userId: uid, idCategory : cloth.idCategory,  idSubCategory: cloth.idSubCategory, color: cloth.color, url: cloth.url, clothImage: cloth.clothImage, size: cloth.size, createdAt: Timestamp(date: Date()), hashtags: cloth.hashtags)
        guard let encodedCloth = try? Firestore.Encoder().encode(cloth) else{return}
        try await clothRef.setData(encodedCloth)
        message = "Successfully saved in your wardrobe. "
        isShowingSaveSuccessfulMessage = true
        isButtonEnabled = true
        //SAVE  NEW CLOTH CORE DATA
        let context = container.viewContext
        var subCatId = 0
        // Create a new ClothData object and set its properties
        guard let clothDataObject = NSEntityDescription.insertNewObject(forEntityName: "ClothData", into: context) as? ClothData else {
            fatalError("Failed to create ClothData object.")
        }
        // Set the values for the ClothData object
        clothDataObject.imageUrl = cloth.clothImage
        clothDataObject.clothId = cloth.id
        subCatId = cloth.idSubCategory
        clothDataObject.subCatId = String(subCatId)
        clothDataObject.userId = cloth.userId
        // Download the cloth image from Firebase Storage
        if let imageUrl = clothDataObject.imageUrl, let url = URL(string: imageUrl) {
            let request = URLRequest(url: url)
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                clothDataObject.clothImage = data
                print("Cloth image downloaded and assigned successfully.")
            } catch {
                print("Failed to download cloth image: \(error.localizedDescription)")
            }
        }
        do {
            try context.save()
            print("ClothData saved successfully.")
        } catch {
            // Hata durumunda işleme geç
        }
    }
    // DELETE CLOTH
    func deleteClothFromCloset(cloth : Cloth) async{
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let outfitPostRef = Firestore.firestore().collection("cloth")
        let query = outfitPostRef.whereField("id", isEqualTo: cloth.id)
            .whereField("userId", isEqualTo: userId)
            .limit(to: 1)
        do {
            let snapshot = try await query.getDocuments()
            guard let document = snapshot.documents.first else { return }
            // Kaydı sil
            try await outfitPostRef.document(document.documentID).delete()
            message = "Cloth deleted successfully. "
            print("Cloth deleted : \(document)")
        }
        catch {
            print("Error cancelling inspire outfit: \(error)")
        }
        let outfitRef = Firestore.firestore().collection("outfitCloths")
        do {
            // Update the cloth in the outfit collection with an empty value
            let query = outfitRef.whereField("\(MockData().categories[cloth.idCategory].name)", isEqualTo: cloth.id)
            let outfitSnapshot = try await query.getDocuments()
            for document in outfitSnapshot.documents {
                let outfitId = document.documentID
                let outfitDocRef = outfitRef.document(outfitId)
                try await outfitDocRef.updateData([
                    "\(MockData().categories[cloth.idCategory].name)": ""
                ])
            }
        } catch {
            print("Error updating outfit: \(error)")
        }
        //DELETE FROM CoreData
        let context = container.viewContext // NSPersistentContainer'dan context'i al
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ClothData")
        fetchRequest.predicate = NSPredicate(format: "clothId == %@", cloth.id)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(deleteRequest)
            try context.save()
            print("ClothData deleted successfully.")
        } catch {
        }
    }
}


