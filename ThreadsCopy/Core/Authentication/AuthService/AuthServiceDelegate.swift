//
//  AuthServiceDelegate.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 19/10/23.
//

import Foundation
import FirebaseAuth

protocol AuthServiceDelegate {
    func notifyChangeInUser(user: FirebaseAuth.User?)
    
}
