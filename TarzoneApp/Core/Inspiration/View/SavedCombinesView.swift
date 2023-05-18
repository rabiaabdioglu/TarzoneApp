//
//  SavedContainerView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI

struct SavedCombinesView: View {
    var body: some View {
        
        NavigationView{
        VStack() {
            ScrollView {
                PostGridView(combine: MockData().posts)
            }
        }
        .navigationTitle("Inspirations")
        .navigationBarTitleDisplayMode(.inline)
    
        
        
    }
    }
}

struct SavedCombinesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedCombinesView()
    }
}
