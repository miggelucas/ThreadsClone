//
//  AuthServiceProtocol.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 01/11/23.
//

import Foundation
import FirebaseAuth


protocol AuthServiceProtocol {
    
    static var shared: AuthServiceProtocol { get }
    
    var userSession: FirebaseAuth.User? { get }
    
    var authDelegate: AuthServiceDelegate? { get set }
    
    var userService: AnyUserService { get }
    
    func login(withEmail email: String, password: String) async -> Result<String?, AuthErrorCode>
    
    func createUser(withEmail email: String, password: String, fullName: String, userName: String) async -> AuthErrorCode?
    
    func uploadUserData(withEmail email: String, fullName: String,userName: String, id: String ) async throws
    
    func singOut()
    
}