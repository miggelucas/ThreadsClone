//
//  ProfileViewModel.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 19/10/23.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    var userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol = UserService.shared) {
        self.userService = userService
        setupSubscribers()
    }
    
    deinit {
        cancellables.removeAll()
    }
    
    public func refreshTriggered() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        userService.currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
        
    }
    
}
