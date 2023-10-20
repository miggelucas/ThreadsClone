//
//  CircularProfileImageView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct CircularProfileImageView: View {
    
    var imageProfile: Image
    
    init(image: Image = Image(systemName: "person.crop.circle")) {
        self.imageProfile = image
    }
    
    var body: some View {
        imageProfile
            .resizable()
            .tint(.primary)
            .scaledToFill()
            .frame(width: 60, height: 60)
            .clipShape(Circle())
     
    }
}

#Preview {
    CircularProfileImageView()
}
