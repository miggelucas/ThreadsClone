//
//  ProfileView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var currentUser: User? {
        viewModel.currentUser
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(currentUser?.fullName ?? "Thomas Yorke")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text(currentUser?.username ?? "thon_yorke")
                                .font(.subheadline)
                        }
                        
                        if let bio = currentUser?.bio {
                            Text(bio)
                                .font(.footnote)
                        }
                        
                        Text("15 followers")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    
                    }
                    
                    Spacer()
                    
                    CircularProfileImageView(imageString: "userThomYorke")
                }
                
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 9))
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
        
    }
}

#Preview {
    ProfileView()
}
