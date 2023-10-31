//
//  ThreadCell.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct ThreadCell: View {
    var thread: Thread
    
    var body: some View {
        VStack {
            
            HStack(alignment: .top, spacing: 12) {
            
                CircularProfileImageView(user: thread.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    HStack {
                        Text(thread.user?.username ?? "")
                            .foregroundStyle(.primary)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            
                        
                        Spacer()
                        
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                        
                        
                        Button {
                            
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.secondary)
                        }
                        .buttonStyle(.plain)
                    
                    }
                    
                   
                    
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 12) {
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                        
                    }
                    .padding(.vertical, 8)
                    .tint(.primary)
                    
                    
                }
            }
            
            Divider()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    ThreadCell(thread: Thread.example())
}
