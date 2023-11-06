//
//  UserService.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 19/10/23.
//

import Firebase
import FirebaseFirestoreSwift
import Combine


class UserService: UserServiceProtocol {
    
    var currentUser: CurrentValueSubject<User?, Never>
    
    static let shared: UserServiceProtocol = UserService()
    
    init() {
        currentUser = .init(nil)
        
        Task {
            try await fetchCurrentUser()
        }
    }
    
    public func fetchUsers() async throws -> [User] {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collectionGroup("users").getDocuments()
        let users = snapshot.documents.compactMap { userData in
            try? userData.data(as: User.self)
        }
        
        return users.filter { user in
            user.id != currentUserID
        }
    }
    
    public func fetchUser(withUis uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        return user
    }
    
    
    public func singOut() {
        currentUser.send(nil)
    }
    
    @MainActor
    public func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser.send(user)
        
    }
    
    @MainActor
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        guard let currenUserId = Auth.auth().currentUser?.uid else { return }
        do {
            try await Firestore.firestore().collection("users").document(currenUserId).updateData([
                "profileImageUrl" : imageUrl
            ])
            self.currentUser.value?.profileImageUrl = imageUrl
        } catch {
            print("DEBUG: Failed to update user profile image: \(error.localizedDescription)")
        }
        
    }
}
