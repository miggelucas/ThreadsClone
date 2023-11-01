//
//  SettingsViewModel.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 01/11/23.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    var authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol = AuthService.shared) {
        self.authService = authService
    }
    
    public func singOutPressed() {
        authService.singOut()
    }
    
}
