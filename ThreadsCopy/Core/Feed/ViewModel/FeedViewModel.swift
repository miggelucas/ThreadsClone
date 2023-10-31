//
//  FeedViewModel.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 30/10/23.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    @Published var threads: [Thread] = []
    
    var threadService: ThreadService
    var userService: UserService
    
    init(threadService: ThreadService = ThreadService(), userService: UserService = UserService.shared) {
        self.threadService = threadService
        self.userService = userService
    }
   
    public func refreshFeed() {
        Task {
            try? await fetchThreads()
        }
    }

    public func viewDidAppear() {
        Task {
            try? await fetchThreads()
        }
    }
    
    @MainActor
    private func fetchThreads() async throws {
        self.threads = try await threadService.fetchtThreads()
        try await fetchUserDataForThreads()
        
    }
    
    @MainActor
    private func fetchUserDataForThreads() async throws {
        for i in 0 ..< threads.count {
            let ownerId = self.threads[i].ownerId
            let threadUser = try await userService.fetchUser(withUis: ownerId)
        
            self.threads[i].user = threadUser
        }
    }
    
}
