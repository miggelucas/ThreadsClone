//
//  CreateThreadView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct CreateThreadView: View {
    @Environment(\.dismiss) var dismiss
    
 
    @StateObject var viewModel: CreateThreadViewModel = CreateThreadViewModel()
    
    var user: User {
        viewModel.user ?? User.example()
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView(user: viewModel.user, size: .small)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.username)
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread", text: $viewModel.caption, axis: .vertical)
                            .font(.footnote)
                    }
                    
                    Spacer()
                    
                    if !viewModel.isCaptionEmpty{
                        Button {
                            viewModel.eraseTextButtonPressed()
                        
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
                        viewModel.postButtonPressed() {
                            dismiss()
                        }
                       
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .opacity(viewModel.isCaptionEmpty ? 0.5 : 1)
                    .animation(.smooth, value: viewModel.isCaptionEmpty)
                    .disabled(viewModel.isCaptionEmpty)
                }
            }
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    CreateThreadView()
}
