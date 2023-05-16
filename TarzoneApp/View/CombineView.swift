//
//  CombineView.swift
//  Tarzone
//
//  Created by Rabia Abdioğlu on 8.04.2023.
//

import SwiftUI

struct CombineView: View {
    
    let combine : Combine
    
    let width = UIScreen.screenWidth * 0.2

    
    var body: some View {
      
        VStack(alignment: .center, spacing: 20) {
           
            HStack {
                VStack {
                    
                    Image(combine.outwearId.clothImage)
                        .resizable()
                        .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.30)
                        .scaleEffect(0.8) // İçeriği küçültmek için scaleEffect kullanın

                }

                if combine.dressId.clothImage == ""
                {
                    VStack {
                        
                        Image(combine.topId.clothImage)
                            .resizable()
                            .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.15)
                            .scaleEffect(0.9) // İçeriği küçültmek için scaleEffect kullanın

                        Image(combine.bottomId.clothImage)
                            .resizable()
                            .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.15)
                            .scaleEffect(0.9) // İçeriği küçültmek için scaleEffect kullanın

                    }
                    
                }
                else {
                    VStack {
                        
                        Image(combine.dressId.clothImage)
                            .resizable()
                            .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.30)
                            .scaleEffect(0.8) // İçeriği küçültmek için scaleEffect kullanın

                    }
                    
                }

                VStack {
                    
                    Image(combine.accessoryId.clothImage)
                        .resizable()
                        .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.10)
                        .scaleEffect(0.8) // İçeriği küçültmek için scaleEffect kullanın


                    Image(combine.bagId.clothImage)
                        .resizable()
                        .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.10)
                        .scaleEffect(0.8) // İçeriği küçültmek için scaleEffect kullanın

                    Image(combine.shoeId.clothImage)
                        .resizable()
                        .frame(width: UIScreen.screenWidth * 0.2, height:UIScreen.screenHeight * 0.10)
                        .scaleEffect(0.8) // İçeriği küçültmek için scaleEffect kullanın

                }
                

            }
 
        }
        .frame(width: nil , height:UIScreen.screenHeight * 0.30)
        
    }
}

struct CombineView_Previews: PreviewProvider {
    static var previews: some View {
        CombineView(combine: MockData().combines[0] )
    }
}
