import SwiftUI
import PhotosUI
import Firebase
import CoreData

@MainActor
class SaveClothViewModel: ObservableObject {
    @Published var category: String = ""
    @Published var subCategory: String = ""
    @Published var color: String = ""
    @Published var size: String = ""
    @Published var url: String = ""
    @Published var hashtag: [String] = []
    @Published  var isShowingSaveSuccessfulMessage = false
    @Published var isSaveButtonEnabled = true
    private var uiImage: UIImage?
    @Published var subCatId: Int?
    @Published var catId: Int?
    let container: NSPersistentContainer
    init() {
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
    func clearFields() {
        category = ""
        subCategory = ""
        color = ""
        size = ""
        url = ""
        hashtag = []
    }
    func saveCloth(uiImage: UIImage) async throws {
        //get Current User id
        guard let uid = Auth.auth().currentUser?.uid else{return}
        let clothRef = Firestore.firestore().collection("cloth").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage, imageType: "clothImages") else{return}
        let cloth = Cloth(id: clothRef.documentID ,userId: uid, idCategory : catId!,  idSubCategory: MockData().categories[catId!].subcategories[subCatId!].id, color: color, url: url, clothImage: imageUrl, size: size, createdAt: Timestamp(date: Date.now), hashtags: hashtag)
        guard let encodedCloth = try? Firestore.Encoder().encode(cloth) else{return}
        try await clothRef.setData(encodedCloth)
        isShowingSaveSuccessfulMessage = true
        isSaveButtonEnabled = true
        //Instead of downloading from the firebase, we saved the primary user's clothing information to core data
        do {
            let clothData = NSEntityDescription.insertNewObject(forEntityName: "ClothData", into: container.viewContext)
            let imageData = uiImage.pngData()
            clothData.setValue(String(imageUrl), forKey: "imageUrl")
            clothData.setValue(imageData, forKey: "clothImage")
            clothData.setValue(String(clothRef.documentID), forKey: "clothId")
            clothData.setValue(String(MockData().categories[catId!].subcategories[subCatId!].id), forKey: "subCatId")
            clothData.setValue(String(uid), forKey: "userId")
            try container.viewContext.save()
        } catch {
            // Handle errors in saving data to Core Data
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
