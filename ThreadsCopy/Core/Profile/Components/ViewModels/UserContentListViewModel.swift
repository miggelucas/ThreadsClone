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
    
    init(user: User, threadService: ThreadServiceProtocol = ThreadService()) {
        self.user = user
        self.threadService = threadService
        
        Task {
            await fetchThreads()
        }
    }
    
    @MainActor
    func fetchThreads() async {
        
        let result = await threadService.fetchUserThreads(uid: user.id)
        
        switch result {
        case .success(let recivedThreads):
            
            var threads = recivedThreads
            
            for i in threads.indices {
                threads[i].user = self.user
            }
            
            self.threads = threads
        case .failure(_):
            print("DEBUG: Failed To retriveData")
            
        }
       
    }
    
}
