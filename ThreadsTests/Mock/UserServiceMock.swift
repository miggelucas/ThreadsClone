//
//  UserServiceMock.swift
//  ThreadsTests
//
//  Created by Lucas Migge on 06/11/23.
//

import Foundation
import Combine
@testable import ThreadsCopy

class UserServiceMock: UserServiceProtocol {
    
    public var isSingIn: Bool = false
    public var didUpdateImage: Bool = false
    
    var currentUser: CurrentValueSubject<ThreadsCopy.User?, Never> = .init(nil)
    
    func fetchUsers() async throws -> [ThreadsCopy.User] {
        return [
        User(id: "1", fullName: "Sebastião Silva", email: "sebastiaosilva@gmail.com", username: "Bastion", bio: "I'm the law"),
        User(id: "2", fullName: "Naruto Uzumaki", email: "uzumakinaruto@gmail.com", username: "NarutoHokage", bio: "HokageBoy"),
        User(id: "3", fullName: "Dante Alighieri", email: "dante@gmail.com", username: "Danteee", bio: "Writer and dead person"),
        User(id: "4", fullName: "Bruno Barbosa", email: "brunobrabo@gmail.com", username: "braboBruno", bio: "iOS Master")
        ]
    }
    
    func fetchUser(withUis uid: String) async throws -> ThreadsCopy.User {
        return User(id: "1", fullName: "Sebastião Silva", email: "sebastiaosilva@gmail.com", username: "Bastion", bio: "I'm the law")
    }
    
    func singOut() {
        isSingIn = false
    }
    
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        didUpdateImage = true
    }
    
    
}
