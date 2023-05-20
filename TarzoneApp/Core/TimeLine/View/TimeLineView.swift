//
//  TimeLineContainerView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI

struct TimeLineView: View {
    
    private let searchStrings: [String] = []
    @State private var searchText : String = ""

    var body: some View {
            
            VStack{
                ScrollView {
                    SearchBar(text: $searchText, placeholder: "Search")
                    let userPosts = MockData().posts.filter { $0.userId != 0}

                    PostGridView(outfit: userPosts)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    ZStack {
                        Image("logo 1")
                            .resizable()
                            .frame(width: UIScreen.screenWidth * 0.25, height: nil)
                        Text("")
                            .frame(maxWidth: .infinity)
                            .frame(height: 0)
                    }
                }  }}

    
}

struct TimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineView()
    }
}
