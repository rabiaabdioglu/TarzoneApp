
//
//  PostGridView.swift
//  Instagram-SwiftUI
//
//  Created by Pankaj Gaikar on 23/05/21.
//

import SwiftUI

struct PostGridView: View {
    
    let combine: [CombinePost]
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){

        LazyVGrid(columns: columns) {
                
                ForEach(combine) {
                    
                    CombineView(combine: $0.combine)
                        .scaledToFit()
                        .scaleEffect(0.6) // İçeriği küçültmek için scaleEffect kullanın
                        .padding(0)
                        
                }
                .frame(width: UIScreen.main.bounds.size.width / 2.5, height: UIScreen.main.bounds.size.width / 2.2)
                .padding(5)
                .background(Color(UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1.0)))


                
        }
                .padding(.trailing, 30)
                .padding(.leading, 30)
                .padding(.top, 10)
                .padding(.bottom, 10)


            }
        
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(combine: MockData().posts)
    }
}
