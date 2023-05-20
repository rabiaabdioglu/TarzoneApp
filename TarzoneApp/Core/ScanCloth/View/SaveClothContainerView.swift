//
//  SaveClothContainerView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI

struct SaveClothContainerView: View {
    
    @State private var newOutfit: Outfit?
    @State private var selectedSeason = "Spring"
    @State private var hashtagText = ""
    @State private var selectedItem: String = "Top"
    @State private var subItems: [String] = []
    @State private var isSubcategoryListOpen = true // Added state variable for subcategory list
    @State private var category : String = ""
    
    let tableItems = [
        "Category",
        "SubCategory",
        "Color",
        "Size",
        "Barcode",
        "Url"
        
    ]
    
    let subItemsDictionary: [String: [String]] = [
        "Üst": ["T-shirt", "Gömlek", "Ceket", /* Diğer üst seçenekleri */],
        "Alt": ["Pantolon", "Şort", "Etek", /* Diğer alt seçenekleri */],
        "Ayakkabı": ["Spor Ayakkabı", "Terlik", "Bot", /* Diğer ayakkabı seçenekleri */],
        // Diğer elemanlara ait alt seçenekler
    ]
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 1) {
                Image(MockData().cloths[0].clothImage)
                    .resizable()
                    .scaleEffect(0.7)
                
            }
            .background(Color(UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1.0)))
            
            
            Spacer()
            HStack (spacing: 0){
                
                Text("  Features")
                    .fontWeight(.light)
                    .font(Font.custom("HelveticaNeue", size: UIScreen.screenWidth * 0.04))
                
                Spacer()
                
            }
            
            
            HStack (spacing: 0){
                HStack(spacing: 0){
                    
                    VStack {
                        HStack{
                            
                            List(tableItems, id: \.self) { item in
                                Text(item)
                                    .font(.system(size: 9))
                                
                                
                            }
                            .listStyle(PlainListStyle())
                            
                            
                            List(tableItems, id: \.self) { item in
                                TextField("",text: $category)
                                    .padding(.trailing,0)
                                    .font(.system(size: 9))
                            }
                            .listStyle(PlainListStyle())
                            
                            
                            
                        }    }
                    
                    
                    
                }
                
                VStack {
                    
                    
                    
                    
                    
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.gray, lineWidth: 0.2)
            )
            Spacer()
            
            HStack {
                Button(action: {
                    // New Cloth butonuna tıklandığında yapılacak işlemler
                }) {
                    Text("New Cloth")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(8)
                }
                
                Button(action: {
                }) {
                    Text("Save")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(Color.green.opacity(0.8))
                        .cornerRadius(8)
                }
                
                Button(action: {
                }) {
                    Text("Clear")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(Color.red.opacity(0.8))
                        .cornerRadius(8)
                }
            }
            .padding(.bottom, UIScreen.screenWidth * 0.05)
            
            
        }
        .padding(.all, UIScreen.screenWidth * 0.05)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("Outfit", displayMode: .inline)
        .onAppear {
            selectedItem = "Üst"
            subItems = subItemsDictionary[selectedItem] ?? []
        }
        
        
    }
}

struct SaveClothContainerView_Previews: PreviewProvider {
    static var previews: some View {
        SaveClothContainerView()
    }
}
