//
//  ContentViewModel.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 18/10/23.
//

import SwiftUI
import Foundation
import Firebase


class ContentViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    var authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol = AuthService.shared) {
        self.authService = authService
        self.userSession = authService.userSession
        self.authService.authDelegate = self
    }
    
    
}

extension ContentViewModel: AuthServiceDelegate {
    func notifyChangeInUser(user: FirebaseAuth.User?) {
        self.userSession = user
    }
    
}
