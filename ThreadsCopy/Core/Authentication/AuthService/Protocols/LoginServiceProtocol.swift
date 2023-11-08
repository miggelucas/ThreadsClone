//
//  LoginServiceProtocol.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 08/11/23.
//

import Foundation
import FirebaseAuth

protocol LoginServiceProtocol {
    func login(withEmail email: String, password: String) async -> Result<String?, AuthErrorCode>
    
}
