//
//  Thread.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 30/10/23.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    @DocumentID var threadID: String?
    let ownerId: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadID ?? UUID().uuidString
    }
    
    var user: User?
}


extension Thread {
    static func example() -> Thread {
        Thread(ownerId: "", caption: "Hello Word", timestamp: Timestamp(), likes: 0)
    }
}
