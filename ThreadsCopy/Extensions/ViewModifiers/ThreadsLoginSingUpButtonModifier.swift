//
//  ThreadsLoginSingUpButtonModifier.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct ThreadsLoginSingUpButtonModifier: ViewModifier {

    var colorMode: ColorScheme
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(colorMode == .light ? Color.white : Color.black)
            .frame(width: 352, height: 44)
            .background(Color.primary)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
