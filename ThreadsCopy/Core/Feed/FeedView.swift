//
//  FeedView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct FeedView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    
                    ForEach(0...10, id: \.self) { thread in
                        ThreadCell()
                    }
                }
            }
            .refreshable {
                print("DEBUG: refresh Threads")
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbarBackground(colorScheme == .light ? Color.white : Color.black,
                               for: .navigationBar)
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                        print("DEBUG: refresh Threads")
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
