//
//  CombineView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI

struct CombineView: View {
    
    var combine : Combine
    
    let width = UIScreen.screenWidth * 0.2
    
    
    var body: some View {
        
        
        VStack(alignment: .center, spacing: 20) {
            
            HStack {
                Spacer()
                
                VStack {
                    
                    Image(combine.outwear.clothImage)
                        .resizable()
                        .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.30)
                        .scaleEffect(0.8) // İçeriği küçültmek için scaleEffect kullanın
                    
                }
                
                if combine.dress.clothImage == ""
                {
                    VStack {
                        
                        Image(combine.top.clothImage)
                            .resizable()
                            .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.15)
                            .scaleEffect(0.9) // İçeriği küçültmek için scaleEffect kullanın
                        
                        Image(combine.bottom.clothImage)
                            .resizable()
                            .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.15)
                            .scaleEffect(0.9) // İçeriği küçültmek için scaleEffect kullanın
                        
                    }
                    
                }
                else {
                    VStack {
                        
                        Image(combine.dress.clothImage)
                            .resizable()
                            .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.30)
                            .scaleEffect(0.8) // İçeriği küçültmek için scaleEffect kullanın
                        
                    }
                    
                }
                
                VStack {
                    
                    Image(combine.accessory.clothImage)
                        .resizable()
                        .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.10)
                        .scaleEffect(0.8) // İçeriği küçültmek için scaleEffect kullanın
                    
                    
                    Image(combine.bag.clothImage)
                        .resizable()
                        .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.10)
                        .scaleEffect(0.8) // İçeriği küçültmek için scaleEffect kullanın
                    
                    Image(combine.shoe.clothImage)
                        .resizable()
                        .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.10)
                        .scaleEffect(0.8) // İçeriği küçültmek için scaleEffect kullanın
                    
                }
                Spacer()
                
                
            }
            
        }
        .padding(10)
        .frame(width: nil , height:UIScreen.screenHeight * 0.30)
        
    }
}

struct CombineView_Previews: PreviewProvider {
    static var previews: some View {
        CombineView(combine: MockData().combines[0] )
    }
}
