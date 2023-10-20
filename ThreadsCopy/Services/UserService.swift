//
//  UserService.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 19/10/23.
//

import Firebase
import FirebaseFirestoreSwift

class UserService {
    
    @Published var currentUser: User?
    
    static let shared: UserService = UserService()
    
    init () {
        Task {
            try await fetchCurrentUser()
        }
    }
    
    static func fetchUser() async throws -> [User] {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collectionGroup("users").getDocuments()
        let users = snapshot.documents.compactMap { userData in
            try? userData.data(as: User.self)
        }
        
        return users.filter { user in
            user.id != currentUserID
        }
    }
    
    
    public func singOut() {
        currentUser = nil
    }
    
    @MainActor
    public func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
    }
}
