//
//  CreatThreadView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct CreatThreadView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var caption: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("miggelucas")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread", text: $caption, axis: .vertical)
                            .font(.footnote)
                    }
                    
                    Spacer()
                    
                    if !caption.isEmpty {
                        Button {
                            caption.removeAll()
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.gray)
                        }
                    }

                }
                
                Spacer()
            }
            .padding()
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Post") {
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .opacity(caption.isEmpty ? 0.5 : 1)
                    .disabled(caption.isEmpty)
                }
            }
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    CreatThreadView()
}
