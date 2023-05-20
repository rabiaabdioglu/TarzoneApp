//
//  LoginRegisterView.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 19.05.2023.
//

import Foundation

import SwiftUI
struct LoginRegisterView: View {
    @State private var isLoginSelected = false
    @State private var isRegisterSelected = false
    
    var body: some View {
        VStack(spacing: 110) {
            Spacer()
            Spacer()

            Image("logo 1")
                .scaleEffect(1.2)

            VStack(spacing: 0){
                Spacer()

                Button(action: {
                    isLoginSelected = true
                }) {
                    Text("Login")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(Color.white.opacity(0.8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 1)
                                .stroke(Color.gray, lineWidth: 0.1)
                        )
                }
                .fullScreenCover(isPresented: $isLoginSelected) {
                    // Login görünümünü burada açın
                    LoginView()
                }
                
                Button(action: {
                    isRegisterSelected = true
                }) {
                    Text("Register")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(Color.white.opacity(0.8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 1)
                                .stroke(Color.gray, lineWidth: 0.1)
                        )
                }
                .fullScreenCover(isPresented: $isRegisterSelected) {
                    // Register görünümünü burada açın
                    NavigationView {
                        RegisterView()}
                }
            }

            Image("people")
                .scaleEffect(0.6)
                .padding(.bottom, 0)
        }
    }
}

struct LoginRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegisterView()
    }
}
