//
//  ThreadServiceMock.swift
//  ThreadsTests
//
//  Created by Lucas Migge on 08/11/23.
//

import Foundation
import Firebase
@testable import ThreadsCopy

struct ThreadServiceMock: ThreadServiceProtocol {
    
    var uploadThreadShouldThrowAnError: Bool = false
    var fetchThreadShouldThrowAnError: Bool = false
    var fecthUserThreadsShouldThrowAnError: Bool = false
    
    func uploadThread(_ thread: ThreadsCopy.Thread) async throws {
        if uploadThreadShouldThrowAnError {
            throw ThreadServiceError.failedToUploadThreadToCloud
        }
    }
    
    func fetchThreads() async throws -> [ThreadsCopy.Thread] {
        if fetchThreadShouldThrowAnError {
            throw ThreadServiceError.failedToRetriveDataFromCloud
        }

        return [
            Thread(ownerId: "1", caption: "testing1", timestamp: Timestamp(), likes: 0),
            Thread(ownerId: "2", caption: "testing2", timestamp: Timestamp(), likes: 0),
            Thread(ownerId: "3", caption: "testing3", timestamp: Timestamp(), likes: 0)
            
        ]
    }
    
    func fetchUserThreads(uid: String) async throws -> [ThreadsCopy.Thread] {
        if fecthUserThreadsShouldThrowAnError {
            throw ThreadServiceError.failedToRetriveDataFromCloud
        }
        
        return [
            Thread(ownerId: "1", caption: "testing1", timestamp: Timestamp(), likes: 0),
            Thread(ownerId: "1", caption: "testing2", timestamp: Timestamp(), likes: 0),
            Thread(ownerId: "1", caption: "testing3", timestamp: Timestamp(), likes: 0)
        ]
    }
    
}
