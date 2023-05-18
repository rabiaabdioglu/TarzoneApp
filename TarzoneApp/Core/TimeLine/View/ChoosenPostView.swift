//
//  ChoosenPostContainerView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI

struct ChoosenPostView: View {
    var chosenCombinePost: CombinePost
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(spacing: UIScreen.screenWidth * 0.1) {
                VStack {
                    CombineView(combine: chosenCombinePost.combine)
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
                        ForEach(chosenCombinePost.hashtag, id: \.self) { hashtag in
                            Text("#" + hashtag)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, UIScreen.screenWidth * 0.2)
                    
                    HStack {
                        Text("Season      :     ")
                        Text(seasonToString(chosenCombinePost.season))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, UIScreen.screenWidth * 0.2)
                    
                    HStack {
                        Text(chosenCombinePost.description)
                        Spacer()
                        Text(chosenCombinePost.description)
                    }
                    .alignmentGuide(.leading) { _ in UIScreen.main.bounds.size.width * 0.1 }
                }
                .padding(.leading, UIScreen.screenWidth * 0.1)
                
                HStack {
                    UserProfileView(user: MockData().users[chosenCombinePost.userId])
                        .padding(.trailing, UIScreen.screenWidth * 0.1)
                    
                    Spacer()
                    Text(chosenCombinePost.likes)
                    Image(chosenCombinePost.isLiked ? "starFill" : "star")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.trailing, UIScreen.screenWidth * 0.1)
                }
                .padding(.leading, UIScreen.screenWidth * 0.1)
                .overlay(
                    Divider()
                        .background(Color.gray)
                        .padding(.bottom, 100)
                )
            }   .font(Font.custom("HelveticaNeue-Light", size: 15))
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("Combine", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: backButton, trailing:Group {
                    if MockData().users[chosenCombinePost.userId].isMe {
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
            
        }
    }
    
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
        ChoosenPostView(chosenCombinePost: MockData().posts[1])
    }
}
