//
//  ThreadCell.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack {
            
            HStack(alignment: .top, spacing: 12) {
            
                CircularProfileImageView()
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    HStack {
                        Text("miggelucas")
                            .foregroundStyle(.primary)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            
                        
                        Spacer()
                        
                        Text("10m")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                        
                        
                        Button {
                            
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.secondary)
                        }
                        .buttonStyle(.plain)
                    
                    }
                    
                   
                    
                    Text("Developing in iOS can be fun")
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
                    .tint(.black)
                    
                    
                }
            }
            
            Divider()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    ThreadCell()
}
