//
//  TimeLineContainerView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI

struct TimeLineView: View {
    @State private var searchText: String = ""
    @StateObject private var viewModel: TimeLineViewModel
    init() {
        _viewModel = StateObject(wrappedValue: TimeLineViewModel())
    }
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    SearchBar(text: $searchText, placeholder: "Search")
                    Spacer()
                    Button(action: {
                        Task {
                            do {
                                try await viewModel.fetchOutfit()
                            } catch {
                                print("Error fetching outfit post: \(error)")
                            }
                        }
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .padding(.trailing, 10)
                    }
                }
                PostGridView(viewModel: viewModel , viewType: "TimeLineView")
            }
        }
        .navigationTitle("Timeline")
    }
}
