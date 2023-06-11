//
//  ClothView.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 1.06.2023.
//

import SwiftUI
import Kingfisher
import Firebase

struct ChoosenClothView: View {
    @StateObject private var viewModel = ChoosenClothViewModel()
    @Environment(\.presentationMode) var presentationMode
    var cloth : Cloth
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 1) {
                    Spacer()
                    KFImage(URL(string: cloth.clothImage))
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.screenWidth * 0.8, height: UIScreen.screenHeight * 0.3)
                    Spacer()
                }
                .frame(width: UIScreen.screenWidth , height: UIScreen.screenHeight * 0.35)
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(hex: "#DEDEDE"), lineWidth: 0.05)
                        .shadow(color: Color(hex: "#DEDEDE").opacity(0.5), radius: 8, x: 0, y: 0)
                )
                //Clothing FEATURES  Area
                HStack(spacing: 0) {
                    Text("  Features")
                        .fontWeight(.light)
                        .font(Font.custom("HelveticaNeue", size: UIScreen.screenWidth * 0.04))
                    Spacer()
                }
                HStack(spacing: 0) {
                    VStack {
                        HStack(spacing: 0) {
                            List(viewModel.tableItems, id: \.self) { item in
                                Text(item)
                                    .font(.system(size: 9))
                            }
                            .scrollDisabled(true)
                            .listStyle(PlainListStyle())
                            Divider()
                            List{
                                Text(MockData().categories[cloth.idCategory].name)
                                    .font(Font.custom("HelveticaNeue-Light", size: 10))
                                    .foregroundColor(.black)
                                    .frame(width: UIScreen.screenWidth * 0.4,alignment: .leading)
                                let subCategoryIndex = MockData().categories[cloth.idCategory].subcategories.firstIndex(where: { $0.id == cloth.idSubCategory }) ?? 0
                                Text(MockData().categories[cloth.idCategory].subcategories[subCategoryIndex].name)
                                    .font(Font.custom("HelveticaNeue-Light", size: 10))
                                    .foregroundColor(.black)
                                    .frame(width: UIScreen.screenWidth * 0.4,alignment: .leading)
                                Text(cloth.color)
                                Text(cloth.size)
                                Text(cloth.url)
                                HStack {
                                    ForEach(cloth.hashtags, id: \.self) { tag in
                                        Text(tag)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 4)
                                            .background(Color.gray)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 0.2))
                                    }
                                }
                            }
                            .font(Font.custom("HelveticaNeue-Light", size: 10))
                            .foregroundColor(.black)
                            .scrollDisabled(true)
                            .font(.system(size: 9))
                            .listStyle(PlainListStyle())
                        }
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.gray, lineWidth: 0.2)
                )
                Spacer()
                Text(viewModel.message)
                    .font(.system(size: 12))
                    .foregroundColor(.pink)
                    .padding(.vertical, 8)
                //Buttons
                HStack {
                    if cloth.userId == Auth.auth().currentUser?.uid {
                        Button(action: {
                            Task {
                                do {
                                    await viewModel.deleteClothFromCloset(cloth : cloth)
                                }
                            }
                        }) {
                            Text("Delete cloth from your closet")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .background(Color.blue.opacity(0.8))
                                .cornerRadius(8)
                        }
                        .disabled(!viewModel.isButtonEnabled)
                    }
                    else{
                        Button(action: {
                            Task {
                                do {
                                    try await viewModel.saveClothToCloset(cloth : cloth)
                                } catch {
                                    print("Error: \(error)")
                                }
                            }
                        }) {
                            Text("Save to your closet")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .background(Color.green.opacity(0.8))
                                .cornerRadius(8)
                        }.disabled(!viewModel.isButtonEnabled)
                    }
                }
                .padding(.bottom, UIScreen.screenWidth * 0.05)
            }
            .font(Font.custom("HelveticaNeue-Light", size: 12))
            .padding(.all, UIScreen.screenWidth * 0.02)
            .navigationBarItems(leading: backButton)
            .navigationBarBackButtonHidden(true)
        }
    }
    var backButton: some View {
        return AnyView(
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
            }
        )
    }
}

