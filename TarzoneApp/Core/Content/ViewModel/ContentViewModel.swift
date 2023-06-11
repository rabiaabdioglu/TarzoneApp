//
//  ContentViewModel.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 19.05.2023.
//

import Foundation
import Firebase
import Combine

@MainActor
class ContentViewModel: ObservableObject{
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    @Published var userSession : FirebaseAuth.User?
    @Published var currentUser : User?

    init(){
            setupSubscribers()
    }
    func setupSubscribers(){
        service.$userSession
            .receive(on: DispatchQueue.main) // Ana iş parçacığında güncelleme yap
            .sink{ [weak self] userSession in
                self?.userSession = userSession
            }
            .store(in: &cancellables)
            service.$currentUser
            .receive(on: DispatchQueue.main) // Ana iş parçacığında güncelleme yap
            .sink{ [weak self] currentUser in
                self?.currentUser = currentUser
            }
            .store(in: &cancellables)
    }

}
