//
//  LoginViewModel.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import Foundation
import Firebase

class LoginViewModel: ObservableObject {
    
    enum State {
        case idle, waitingApiResponse
    }
    
    @Published var state: State = .idle
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var shouldShowAlert: Bool = false
    @Published var alertMessage: String = ""
    
    var loginSerivce: LoginServiceProtocol
    
    var isLoginEnable: Bool {
        return email.contains("@") && !password.isEmpty
    }
    
    init(loginService: LoginServiceProtocol = AuthService.shared) {
        self.loginSerivce = loginService
    }
    
    @MainActor
    public func loginPressed() async {
        if state != .waitingApiResponse {
            state = .waitingApiResponse
            
            let result = await loginSerivce.login(withEmail: email, password: password)
            
            switch result {
            case .success:
                print("DEBUG: Login sucessful")
                
            case .failure(let authError):
                handleWithError(authError)
                self.state = .idle
                
                
            }
        }
    }
    
    
    private func handleWithError(_ authError: AuthErrorCode) {
        switch authError.code {
        case .wrongPassword:
            alertMessage = "Wrong passoword"
            
        case .invalidEmail:
            alertMessage = "invalid Email"
            
        default:
            alertMessage = authError.localizedDescription
        }
        
        shouldShowAlert = true
    }
    
}
