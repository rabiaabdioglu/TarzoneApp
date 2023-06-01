//
//  ChoosenPostContainerView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI
struct CreateOutfitView: View {
    @State private var newOutfit: Outfit?
    @State private var selectedSeason = "Spring"
    @State private var hashtagText = ""
    @State private var selectedItem: String = "Üst"
    @State private var subItems: [String] = []
    @State private var isSubcategoryListOpen = true // Added state variable for subcategory list
    
    let tableItems = [
        "Üst",
        "Alt",
        "Ayakkabı",
        // Diğer elemanlar
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
                    if newOutfit != nil {
                        OutfitView(outfit: newOutfit!)
                    } else {
                        OutfitView(outfit: MockData().outfits[0])
                    }
                }
                .background(Color(UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1.0)))
                
                Spacer()
                
                HStack {
                    Text("Hashtag     :    ")
                    TextField("Enter hashtag (max 5)", text: $hashtagText)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .foregroundColor(.black)
                }
                .font(Font.custom("HelveticaNeue-Light", size: 10))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.trailing, UIScreen.screenWidth * 0.2)
                
                HStack {
                    Picker("Select season", selection: $selectedSeason) {
                        Text("Spring/Summer").tag(Seasons.Spring_Summer)
                        Text("Fall/Winter").tag(Seasons.Fall_Winter)
                        Text("Resort").tag(Seasons.Resort)
                        Text("Pre-Fall").tag(Seasons.Pre_Fall)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: UIScreen.screenWidth)
                    .clipped()
                    .scaleEffect(0.8)
                    .font(Font.system(size: 10))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.trailing, UIScreen.screenWidth * 0.1)
                
                Spacer()
                
                HStack (spacing: 0){
                    HStack(spacing: 0){
                        VStack {
                            List(0..<MockData().categories.count, id: \.self) { item in
                                Text(MockData().categories[item].name)
                                    .font(.system(size: 8))
                                    .onTapGesture {
                                        
                                        selectedItem = item
                                        subItems = subItemsDictionary[item] ?? []
                                        isSubcategoryListOpen = true
                                    }
                            }
                            .listStyle(PlainListStyle())
                        }
                        .padding(0)
                        
                        
                        VStack {
                            List(subItems, id: \.self) { subItem in
                                Text(subItem)
                                    .font(.system(size: 8))
                                
                            }
                            .listStyle(PlainListStyle())
                            
                        }
                        .padding(0)
                        
                    }
                    .padding(0)
                    .frame(width: UIScreen.screenWidth * 0.35)
                    
                    
                    Spacer()
                   
                   
                    ScrollView(.vertical) {
                        if let selectedSubItem = subItems.first {
                            VStack() {
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                                    ForEach(MockData().cloths) { cloth in
                                        Image(cloth.clothImage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 100)
                                            .frame(width: UIScreen.screenWidth * 0.15)

                                    }
                                }
                            }
                            .padding(.top,20)
                        }
                    }
                    Spacer()
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



struct CreateOutfitView_Preview: PreviewProvider {
    static var previews: some View {
        CreateOutfitView()
    }
}
