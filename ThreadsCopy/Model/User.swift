//
//  User.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 19/10/23.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullName: String
    let email: String
    let username: String
    var profileImageUrl: String?
    let bio: String?
    
}
 

extension User {
    static func example() -> User {
        User(id: "123123123",
             fullName: "Thomas Yorke",
             email: "thomyorke@gmail.com",
             username: "ThomYorke",
             bio: "Say my name")
    }
}
