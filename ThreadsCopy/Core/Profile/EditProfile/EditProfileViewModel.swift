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
    
    @Published var bio: String = ""
    @Published var link: String = ""
    @Published var isPrivateProfile: Bool = false
    
    @Published var profileImage: Image?
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage()
            }
        }
    }
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedItem else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
    
}
