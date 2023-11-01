//
//  UserContentListViewModel.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 31/10/23.
//

import Foundation

class UserContentListViewModel: ObservableObject {
    
    @Published var threads: [Thread] = []
    
    var user: User
    var threadService: ThreadServiceProtocol
    
    init(user: User, threadService: ThreadServiceProtocol = ThreadService.shared) {
        self.user = user
        self.threadService = threadService
        
        Task {
            try await fetchThreads()
        }
    }
    
    @MainActor
    func fetchThreads() async throws {
        threads = try await threadService.fetchUserThreads(uid: user.id)
        
        for i in threads.indices {
            threads[i].user = self.user
        }
        
        self.threads = threads
    }
    
}
