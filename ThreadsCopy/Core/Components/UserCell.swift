//
//  UserCell.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct UserCell: View {
    
    var user: User
    
    var body: some View {
        HStack(alignment: .center) {
            
            CircularProfileImageView(user: user, size: .small)

            
            VStack(alignment: .leading) {
                Text(user.username)
                    .fontWeight(.semibold)
                
                Text(user.fullName)
                
            }
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
    }
}

#Preview {
    UserCell(user: DeveloperPreview.shared.user)
}
