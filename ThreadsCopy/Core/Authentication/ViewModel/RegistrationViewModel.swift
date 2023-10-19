//
//  RegistrationViewModel.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import Foundation
import FirebaseAuth


class RegistrationViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullName: String = ""
    @Published var userName: String = ""
    
    @Published var shouldShowAlert: Bool = false
    @Published var alertMessage: String = ""
    
    private let service: AuthService
    
    init(service: AuthService = AuthService.shared) {
        self.service = service
    }
    
    
    public var isSingUpEnable: Bool {
        return email.contains("@")
        && password.count > 5
        && !fullName.isEmpty
        && !userName.isEmpty
    }
    
    public func singUpPressed() {
        Task {
            try await createUser()
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
    
    func createUser() async throws {
        if let authError = await service.createUser(withEmail: email, password: password, fullName: fullName, userName: userName) {
            handleWithError(authError)
        }
    }
}
