//
//  ThreadService.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 30/10/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


enum ThreadServiceError: Error {
    case failedToEncodeThread, failedToUploadThreadToCloud, failedToRetriveDataFromCloud
}

struct ThreadService: ThreadServiceProtocol {
    
    func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else {
            throw ThreadServiceError.failedToEncodeThread
        }
        
        do {
            try await Firestore.firestore().collection("threads").addDocument(data: threadData)
        } catch {
            throw ThreadServiceError.failedToUploadThreadToCloud
        }
        
    }
    
    func fetchThreads() async ->  Result<[Thread], ThreadServiceError> {
        do {
            let snapshot = try await Firestore
                .firestore()
                .collection("threads")
                .order(by: "timestamp", descending: true)
                .getDocuments()
            
            let threads = snapshot.documents.compactMap { thread in
                try? thread.data(as: Thread.self)}
            
            return .success(threads)
            
            
        } catch {
            return .failure(ThreadServiceError.failedToRetriveDataFromCloud)
        }
    }
    
    
    func fetchUserThreads(uid: String) async ->  Result<[Thread], ThreadServiceError> {
        do {
            let snapshot = try await Firestore
                .firestore()
                .collection("threads")
                .whereField("ownerId", isEqualTo: uid)
                .getDocuments()
            
            let threads = snapshot.documents.compactMap { thread in
                try? thread.data(as: Thread.self)
            }
            
            let sortedThreads = threads.sorted {
                $0.timestamp.dateValue() > $1.timestamp.dateValue()
            }
            return .success(sortedThreads)
        } catch {
            return .failure(ThreadServiceError.failedToRetriveDataFromCloud)
        }
        
    }
}
