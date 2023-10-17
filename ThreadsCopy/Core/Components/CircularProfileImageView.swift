//
//  CircularProfileImageView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct CircularProfileImageView: View {
    
    var imageString: String = "userLucas"
    
    
    init(imageString: String = "userLucas") {
        self.imageString = imageString
    }
    
    var body: some View {
        Image(imageString)
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
