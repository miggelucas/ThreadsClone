//
//  ThreadsTextFieldModifier.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 16/10/23.
//

import SwiftUI


struct ThreadsTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
        
    }
}
