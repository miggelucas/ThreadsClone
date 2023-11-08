//
//  AuthServiceMock.swift
//  ThreadsTests
//
//  Created by Lucas Migge on 06/11/23.
//

import Foundation
import FirebaseAuth
@testable import ThreadsCopy

class AuthServiceMock: AuthServiceProtocol {
    
    public var didCallLogin: Bool = false
    public var didCallCreateUser: Bool = false
    public var loginShouldReturnSuccess = true
    public var singUpShouldReturnSccess = true
    
    
    var userSession: FirebaseAuth.User? = nil
    
    var authDelegate: ThreadsCopy.AuthServiceDelegate?
    
    var userService: ThreadsCopy.UserServiceProtocol = UserServiceMock()
    
    func login(withEmail email: String, password: String) async -> Result<String?, AuthErrorCode> {
        didCallLogin = true
        
        if loginShouldReturnSuccess {
            return .success(nil)
            
        } else {
            return .failure(AuthErrorCode.init(.appNotAuthorized))
            
        }
       
    }
    
    func createUser(withEmail email: String, password: String, fullName: String, userName: String) async -> AuthErrorCode? {
        self.didCallCreateUser = true
        
        if singUpShouldReturnSccess {
            return nil
        } else {
            return AuthErrorCode.init(.emailAlreadyInUse)
        }
        
    }
    
    func uploadUserData(withEmail email: String, fullName: String, userName: String, id: String) async throws {
        
    }
    
    func singOut() {
        
    }
    
    
}
