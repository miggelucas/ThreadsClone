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
    
    var threadService: ThreadServiceProtocol
    var userService: UserServiceProtocol
    
    init(threadService: ThreadServiceProtocol = ThreadService(), userService: UserServiceProtocol = UserService.shared) {
        self.threadService = threadService
        self.userService = userService
        
        Task {
            await fetchThreads()
        }
    }
    
    public func refreshFeed() async {
        self.state = .loading
        
        await fetchThreads()
        
    }
    
    @MainActor
    func fetchThreads() async {
        let result = await threadService.fetchThreads()
        
        switch result {
        case .success(let recivedThreads):
            self.threads = recivedThreads
            self.state = .content
            
        case .failure(_):
           print("DEBUG: Failed to fetch Data")
        }
        
        
        
        await fetchUserDataForThreads()
        
    }
    
    @MainActor
    private func fetchUserDataForThreads() async {
        for i in threads.indices {
            let ownerId = self.threads[i].ownerId
            let threadUser = try? await userService.fetchUser(withUis: ownerId)
            
            self.threads[i].user = threadUser
        }
    }
}
