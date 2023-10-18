//
//  ProfileView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Thomas Yorke")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("thon_yorke")
                                .font(.subheadline)
                        }
                        
                        Text("Climate change is real and you should do something about it")
                            .font(.footnote)
                        
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
            // should update
        }
        
    }
}

#Preview {
    ProfileView()
}
