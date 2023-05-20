//
//  ContentView.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 1.05.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var  viewModel = ContentViewModel()
    @StateObject  var registrationViewModel = RegisterViewModel()

    var body: some View {
        Group{
            
            if viewModel.userSession == nil
            {
                LoginView()
                    .environmentObject(registrationViewModel)
            }
            else if let currentUser = viewModel.currentUser{
                TabbarView(user: currentUser)

                
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
