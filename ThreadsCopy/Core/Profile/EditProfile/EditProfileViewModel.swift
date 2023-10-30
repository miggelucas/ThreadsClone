//
//  EditProfileViewModel.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 20/10/23.
//

import Foundation
import PhotosUI
import SwiftUI

class EditProfileViewModel: ObservableObject {
    
    var user: User
    
    @Published var bio: String = ""
    @Published var link: String = ""
    @Published var isPrivateProfile: Bool = false
    
    @Published var profileImage: Image?
    private var uiImage: UIImage?
    
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage()
            }
        }
    }
    
    init(user: User) {
        self.user = user

    }
    
    public func doneButtonPressed() {
        Task {
           try await updateUserData()
        }
    }
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedItem else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
        self.uiImage = uiImage
    }
    
    
    private func updateUserData() async throws {
        guard let image = self.uiImage else { return }
        guard let imageUrl = try? await ImageUploader.uploadImage(image) else { return }
        
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
        
    }
}
