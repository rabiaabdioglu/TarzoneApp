//
//  RegisterContainerView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var viewModel : RegisterViewModel
    @State private var password = ""
    @State private var warningMessage = ""
    var body: some View {
        NavigationView {
            VStack(spacing: UIScreen.screenHeight * 0.07) {
                Spacer()
                VStack(spacing: 1) {
                    Image("logo 1")
                        .scaleEffect(0.8)
                        .padding(.top, 0)
                    Spacer()
                }
                VStack(spacing: 5){
                    VStack(spacing: 5){
                        if warningMessage != ""{
                            HStack{
                                Text(warningMessage)
                                    .foregroundColor(Color.red)
                                    .padding(.leading,0)
                                Spacer()
                            }
                        }
                        CustomInputField(imageName: "person", placeholderText: "UserName", text: $viewModel.username)
                        Spacer()
                        CustomInputField(imageName: "envelope", placeholderText: "Email", text: $viewModel.email)
                        Spacer()
                        CustomInputField(imageName: "lock", placeholderText: "Password", text: $viewModel.password)
                        Spacer()
                        CustomInputField(imageName: "lock", placeholderText: "Confirm Password", text: $password)
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 30)
                    HStack{
                        Text("I confirm Terms and Rules")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                            .padding(.top ,10)
                            .padding(.leading, 20)
                        Spacer()
                    }
                    Spacer()
                    Button(action: {
                        Task{
                            try await     viewModel.createUser()
                        }
                    }) {
                        Text("Register")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background(Color.green.opacity(0.8))
                    }
                    .shadow(color: .gray.opacity(0.5) , radius: 10 ,x: 0,y: 0)
                    Spacer()
                    NavigationLink{
                        LoginView()
                            .navigationBarBackButtonHidden(true)
                    }label: {
                        Text("Already have an account ?")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                            .padding(.top ,10)
                            .padding(.trailing, 20)
                    }
                }
                Image("people")
                    .scaleEffect(0.6)
                    .padding(.bottom, 0)
            }
            .font(Font.custom("HelveticaNeue-Light", size: 12))
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(RegisterViewModel())
    }
}
