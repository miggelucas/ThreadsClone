//
//  AnyThreadService.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 01/11/23.
//

import Foundation

protocol ThreadServiceProtocol {
    
    func uploadThread(_ thread: Thread) async throws
    
    func fetchThreads() async throws -> [Thread]
    
    func fetchUserThreads(uid: String) async throws -> [Thread]
    
}
