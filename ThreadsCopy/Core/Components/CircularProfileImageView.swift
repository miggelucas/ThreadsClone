//
//  CircularProfileImageView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case small, medium, large
    
    var dimension: CGFloat {
        switch self {
        case .small:
            return 40
        case .medium:
            return 48
        case .large:
            return 64
        }
    }
}


struct CircularProfileImageView: View {
    
    var user: User?
    let size: ProfileImageSize
    
    init(user: User?, size: ProfileImageSize) {
        self.user = user
        self.size = size
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
            KFImage(url)
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            imagePlaceholder
        }
        
    }
    
    private var imagePlaceholder: some View {
        Image(systemName: "person.crop.circle")
            .resizable()
            .tint(.secondary)
            .scaledToFill()
            .frame(width: size.dimension, height: size.dimension)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView(user: User.example(), size: .medium)
}
