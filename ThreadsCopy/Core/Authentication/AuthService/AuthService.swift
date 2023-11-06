//
//  AuthService.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 18/10/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase


class AuthService: ObservableObject, AuthServiceProtocol {
    
    static var shared: AuthServiceProtocol = AuthService()
    
    var userSession: FirebaseAuth.User? {
        didSet {
            authDelegate?.notifyChangeInUser(user: userSession)
        }
    }
    
    var authDelegate: AuthServiceDelegate?
    var userService: UserServiceProtocol
    
    init(userSession: FirebaseAuth.User? = Auth.auth().currentUser, userService: UserServiceProtocol = UserService.shared) {
        self.userSession = userSession
        self.userService = userService
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async -> Result<String?, AuthErrorCode> {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            userSession = result.user
            
            return .success(nil)
            
        } catch  {
            if let nsError = error as NSError? {
                let authError = AuthErrorCode(_nsError: nsError)
                return .failure(authError)
            }
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String, userName: String) async -> AuthErrorCode? {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
            
            try await uploadUserData(withEmail: email, fullName: fullName, userName: userName, id: result.user.uid )
            return nil
        } catch {
            if let nsError = error as NSError? {
                let authError = AuthErrorCode(_nsError: nsError)
                return authError
                
            }
        }
    }
    
    @MainActor
    public func uploadUserData(withEmail email: String,
                               fullName: String,
                               userName: String,
                               id: String
    ) async throws {
        let user = User(id: id, fullName: fullName, email: email, username: userName, profileImageUrl: nil, bio: nil)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        userService.currentUser.value = user
        
    }
    
    
    public func singOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        userService.singOut()
        
    }
}
