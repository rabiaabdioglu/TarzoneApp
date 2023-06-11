//
//  CurrenUserProfileViewModel.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 5.06.2023.
//

import Foundation

class CurrentUserProfileViewModel: ObservableObject {
    @Published var user: User
      init(user: User) {
        self.user = user
    }
}
