//
//  ThreadService.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 30/10/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct ThreadService: ThreadServiceProtocol {
    
    static var shared: ThreadServiceProtocol = ThreadService()
    
    private init() {
        
    }
    
    func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)

    }
    
    func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap { thread in
            try? thread.data(as: Thread.self)
        }
    }
    
    
    func fetchUserThreads(uid: String) async throws -> [Thread] {
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
            .whereField("ownerId", isEqualTo: uid)
            .getDocuments()
        
        let threads = snapshot.documents.compactMap { thread in
            try? thread.data(as: Thread.self)
        }
        
        return threads.sorted {
            $0.timestamp.dateValue() > $1.timestamp.dateValue()
        }
    }
}
