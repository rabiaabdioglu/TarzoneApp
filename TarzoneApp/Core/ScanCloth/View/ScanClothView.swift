//
//  ScanCloth.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import CoreML

struct ScanClothView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = ImagePickerViewModel()
    @State private var predictionIndex = Int()
    var body: some View {
        NavigationView {
            VStack(spacing: UIScreen.screenHeight * 0.07) {
                VStack(spacing: 1) {
                    Image("logo 1")
                        .scaleEffect(0.8)
                        .padding(.top, 0)
                }
                VStack(spacing: 1) {
                    if let image = viewModel.selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.screenWidth * 0.8, height: UIScreen.screenWidth * 0.8)
                    } else {
                        Image("scanhelp")
                            .resizable()
                            .scaleEffect(0.8)
                            .frame(width: UIScreen.screenWidth , height: UIScreen.screenWidth * 0.8)
                    }
                    Text("Scan & Save Your Cloths")
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "4B5663"))
                        .fontWeight(.bold)
                    Spacer()
                    Text("*Make sure that the outfit image does not have a background.")
                        .font(.system(size: 10))
                        .foregroundColor(Color(hex: "4B5663"))
                        .fontWeight(.bold)
                }
                HStack(spacing: UIScreen.screenWidth * 0.05) {
                    VStack {
                        VStack {
                            NavigationLink{
                                ImageTipsView()
                            }label: {
                                Text("How can I remove the background?")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color(hex: "F5CF6C"))
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                            }  .shadow(color: .gray.opacity(0.5) , radius: 10 ,x: 0,y: 0)
                            Button(action: {
                                viewModel.selectImage(sourceType: .photoLibrary)
                            }) {
                                Text("Choose image")
                                    .font(.system(size: 16))
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(Color(hex: "F5CF6C"))
                                    .cornerRadius(10)
                            } .shadow(color: .gray.opacity(0.2) , radius: 10 ,x: 0,y: 0)
                        }
                        Spacer()
                        if viewModel.selectedImage != nil {
                            Button(action: {
                                viewModel.predictImage()
                            }) {
                                Text("Scan")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                                    .background(Color.green.opacity(0.8))
                            }
                            .shadow(color: .gray.opacity(0.5) , radius: 10 ,x: 0,y: 0)
                            .padding(.top, 10)
                        }
                    }
                }
                Spacer()
            }
        }
        .font(Font.custom("HelveticaNeue-Light", size: 12))
        .navigationBarItems(leading: backButton)
        .navigationBarBackButtonHidden(true)
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
struct ScanClothView_Previews: PreviewProvider {
    static var previews: some View {
        ScanClothView()
    }
}

