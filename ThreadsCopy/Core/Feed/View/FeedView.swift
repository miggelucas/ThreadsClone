//
//  FeedView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct FeedView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        
        NavigationStack {
            ScrollView(showsIndicators: false) {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                case .content:
                    LazyVStack {
                        ForEach(viewModel.threads) { thread in
                            ThreadCell(thread: thread)
                        }
                    }
                }
            }
            .refreshable {
                Task {
                    await viewModel.refreshFeed()
                }
               
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbarBackground(colorScheme == .light ? Color.white : Color.black,
                               for: .navigationBar)
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                           await viewModel.refreshFeed()
                        }
                      
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .tint(.primary)
                    }
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
