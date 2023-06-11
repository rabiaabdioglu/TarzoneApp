import SwiftUI
import UIKit
import Firebase
import CoreML


class ImagePickerViewModel: NSObject, ObservableObject {
    @Published var selectedImage: UIImage?
    @Published var category: String = ""
    @Published var subCategory: String = ""
    @Published var hashtag: [String] = []
    @Published var subCatId: Int?
    @Published var catId: Int?
    private let predictionLabels = Firestore.firestore().collection("predictionLabels")
    func selectImage(sourceType: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = sourceType
        UIApplication.shared.windows.first?.rootViewController?.present(imagePicker, animated: true, completion: nil)
    }
    func dismissImagePicker() {
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}




extension ImagePickerViewModel: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            selectedImage = image
        }
        dismissImagePicker()
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismissImagePicker()
    }
}



extension UIImage {
    func toCVPixelBuffer(targetSize: CGSize) -> CVPixelBuffer? {
        let attrs = [
            kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
            kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue
        ] as CFDictionary
        var pixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault,
                                         Int(targetSize.width),
                                         Int(targetSize.height),
                                         kCVPixelFormatType_32ARGB,
                                         attrs,
                                         &pixelBuffer)
        guard status == kCVReturnSuccess, let imageBuffer = pixelBuffer else {
            return nil
        }
        CVPixelBufferLockBaseAddress(imageBuffer, [])
        let pixelData = CVPixelBufferGetBaseAddress(imageBuffer)
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        guard let context = CGContext(data: pixelData,
                                      width: Int(targetSize.width),
                                      height: Int(targetSize.height),
                                      bitsPerComponent: 8,
                                      bytesPerRow: CVPixelBufferGetBytesPerRow(imageBuffer),
                                      space: rgbColorSpace,
                                      bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue) else {
            return nil
        }
        context.translateBy(x: 0, y: targetSize.height)
        context.scaleBy(x: 1.0, y: -1.0)
        UIGraphicsPushContext(context)
        self.draw(in: CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(imageBuffer, [])
        return imageBuffer
    }
}





extension ImagePickerViewModel{
    func predictImage()  {
        var imageClassifier: ClothPredictionModel?
        var maxIndex: Int?
        do {
            imageClassifier = try ClothPredictionModel(configuration: MLModelConfiguration())
        } catch {
            print(error)
        }
        guard let pixelBuffer = selectedImage!.toCVPixelBuffer(targetSize: CGSize(width: 224, height: 224)) else {
            print("Prediction error:")
            return
        }
        do {
            let result = try imageClassifier?.prediction(my_input: pixelBuffer)
            if let predictionsArray = result?.var_362 {
                var maxValue = Double.leastNormalMagnitude
                let count = predictionsArray.count
                for i in 0..<count {
                    let value = predictionsArray[i].doubleValue
                    if value > maxValue {
                        maxValue = value
                        maxIndex = i
                    }
                }
            }
        } catch {
            print("Prediction error: \(error)")
        }
        fetchSubcategoryName(predictionId: maxIndex ?? 0)
    }
    //For get prediction result
    func fetchSubcategoryName(predictionId: Int) {
        predictionLabels.whereField("predictionId", isEqualTo: predictionId)
            .getDocuments { [weak self] (snapshot, error) in
                if let error = error {
                    print("Error fetching subcategory name from Firebase: \(error.localizedDescription)")
                    return
                }
                guard let documents = snapshot?.documents else {
                    print("No subcategory document found in Firebase.")
                    return
                }
                if let subcategoryName = documents.first?.data()["predictionName"] as? String {
                    self?.predictionWordSpelling(predictionName: subcategoryName)
                } else {
                    print("Failed to get subcategory name.")
                    // Handle the case when subcategoryName is not available
                }
            }
    }
    func predictionWordSpelling(predictionName: String) {
        hashtag = []
        let lines = predictionName.components(separatedBy: " ")
        var i = 0
        for line in lines {
            if !line.isEmpty {
                if i == 0 {
                    category = line
                }
                else if i == 1 {
                    subCategory = line
                }
                else {
                    hashtag.append(line)
                }
                i += 1
            }
        }
        getCatId()
    }
    func getCatId() {
        for category in MockData().categories {
            var i = 0
            for subcategory in category.subcategories {
                let trimmedSubcategoryName = subcategory.name.trimmingCharacters(in: .whitespacesAndNewlines)
                let trimmedInputSubcategory = subCategory.trimmingCharacters(in: .whitespacesAndNewlines)
                if trimmedSubcategoryName == trimmedInputSubcategory {
                    subCatId = i
                    catId = category.id
                    navigateToShowClothView()
                    return // Exit the loop if the match is found
                }
                i = i + 1
            }
        }
    }
    func navigateToShowClothView() {
        DispatchQueue.main.async {
            // Diğer görünüme yönlendirme yap
            let sheetView = SaveClothView(clothImage:  self.selectedImage!, catIdP:  self.catId! , subCatIdP: self.subCatId!, hashtag : self.hashtag)
            let sheetHostingController = UIHostingController(rootView: sheetView)
            sheetHostingController.modalPresentationStyle = .fullScreen
            sheetHostingController.modalTransitionStyle = .crossDissolve
            UIApplication.shared.windows.first?.rootViewController?.present(sheetHostingController, animated: true, completion: nil)
        }
    }
}
