//
//  UserService.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 19/10/23.
//

import Firebase

class UserService {
    
    @Published var currentUser: User?
    
    static let shared: UserService = UserService()
    
    init () {
        Task {
            try await fetchCurrentUser()
        }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
    }
}
