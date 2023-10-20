//
//  EditProfileView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    @State private var bio: String = ""
    @State private var link: String = ""
    @State private var isPrivateProfile: Bool = false
    
    @ObservedObject var viewModel: CurrentUserProfileViewModel
    
    init( viewModel: CurrentUserProfileViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea(edges: [.bottom, .horizontal])
                
                VStack {
                    HStack {
                        
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text("Thom yorke")
                                .font(.footnote)
                        }
                        
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                CircularProfileImageView(image: image)
                            } else {
                                CircularProfileImageView()
                            }
                        }
                        
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio ...", text: $bio, axis: .vertical)
                            .font(.footnote)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Add lin...", text: $link, axis: .vertical)
                            .font(.footnote)
                    }
                    
                    Divider()
                    
                    Toggle("Private Profile", isOn: $isPrivateProfile)
                        .fontWeight(.semibold)
                    
                }
                .padding()
                .background(colorScheme == .light ? Color.white : Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4))
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.primary)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    EditProfileView(viewModel: CurrentUserProfileViewModel())
}
