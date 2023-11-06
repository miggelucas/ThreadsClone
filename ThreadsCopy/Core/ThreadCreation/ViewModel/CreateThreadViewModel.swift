//
//  CreateThreadViewModel.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 30/10/23.
//

import Foundation
import Firebase

class CreateThreadViewModel: ObservableObject {
    @Published var caption: String = ""
    
    var user: User? {
        userService.currentUser.value
    }
    
    let threadService: ThreadServiceProtocol
    let userService: UserServiceProtocol
    
    init(threadService: ThreadServiceProtocol = ThreadService.shared, userService: UserServiceProtocol = UserService.shared) {
        self.threadService = threadService
        self.userService = userService
    }
    
    public var isCaptionEmpty: Bool {
        caption.isEmpty
    }
    
    public func postButtonPressed(completion: @escaping () -> Void) {
        Task {
            try? await uploadThread()
            completion()
        }
    }
    
    public func eraseTextButtonPressed() {
        caption.removeAll()
    }
    
    private func uploadThread() async throws {
        if let safeUser = userService.currentUser.value {
            let newThread = Thread(threadID: UUID().uuidString,
                                   ownerId:  safeUser.id,
                                   caption: self.caption,
                                   timestamp: Timestamp(),
                                   likes: 0)
            try? await threadService.uploadThread(newThread)
        }
       
    }
    
}
