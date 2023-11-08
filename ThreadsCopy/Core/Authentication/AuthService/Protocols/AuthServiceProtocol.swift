//
//  AuthServiceProtocol.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 01/11/23.
//

import Foundation
import FirebaseAuth


protocol AuthServiceProtocol: LoginServiceProtocol, SignInServiceProtocol {
    
    var userSession: FirebaseAuth.User? { get }
    
    var authDelegate: AuthServiceDelegate? { get set }
    
    var userService: UserServiceProtocol { get }
    
    
    func uploadUserData(withEmail email: String, fullName: String,userName: String, id: String ) async throws
    
    func singOut()
    
}

