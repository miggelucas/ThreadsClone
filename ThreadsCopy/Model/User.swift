//
//  User.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 19/10/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String
    let username: String
    let profileImageUrl: String?
    let bio: String?
    
    
}
 
