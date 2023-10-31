//
//  FeedViewModel.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 30/10/23.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    enum State {
        case loading, content
    }
    
    @Published var threads: [Thread] = []
    @Published var state: State = .loading
    
    var threadService: ThreadService
    var userService: UserService
    
    init(threadService: ThreadService = ThreadService.shared, userService: UserService = UserService.shared) {
        self.threadService = threadService
        self.userService = userService
        
        Task {
            try await fetchThreads()
        }
    }
   
    public func refreshFeed() {
        self.state = .loading
        Task {
            try? await fetchThreads()
        }
    }

    @MainActor
    private func fetchThreads() async throws {
        self.threads = try await threadService.fetchThreads()
        self.state = .content
        try await fetchUserDataForThreads()

    }
    
    @MainActor
    private func fetchUserDataForThreads() async throws {
        for i in threads.indices {
            let ownerId = self.threads[i].ownerId
            let threadUser = try await userService.fetchUser(withUis: ownerId)
        
            self.threads[i].user = threadUser
        }
    }
}
