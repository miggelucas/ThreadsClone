//
//  CurrentUserProfileViewModel.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 20/10/23.
//

import Foundation
import Combine


class CurrentUserProfileViewModel: ObservableObject {
    
    @Published var currentUser: User?
    
    var userService: AnyUserService
    
    private var cancellables = Set<AnyCancellable>()
    
    init(userService: AnyUserService = UserService.shared) {
        self.userService = userService
        setupSubscribers()
    }
    
    public func refreshTriggered() {
        setupSubscribers()
    }
    
    public func settingsButtonPressed() {
        
    }
    
    private func setupSubscribers() {
        userService.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
        
    }

    
}
