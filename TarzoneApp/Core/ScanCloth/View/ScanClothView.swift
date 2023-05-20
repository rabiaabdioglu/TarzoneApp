//
//  ScanCloth.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI

struct ScanClothView: View {
    @State private var isScanSelected = false
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        
        
        
        NavigationView {
            
            
            VStack(spacing: UIScreen.screenHeight * 0.07) {
                
                VStack(spacing: 1) {
                    
                    
                    Image("logo 1")
                        .scaleEffect(0.8)
                        .padding(.top, 0)
                    
                    
                    
                }
                
                
                VStack(spacing: 1) {
                    Image("scanhelp")
                        .resizable()
                        .scaleEffect(0.8)
                        .frame(width: UIScreen.screenWidth , height: UIScreen.screenWidth * 0.8)
                    
                    
                    
                }
                
                
                
                
                Button(action: {
                    isScanSelected = true
                }) {
                    Text("Scan")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .frame(width: UIScreen.screenWidth , height: UIScreen.screenWidth * 0.1)
                        .padding(.vertical, 8)
                        .background(Color.green.opacity(0.8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 1)
                                .stroke(Color.gray, lineWidth: 0.1)
                        )
                }
                .fullScreenCover(isPresented: $isScanSelected) {
                    // Login görünümünü burada açın
                    SaveClothContainerView()
                }
                
                
                Spacer()
                
            }
            
        }
        
           .font(Font.custom("HelveticaNeue-Light", size: 12))
           .navigationBarItems(leading: backButton)
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
