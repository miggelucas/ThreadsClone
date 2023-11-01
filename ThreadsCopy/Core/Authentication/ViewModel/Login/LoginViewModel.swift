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
    
    @Published var shouldShowAlert: Bool = false
    @Published var alertMessage: String = ""
    
    var authService = AuthService.shared
    
    var isLoginEnable: Bool {
        return email.contains("@") && !password.isEmpty
    }
    
    
    public func loginPressed() {
        Task {
            let result = await authService.login(withEmail: email, password: password)
            
            switch result {
            case .success:
                print("DEBUG: Login sucessful")
                
            case .failure(let authError):
                shouldShowAlert = true
                switch authError.code {
                case .wrongPassword:
                    alertMessage = "DEBUG: Wrong passoword"
                    
                case .invalidEmail:
                    alertMessage = "DEBUG: invalid Email"
                    
                default:
                    alertMessage = authError.localizedDescription
                }
            }
        }
        
    }
    
    
}
