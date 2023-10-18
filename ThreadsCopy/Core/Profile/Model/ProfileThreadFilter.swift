//
//  ProfileThreadFilter.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import Foundation


enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads, replies
    
    var title: String {
        switch self {
        case .replies:
            return "Replies"
            
        case .threads:
            return "Threads"
            
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
