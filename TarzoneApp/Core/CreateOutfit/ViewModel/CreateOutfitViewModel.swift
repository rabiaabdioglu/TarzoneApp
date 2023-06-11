//
//  CreateOutfitViewModel.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 1.06.2023.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import CoreData

class CreateOutfitViewModel: NSObject, ObservableObject {
    @State private var selectedSeason: Seasons = .Spring_Summer
    @State private var descriptionText = ""
    @Published var categories: [Category] = []
    @Published var selectedCatId: Int = 0
    @Published var selectedSubCatId: Subcategory?
    @Published var subItems: [Subcategory] = []
    @Published var isSubcategoryListOpen: Bool = false
    @Published var cloths: [ClothData] = []
    @Published var outfitImages: [Image] = [Image("empty"),Image("empty"),Image("empty"),Image("empty"),Image("empty"),Image("empty"),Image("empty")]
    @Published var isOutfitSaveButtonEnabled : Bool = true
    @Published var outfitCloths : Outfit?
    // Core Data context
    let container: NSPersistentContainer
    override init() {
        container = NSPersistentContainer(name: "TarzoneApp")
        super.init() // Call super.init before accessing properties
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data in DataController \(error.localizedDescription)")
            }
        }
        categories = MockData().categories
        if let firstCategory = categories.first,
           let firstSubcategory = firstCategory.subcategories.first {
            selectedCatId = 0
            subItems = firstCategory.subcategories
            selectedSubCatId = firstSubcategory
            isSubcategoryListOpen = true
        }
    }
    func selectCategory(index: Int) {
        selectedCatId = index
        selectedSubCatId = nil // Reset the selected subcategory ID when a new category is selected
        subItems = categories[index].subcategories
        isSubcategoryListOpen = true
    }
    func selectSubItem(subItem: Subcategory) {
        selectedSubCatId = subItem
        Task {
            do {
                try await fetchCloths()
            } catch {
                print("Error fetching cloths: \(error)")
            }
        }
    }
    //Fetch cloth for selection table
    func fetchCloths() async throws {
        guard let selectedSubItem = selectedSubCatId?.id else { return }
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<ClothData> = ClothData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "subCatId == %@", String(selectedSubItem) as CVarArg)
        do {
            let fetchedCloths = try await context.fetch(fetchRequest)
            DispatchQueue.main.async {
                self.cloths = fetchedCloths
            }
        } catch {
            throw error
        }
    }
    func saveOutfit()  async throws
    {
        //OUTFİT
        guard let uid = Auth.auth().currentUser?.uid else{return}
        let outfitRef = Firestore.firestore().collection("outfitCloths").document()
        var outfit = [String:Any]()
        outfit["id"] = outfitRef.documentID
        outfit["accessory"] = outfitCloths?.accessory
        outfit["bag"] = outfitCloths?.bag
        outfit["bottom"] = outfitCloths?.bottom
        outfit["fullbody"] = outfitCloths?.fullbody
        outfit["outwear"] = outfitCloths?.outwear
        outfit["shoe"] = outfitCloths?.shoe
        outfit["top"] = outfitCloths?.top
        outfit["userId"] = uid
        try await Firestore.firestore().collection("outfitCloths").addDocument(data: outfit)
        let outfitPostRef = Firestore.firestore().collection("outfitPost").document()
        var outfitPost = [String:Any]()
        outfitPost["id"] = outfitPostRef.documentID
        outfitPost["outfitId"] = outfitRef.documentID
        outfitPost["likes"] = 0
        outfitPost["description"] = descriptionText
        outfitPost["season"] = seasonToString( selectedSeason)
        outfitPost["userId"] = uid
        outfitPost["savedBy"] = []
        try await Firestore.firestore().collection("outfitPost").addDocument(data: outfitPost)
        DispatchQueue.main.async { [self] in
            isOutfitSaveButtonEnabled = false
        }
    }
}
