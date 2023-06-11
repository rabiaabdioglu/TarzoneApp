//
//  CircularProfileImageView.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 23.05.2023.
//

import SwiftUI
import Kingfisher

struct CircularProfileImageView: View {
    let user : User
    var body: some View {
        if let imageUrl = user.userImage{
            KFImage(URL(string: imageUrl))
                .resizable()
                .cornerRadius(100)
                .frame(width: UIScreen.screenWidth * 0.13, height: UIScreen.screenWidth * 0.13, alignment: .center)
                .clipped()
                .padding(.leading, 5)
        }
        else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .cornerRadius(100)
                .frame(width: UIScreen.screenWidth * 0.13, height: UIScreen.screenWidth * 0.13, alignment: .center)
                .clipped()
                .padding(.leading, 5)
                .foregroundColor(Color(.systemGray4))
        }
    }
}

