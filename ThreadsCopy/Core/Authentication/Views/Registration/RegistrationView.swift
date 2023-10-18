//
//  RegistrationView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 16/10/23.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var viewModel: RegistrationViewModel = RegistrationViewModel()

    var body: some View {
        VStack {
            
            Spacer()
            
            threadsLogoSection
            
            textFieldSection
            
            signUpButtonSection
                .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            footerButtonSection
            
                .padding(.vertical, 16)
        }
    }
    
    private var threadsLogoSection: some View {
        Image("threadsLogo", label: Text("Threads Logo"))
            .resizable()
            .scaledToFit()
            .frame(width: 120)
            .padding()
    }
    
    private var textFieldSection: some View {
        VStack {
            
            TextField("Enter your email", text: $viewModel.email)
                .textInputAutocapitalization(.never)
                .modifier(ThreadsTextFieldModifier())
            
            
            SecureField("Enter your password", text: $viewModel.password)
                .textInputAutocapitalization(.none)
                .modifier(ThreadsTextFieldModifier())
            
            TextField("Enter your full name", text: $viewModel.fullName)
                .textInputAutocapitalization(.sentences)
                .modifier(ThreadsTextFieldModifier())
            
            TextField("Enter your username", text: $viewModel.userName)
                .modifier(ThreadsTextFieldModifier())
            
        }
    }
    
    private var signUpButtonSection: some View {
        
        Button {
            viewModel.singUpPressed()
        } label: {
            Text("Sign Up")
                .modifier(ThreadsLoginSingUpButtonModifier(colorMode: colorScheme))
        }
    }
    
    private var footerButtonSection: some View {
        Button {
            dismiss()
        } label: {
            HStack(spacing: 3) {
                Text("Already have an account?")
                
                Text("Sign up")
                    .fontWeight(.semibold)
            }
            .font(.footnote)
            .tint(.primary)
            
        }
    }
}

#Preview {
    RegistrationView()
}
