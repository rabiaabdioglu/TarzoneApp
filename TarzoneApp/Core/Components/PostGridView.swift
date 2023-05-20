
//
//  PostGridView.swift
//  Instagram-SwiftUI
//
//  Created by Pankaj Gaikar on 23/05/21.
//

import SwiftUI
struct PostGridView: View {
    let outfit: [OutfitPost]
    @State private var selectedPost: OutfitPost? = nil
    @State private var isPresentingChoosenPostView = false
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
                   LazyVGrid(columns: columns, spacing: nil) {
                       ForEach(outfit) { post in
                           Button(action: {
                               selectedPost = post
                               isPresentingChoosenPostView = true
                           }) {
                               Spacer()
                               OutfitView(outfit: post.outfit)
                                   .scaledToFit()
                                   .scaleEffect(0.6)
                                   .frame(width: UIScreen.main.bounds.size.width / 2.4, height: UIScreen.main.bounds.size.width / 2.4)
                                   .background(Color(UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1.0)))
                               Spacer()

                           }
                           .buttonStyle(PlainButtonStyle())
                       }

                   }.padding(.trailing, 30)
                   .padding(.leading, 30)
                   .padding(.top, 10)
                   .padding(.bottom, 10)
               }

        .fullScreenCover(item: $selectedPost) { post in
            ChoosenPostView(chosenOutfitPost: post)

        }

    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(outfit: MockData().posts)
    }
}
