//
//  CurrentUserProfileView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 20/10/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @State private var showEditProfileView: Bool = false
    @Namespace var animation
    
    private var currentUser: User? {
        viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    
                    ProfileHeaderView(user: currentUser)
                  
                    Button {
                        self.showEditProfileView = true
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .tint(.primary)
                            .frame(width: 352, height: 32)
                            .background(colorScheme == .light ? Color.white : Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.secondary, lineWidth: 1)
                            }
                    }
                    
                    if let user = viewModel.currentUser {
                        UserContentListView(user: user)
                    }
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Label("Settings", systemImage: "gear")
                           
                    }
                    .tint(.primary)

                }
            }
            .padding(.horizontal)
            .refreshable {
                viewModel.refreshTriggered()
            }
            .sheet(isPresented: $showEditProfileView) {
                if let user = viewModel.currentUser {
                    EditProfileView(viewModel: EditProfileViewModel(user: user))
                }
            
            }
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
