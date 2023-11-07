//
//  AnyUserService.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 01/11/23.
//

import Foundation
import Combine

 
protocol UserServiceProtocol {
    
    var currentUser: CurrentValueSubject<User?, Never> { get }
    
    func fetchUsers() async throws -> [User]
    
    func fetchUser(withUis uid: String) async throws -> User
    
    func singOut()
    
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws
}

