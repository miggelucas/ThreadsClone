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
                    
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFilter.allCases) { filter in
                                VStack {
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                    
                                    if selectedFilter == filter {
                                        Rectangle()
                                            .foregroundStyle(.black)
                                            .frame(maxWidth: .infinity, maxHeight: 1)
                                            .matchedGeometryEffect(id: "ID", in: animation)
                                        
                                    } else {
                                        Rectangle()
                                            .foregroundStyle(.clear)
                                            .frame(maxWidth: .infinity, maxHeight: 1)
                                    }
                                    
                                }
                                .onTapGesture {
                                    withAnimation(.spring(.smooth)) {
                                        self.selectedFilter = filter
                                    }
                                }
                            }
                        }
                    }
                    .padding(.vertical)
                    
                    LazyVStack {
                        ForEach(0...100, id: \.self) { thread in
                        ThreadCell()
                        }
                    }
                }
            }
            .padding(.horizontal)
            .refreshable {
                viewModel.refreshTriggered()
            }
            .sheet(isPresented: $showEditProfileView) {
                EditProfileView(viewModel: self.viewModel)
                
            }
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
