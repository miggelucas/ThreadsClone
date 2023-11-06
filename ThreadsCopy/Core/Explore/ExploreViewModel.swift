//
//  ExploreViewModel.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 19/10/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published private var users: [User] = []
    @Published var searchText: String = ""
    
    public var filterdUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            return users.filter { user in
                user.fullName.contains(searchText) &&
                user.username.contains(searchText)
            }
        }
    }
    
    var userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol = UserService.shared) {
        self.userService = userService
        Task {
            try await fecthUSers()
        }
    }
    
    public func refreshTriggered() {
        Task {
           try await fecthUSers()
        }
      
    }
    
    @MainActor
    private func fecthUSers() async throws {
        self.users = try await userService.fetchUsers()
    }
    
    
}
