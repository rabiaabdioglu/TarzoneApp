//
//  LoginContainerView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI

struct LoginView: View {
    
    
    @State private var warningMessage = ""
    @StateObject var viewModel = LoginViewModel()
    
    
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
                
                Spacer()

                
              
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
                        Spacer()

                   
                        VStack(spacing: 10){
                            
                            TextField("Enter your email",text: $viewModel.email)
                                .autocapitalization(.none)
                            Divider()
                                .background(Color(.darkGray))
                            
                            Spacer()
                            
                            SecureField("Enter your password",text: $viewModel.password)
                            Divider()
                                .background(Color(.darkGray))
                            
                        }
                    
                        
                  
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 30)

                    HStack{
                        Spacer()
                        Button{
                            
                            
                        }label: {
                            Text("Forgot password?")
                                .font(.caption)
                                .foregroundColor(Color.gray)
                                .padding(.top ,10)
                                .padding(.trailing, 20)
                                
                            }

                        
                    }
                    
                    

                    Spacer()

                    Button(action: {
                        
                        Task{try await viewModel.signIn()
                        }
                        
                    }) {
                        
                        Text("Login")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background(Color.green.opacity(0.8))
                       
                    }
                    .shadow(color: .gray.opacity(0.5) , radius: 10 ,x: 0,y: 0)
                    
                    Spacer()

                    NavigationLink{
                       RegisterView()
                            .navigationBarBackButtonHidden(true)
                            
                    }label: {
                        Text("Don't have an account ?")
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

struct Loginiew_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
