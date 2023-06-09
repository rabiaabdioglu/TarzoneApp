//
//  CustomInputField.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 19.05.2023.
//

import SwiftUI


struct CustomInputField:View{
    let imageName: String
    let placeholderText : String
    @Binding var text : String
    var body : some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:20 , height:20)
                    .foregroundColor(Color(.darkGray))
                TextField(placeholderText,text: $text)
            }
            Divider()
                .background(Color(.darkGray))
        }
    }
}
