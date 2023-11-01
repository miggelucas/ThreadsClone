//
//  AnyUserService.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 01/11/23.
//

import Foundation

typealias AnyUserService = UserServiceProtocol & ThreadsUser
 
protocol UserServiceProtocol {
    
    static var shared: AnyUserService { get }
    
    func fetchUsers() async throws -> [User]
    
    func fetchUser(withUis uid: String) async throws -> User
    
    func singOut()
    
    func fetchCurrentUser() async throws
    
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws
}


class ThreadsUser {
    @Published var currentUser: User?
    
     required init() {}
}
