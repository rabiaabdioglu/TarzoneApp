//
//  OutfitView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI

struct OutfitView: View {
    
    var outfit : Outfit
    
    let width = UIScreen.screenWidth * 0.2
    
    
    var body: some View {
        
        
        VStack(alignment: .center, spacing: 20) {
            
            HStack {
                Spacer()
                
                VStack {
                    
                    Image(MockData().cloths[outfit.outwear].clothImage)
                        .resizable()
                        .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.30)
                        .scaleEffect(0.8) // İçeriği küçültmek için scaleEffect kullanın
                    
                }
                
                if MockData().cloths[outfit.dress].clothImage == ""
                {
                    VStack {
                        
                        Image(MockData().cloths[outfit.top].clothImage)
                            .resizable()
                            .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.15)
                            .scaleEffect(0.9) // İçeriği küçültmek için scaleEffect kullanın
                        
                        Image(MockData().cloths[outfit.bottom].clothImage)
                            .resizable()
                            .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.15)
                            .scaleEffect(0.9) // İçeriği küçültmek için scaleEffect kullanın
                        
                    }
                    
                }
                else {
                    VStack {
                        
                        Image(MockData().cloths[outfit.dress].clothImage)
                            .resizable()
                            .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.30)
                            .scaleEffect(0.8) // İçeriği küçültmek için scaleEffect kullanın
                        
                    }
                    
                }
                
                VStack {
                    
                    Image(MockData().cloths[outfit.accessory].clothImage)
                        .resizable()
                        .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.10)
                        .scaleEffect(0.8) // İçeriği küçültmek için scaleEffect kullanın
                    
                    
                    Image(MockData().cloths[outfit.bag].clothImage)
                        .resizable()
                        .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.10)
                        .scaleEffect(0.8) // İçeriği küçültmek için scaleEffect kullanın
                    
                    Image(MockData().cloths[outfit.shoe].clothImage)
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

struct OutfitView_Previews: PreviewProvider {
    static var previews: some View {
        OutfitView(outfit: MockData().outfits[0] )
    }
}
