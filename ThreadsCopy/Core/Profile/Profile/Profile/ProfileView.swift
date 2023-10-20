//
//  ProfileView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                
                ProfileHeaderView(user: user)
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .tint(colorScheme == .light ? Color.white : Color.black)
                        .frame(width: 352, height: 32)
                        .background(colorScheme == .light ? Color.black : Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                UserContentListView()
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        .refreshable {
            //            viewModel.refreshTriggered()
        }
        
    }
}

#Preview {
    ProfileView(user: DeveloperPreview.shared.user)
}
