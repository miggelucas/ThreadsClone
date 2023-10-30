//
//  ImageUploader.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 20/10/23.
//

import Foundation
import Firebase
import FirebaseStorage


struct ImageUploader {
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 1) else { return nil }
        let fileName = UUID().uuidString
        let storege = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        do {
            let _ = try await storege.putDataAsync(imageData)
            let url = try await storege.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Falied to upload image with error: \(error.localizedDescription)")
            return nil
        }
 
   
    }
}
