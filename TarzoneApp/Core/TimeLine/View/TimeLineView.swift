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
        NavigationView{
            
            VStack{
                ScrollView {
                    SearchBar(text: $searchText, placeholder: "Search")
                    PostGridView(combine: MockData().posts)
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
                }  }}}

    
}

struct TimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineView()
    }
}
