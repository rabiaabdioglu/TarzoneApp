//
//  SavedContainerView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI

struct SavedOutfitView: View {
    var body: some View {
        
        NavigationView{
        VStack() {
            ScrollView {
                PostGridView(outfit: MockData().posts)
            }
        }
        .navigationTitle("Inspirations")
        .navigationBarTitleDisplayMode(.inline)
    
        
        
    }
    }
}

struct SavedOutfitsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedOutfitView()
    }
}
