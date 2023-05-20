//
//  ChoosenPostContainerView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI

struct ChoosenPostView: View {
    var chosenOutfitPost: OutfitPost
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            VStack(spacing: UIScreen.screenWidth * 0.1) {
                VStack {
                    OutfitView(outfit: chosenOutfitPost.outfit)
                        .scaledToFit()
                        .scaleEffect(1)
                        .padding(0)
                }
                .frame(width: UIScreen.main.bounds.size.width / 1.1, height: UIScreen.main.bounds.size.width / 1)
                .padding(5)
                .background(Color(UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1.0)))
                
                VStack {
                    HStack {
                        Text("Hashtag     :    ")
                        ForEach(chosenOutfitPost.hashtag, id: \.self) { hashtag in
                            Text("#" + hashtag)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, UIScreen.screenWidth * 0.2)
                    
                    HStack {
                        Text("Season      :     ")
                        Text(seasonToString(chosenOutfitPost.season))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, UIScreen.screenWidth * 0.2)
                    
                    HStack {
                        Text(chosenOutfitPost.description)
                        Spacer()
                        Text(chosenOutfitPost.description)
                    }
                    .alignmentGuide(.leading) { _ in UIScreen.main.bounds.size.width * 0.1 }
                }
                .padding(.leading, UIScreen.screenWidth * 0.1)
                
                HStack {
                    UserProfileView(user: MockData().users[chosenOutfitPost.userId])
                        .padding(.trailing, UIScreen.screenWidth * 0.1)
                    
                    
                    Spacer()
                    Text(chosenOutfitPost.likes)
                    Image(chosenOutfitPost.isLiked ? "starFill" : "star")
                        .resizable()
                        .frame(width: UIScreen.screenWidth * 0.05, height: UIScreen.screenWidth * 0.05)
                        .padding(.trailing, UIScreen.screenWidth * 0.1)
                }
                .padding(.leading, UIScreen.screenWidth * 0.1)
                .overlay(
                    Divider()
                        .background(Color.gray)
                        .padding(.bottom, UIScreen.screenWidth * 0.2)
                )
            }   .font(Font.custom("HelveticaNeue-Light", size: UIScreen.screenWidth * 0.025))
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("Outfit", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: backButton, trailing:Group {
                    if MockData().users[chosenOutfitPost.userId].id == "0" {
                        Button(action: {
                            // Delete işlemi
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                                .imageScale(.medium)
                        }
                    } else {
                        exclamationButton
                    }
                }
                )
            Spacer() // Aşağıda boşluk eklemek için Spacer kullanılır
            
            
        }}
    
    var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .imageScale(.large)
                .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
        }
    }
    
    var exclamationButton: some View {
        Button(action: {
            // Ünlem butonuna tıklanma işlemleri
        }) {
            Image(systemName: "exclamationmark.circle.fill")
                .imageScale(.large)
                .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
            
        }
    }
    
}

struct ChoosenPostView_Previews: PreviewProvider {
    static var previews: some View {
        ChoosenPostView(chosenOutfitPost: MockData().posts[1])
    }
}
