//
//  OutfitView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI
import Kingfisher

struct OutfitView: View {
    var isClickable = false
    @State private var isPresentingChoosenClothView = false
    @State private var selectedCloth: Cloth? = nil
    var outfit: Outfit
    let width = UIScreen.screenWidth * 0.2
    @StateObject var viewModel: TimeLineViewModel
    init(outfit: Outfit, isClickable: Bool) {
        self.outfit = outfit
        self.isClickable = isClickable
        self._viewModel = StateObject(wrappedValue: TimeLineViewModel())
    }
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            if !viewModel.cloths.isEmpty {
                HStack {
                    Spacer()
                    VStack {
                        if let cloth = viewModel.cloths.first(where: { $0.idCategory == 4 }) {
                            clothImage(scale: 0.3, cloth: cloth)
                        }
                    }
                    if outfit.fullbody == "" {
                        VStack {
                            if let cloth = viewModel.cloths.first(where: { $0.idCategory == 6 }) {
                                clothImage(scale: 0.15, cloth: cloth)
                            }
                            if let cloth = viewModel.cloths.first(where: { $0.idCategory == 2 }) {
                                clothImage(scale: 0.15, cloth: cloth)
                            }
                        }
                    } else {
                        VStack {
                            if let cloth = viewModel.cloths.first(where: { $0.idCategory == 3 }) {
                                clothImage(scale: 0.3, cloth: cloth)
                            }
                        }
                    }
                    VStack {
                        if let cloth = viewModel.cloths.first(where: { $0.idCategory == 0 }) {
                            clothImage(scale: 0.1, cloth: cloth)
                        }
                        if let cloth = viewModel.cloths.first(where: { $0.idCategory == 1 }) {
                            clothImage(scale: 0.1, cloth: cloth)
                        }
                        if let cloth = viewModel.cloths.first(where: { $0.idCategory == 5 }) {
                            clothImage(scale: 0.1, cloth: cloth)
                        }
                    }
                    Spacer()
                }
                .padding(10)
                .frame(width: nil, height: UIScreen.screenHeight * 0.30)
            } else {
                Spacer()
                ProgressView()
                Spacer()
            }
        }
        .onAppear() {
            Task {
                await viewModel.fetchOutfitCloths(outfitData: outfit)
            }
        }
        .fullScreenCover(item: $selectedCloth) { cloth in
            ChoosenClothView(cloth: cloth)
                .onDisappear(){
                    selectedCloth = nil
                }
        }
    }
    @ViewBuilder
    func clothImage(scale: Double, cloth: Cloth) -> some View {
        Button(action: {
            selectedCloth = cloth
            isPresentingChoosenClothView = true
        }) {
            KFImage(URL(string: cloth.clothImage))
                .resizable()
                .frame(width: width, height: UIScreen.screenHeight * CGFloat(scale))
                .scaleEffect(0.8)
                .contentShape(Rectangle())
        }
        .transition(.identity)
        .onTapGesture {
            if isClickable {
                // Tıklanabilir durumda işlemleri burada gerçekleştirin
                selectedCloth = cloth
                isPresentingChoosenClothView = true
            }
        }
        .disabled(!isClickable) // Tıklanabilirlik durumuna bağlı olarak butonun etkinliğini ayarladım
        .foregroundColor(isClickable ? .primary : .secondary) // Pasif durumda içeriğin rengini ayarladım
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.clear, lineWidth: isClickable ? 0.05 : 0) // Pasif durumda kenarlık kalınlığını ayarladım
        )
    }
}
