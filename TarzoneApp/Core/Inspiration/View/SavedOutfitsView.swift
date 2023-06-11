//
//  SavedContainerView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI

struct SavedOutfitView: View {
    @State private var searchText: String = ""
    @StateObject private var viewModel: TimeLineViewModel
    init() {
        _viewModel = StateObject(wrappedValue: TimeLineViewModel())
    }
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Spacer()
                    Text("Inspiration")
                        .font(Font.custom("HelveticaNeue", size: UIScreen.screenWidth * 0.03))
                        .padding(0.1)
                        .foregroundColor(.black)
                    Spacer()
                    Button(action: {
                        Task {
                            do {
                                try await viewModel.fetchOutfitInspirations()
                            } catch {
                                print("Error fetching outfit post: \(error)")
                            }
                        }
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .padding(.trailing, 20)
                    }
                }
                PostGridView(viewModel: viewModel, viewType: "SavedOutfitView")
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
