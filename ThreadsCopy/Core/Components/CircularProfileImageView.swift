//
//  CircularProfileImageView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct CircularProfileImageView: View {
    
    var user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var imageProfileUrl: URL? {
        if let imageUrl = user?.profileImageUrl {
            return URL(string: imageUrl)
        } else {
            return nil
        }
    }
    
    var body: some View {
        if let url = imageProfileUrl {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    imagePlaceholder
                case .success(let image):
                    image
                        .resizable()
                        .tint(.secondary)
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                case .failure(_):
                    imagePlaceholder
                @unknown default:
                    imagePlaceholder
                }
            }
        } else {
            imagePlaceholder
        }
        
    }
    
    private var imagePlaceholder: some View {
        Image(systemName: "person.crop.circle")
            .resizable()
            .tint(.secondary)
            .scaledToFill()
            .frame(width: 60, height: 60)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView(user: User.example())
}
