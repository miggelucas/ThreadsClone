//
//  SignInServiceProtocol.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 08/11/23.
//

import Foundation
import FirebaseAuth

protocol SignInServiceProtocol {
    func createUser(withEmail email: String, password: String, fullName: String, userName: String) async -> AuthErrorCode?
}
