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
    
    var userService: AnyUserService
    
    init(userService: AnyUserService = UserService.shared) {
        self.userService = userService
        setupSubscribers()
    }
    
    public func refreshTriggered() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        userService.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
        
    }
    
}
