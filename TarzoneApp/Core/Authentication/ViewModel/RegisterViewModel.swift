//
//  RegisterViewModel.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 19.05.2023.
//

import Foundation
import FirebaseAuth


class RegisterViewModel: ObservableObject{
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        DispatchQueue.main.async {
            self.username = ""
            self.email = ""
            self.password = ""
        }
    }

    
    
}
