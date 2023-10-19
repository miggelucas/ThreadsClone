//
//  LoginViewModel.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import Foundation


class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    var authService = AuthService.shared
    
    var isLoginEnable: Bool {
        return email.contains("@") && !password.isEmpty
    }

    public func loginPressed() {
        Task {
            try await authService.login(withEmail: email, password: password)
        }
      
    }
}
