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
        do {
            self.threads = try await threadService.fetchThreads()
            self.state = .content
        } catch ThreadServiceError.failedToRetriveDataFromCloud {
            print("Failed to retrive Data")
        } catch {
            print("Another Error")
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
