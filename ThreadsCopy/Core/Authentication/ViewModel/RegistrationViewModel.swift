//
//  RegistrationViewModel.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import Foundation


class RegistrationViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullName: String = ""
    @Published var userName: String = ""
    
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
    
    
    func createUser() async throws {
        try await service.createUser(withEmail: email, password: password, fullName: fullName, userName: userName)
    }
}
