//
//  TimeLineContainerView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI

struct TimeLineContainerView: View {
    
    private let searchStrings: [String] = []
    @State private var searchText : String = ""

    var body: some View {
       
        VStack{
            Image("logo 1")
                .clipped()
                .scaleEffect(0.6)
                .frame(width: UIScreen.screenWidth * 0.5, height:  UIScreen.screenHeight * 0.03, alignment: .center)
           
            ScrollView {
               
                SearchBar(text: $searchText, placeholder: "Search")
                PostGridView(combine: MockData().posts)
            }

        }
        .background(Color(red: 0.91, green: 0.94, blue: 0.93))

     
    }

        
}

struct TimeLineContainerView_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineContainerView()
    }
}
