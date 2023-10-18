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
    
    
    public func singUpPressed() {
        
    }
    
}
