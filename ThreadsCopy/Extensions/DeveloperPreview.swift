//
//  DeveloperPreview.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 19/10/23.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: UUID().uuidString, fullName: "Thomas Yorke", email: "thomyorke@gmail.com", username: "Thom_Yorke", profileImageUrl: "userThomYorke", bio: "Free palestine")
}
