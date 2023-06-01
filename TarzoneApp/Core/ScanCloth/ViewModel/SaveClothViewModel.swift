import SwiftUI
import PhotosUI
import Firebase

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
        print("savecloth")
        print(hashtag)

        //get Current User id
        guard let uid = Auth.auth().currentUser?.uid else{return}
   

        let clothRef = Firestore.firestore().collection("cloth").document()

        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage, imageType: "clothImages") else{return}

        let cloth = Cloth(id: clothRef.documentID ,userId: uid, idCategory : catId!,  idSubCategory: MockData().categories[catId!].subcategories[subCatId!].id, color: color, url: url, clothImage: imageUrl, size: size, createdAt: Timestamp(date: Date.now), hashtags: hashtag)
        print("\(cloth)")

        
        guard let encodedCloth = try? Firestore.Encoder().encode(cloth) else{return}

        
        
        try await clothRef.setData(encodedCloth)
    
        // Save işlemi başarılı olduğunda mesajı göster
      
        isShowingSaveSuccessfulMessage = true
            
        isSaveButtonEnabled = true

    }
}
