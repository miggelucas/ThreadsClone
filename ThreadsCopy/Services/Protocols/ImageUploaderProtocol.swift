//
//  AnyImageUploader.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 01/11/23.
//

import Foundation
import UIKit

protocol ImageUploaderProtocol {
    static func uploadImage(_ image: UIImage) async throws -> String?
}
