//
//  UserContentListView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 20/10/23.
//

import SwiftUI

struct UserContentListView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileThreadFilter.allCases) { filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        
                        if selectedFilter == filter {
                            Rectangle()
                                .foregroundStyle(Color.primary)
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
            
            LazyVStack {
                ForEach(0...100, id: \.self) { thread in
//                    ThreadCell()
                }
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    UserContentListView()
}
