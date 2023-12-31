//
//  RegistrationViewModel.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import Foundation
import FirebaseAuth


class RegistrationViewModel: ObservableObject {
    
    enum State: String {
        case idle, waitingApiResponse
        
    }
    
    @Published var state: State = .idle
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullName: String = ""
    @Published var userName: String = ""
    
    @Published var shouldShowAlert: Bool = false
    @Published var alertMessage: String = ""
    
    private let registerUserService: SignInServiceProtocol
    
    init(service: SignInServiceProtocol = AuthService.shared) {
        self.registerUserService = service
    }
    
    public var isSingUpEnable: Bool {
        return email.contains("@")
        && password.count > 5
        && !fullName.isEmpty
        && !userName.isEmpty
    }
    
    @MainActor
    public func singUpPressed() async {
        if !isSingUpEnable { return }
        
        if state == .waitingApiResponse { return }
        
        self.state = .waitingApiResponse
        await createUser()
        
    }
    
    private func createUser() async {
        if let authError = await registerUserService.createUser(withEmail: email, password: password, fullName: fullName, userName: userName) {
            self.state = .idle
            handleWithError(authError)
        }
    }
    
    private func handleWithError(_ authError: AuthErrorCode) {
        switch authError.code {
        case .emailAlreadyInUse:
            alertMessage = "Email already in use. Try to recover your password"
            
        case .weakPassword:
            alertMessage = "Your password is too weak. Try a stronger password"
            
        default:
            alertMessage = authError.localizedDescription
            
        }
        shouldShowAlert = true
    }
}
