//
//  ImageTipsView.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 25.05.2023.
//

import SwiftUI

struct ImageTipsView: View {
    @State private var isScanSelected = false
    
    @Environment(\.presentationMode) var presentationMode
    private let tipsImageNames: [String] = ["tips1","tips2","tips3"]
    var body: some View {
        NavigationView {
            VStack(spacing: UIScreen.screenHeight * 0.07) {
                Image("logo 1")
                    .scaleEffect(0.8)
                    .padding(.top, 0)
                Text("Put a long press on the outfit.\n \n Click on share. \n \n Save the outfit photo.")
                    .font(Font.custom("HelveticaNeue-Light", size: 12))
                    .foregroundColor(Color(.darkGray))
                    .fontWeight(.semibold)
                TabView {
                    ForEach(tipsImageNames.indices, id: \.self) { index in
                        VStack {
                            Spacer()
                            Image(tipsImageNames[index])
                                .scaleEffect(0.2)
                        }
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                .cornerRadius(30)
                .padding()
                Spacer()
            }
            .background(Color(hex: "DFE6E6"))
        }
        .font(Font.custom("HelveticaNeue-Light", size: 12))
        .navigationBarItems(leading: backButton)
        .navigationBarBackButtonHidden(true)}
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

struct ImageTipsView_Previews: PreviewProvider {
    static var previews: some View {
        ImageTipsView()
    }
}
