//
//  PostGridView.swift
//  Instagram-SwiftUI
//

import SwiftUI

struct PostGridView: View {
    @State private var selectedPost: Outfit? = nil
    @State private var isPresentingChoosenPostView = false
    @ObservedObject var viewModel: TimeLineViewModel
    @State var outfit = [Outfit]()
    var viewType = ""
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        LazyVGrid(columns: columns, spacing: nil) {
            if viewModel.isLoading {
                VStack(alignment: .center, spacing: nil) {
                    Spacer()
                    ProgressView()
                        .padding(.top, UIScreen.main.bounds.size.height / 3)
                        .padding(.leading, UIScreen.main.bounds.size.width / 2.5)
                        .task {
                            do {
                                try await Task.sleep(nanoseconds: 2 * 1_000_000_000) // Delay for 2 seconds
                                DispatchQueue.main.async {
                                    viewModel.isLoading = false
                                }
                            } catch {
                                print("Error sleeping: \(error)")
                            }
                        }
                                                    Spacer()
                }
            } else if !viewModel.outfit.isEmpty {
                Posts()
                    .transition(.identity)
                    .opacity(1) // Adjust opacity based on isClickable
                        }
        }
        .padding(.trailing, 30)
        .padding(.leading, 30)
        .padding(.top, 10)
        .padding(.bottom, 10)
        .fullScreenCover(item: $selectedPost) { outfit in
            if let outfitPost = viewModel.outfitPost, let ownerUser = viewModel.ownerUser {
                ChoosenPostView(chosenOutfitPost: outfitPost, ownerUser: ownerUser, viewModel: viewModel)
                    .onDisappear {
                        selectedPost = nil
                        viewModel.resetSelectedPost()
                    }
                    .onAppear {
                        Task{
                            do {
                                try await viewModel.fetchOutfitPost(chosenOutfit: selectedPost!)
                                                                                    } catch {
                                print("Error fetching outfit post: \(error)")
                            }
                        }
                                        }
            } else {
                Spacer()
                ProgressView()
                    .task {
                        do {
                            try await viewModel.fetchOutfitPost(chosenOutfit: outfit)
                        } catch {
                            print("Error fetching outfit post: \(error)")
                        }
                    }
                Spacer()
                        }
        }
            }
    @ViewBuilder
    private func Posts() -> some View {
        var posts: [Outfit] = []
            if viewType == "TimeLineView" {
            posts = viewModel.outfit
        } else if viewType == "InspirationView" {
            posts = viewModel.inspirationOutfit
        } else {
            posts = viewModel.profileOutfit
        }
            return Group { // Add return statement here
            ForEach(posts, id: \.self) { post in
                Button(action: {
                    selectedPost = post
                    isPresentingChoosenPostView = true
                }) {
                    Spacer()
                    OutfitView(outfit: post, isClickable: false)
                        .opacity(1)
                        .scaledToFit()
                        .scaleEffect(0.6)
                        .frame(width: UIScreen.main.bounds.size.width / 2.4, height: UIScreen.main.bounds.size.width / 2.4)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(hex: "#DEDEDE"), lineWidth: 0.05)
                                .shadow(color: Color(hex: "#DEDEDE").opacity(0.5), radius: 8, x: 0, y: 0)
                        )
                    Spacer()
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}
