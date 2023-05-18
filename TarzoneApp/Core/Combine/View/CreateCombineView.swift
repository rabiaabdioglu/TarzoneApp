//
//  ChoosenPostContainerView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI
struct CreateCombineView: View {
    @State private var newCombine: Combine?
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
        NavigationView {
            VStack {
                Spacer()
                
                VStack(spacing: 1) {
                    if newCombine != nil {
                        CombineView(combine: newCombine!)
                    } else {
                        CombineView(combine: MockData().combines[0])
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
                    .pickerStyle(SegmentedPickerStyle()) // Apply .pickerStyle modifier directly to Picker
                    .frame(width: UIScreen.screenWidth)
                    .clipped()
                    .scaleEffect(0.8)
                    .font(Font.system(size: 10)) // Change the font and size here
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.trailing, UIScreen.screenWidth * 0.1)
                
                Spacer()
                
                HStack (spacing: 0){
                    HStack(spacing: 0){
                        VStack {
                            List(tableItems, id: \.self) { item in
                                Text(item)
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
                            VStack {
                                Text("Galeri: \(selectedItem) -> \(selectedSubItem)")
                                    .font(.system(size: 10))
                            }
                        }}
                    Spacer()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.gray, lineWidth: 0.2)
                )
                
            }
            
            
            
            .padding(.all, UIScreen.screenWidth * 0.05)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Combine", displayMode: .inline)
            .onAppear {
                selectedItem = "Üst" // Set "Üst" as the initially selected main category
                subItems = subItemsDictionary[selectedItem] ?? []
            }
            
                Spacer()
            
        }
    }
}



struct CreateCombineView_Preview: PreviewProvider {
    static var previews: some View {
        CreateCombineView()
    }
}
