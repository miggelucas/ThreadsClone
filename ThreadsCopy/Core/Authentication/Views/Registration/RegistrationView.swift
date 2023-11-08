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
        .alert("Failed to create User", isPresented: $viewModel.shouldShowAlert) {
            
        } message: {
            Text(viewModel.alertMessage)
        }

    }
    
    private var threadsLogoSection: some View {
        Image(colorScheme == .light ? "ThreadsLogo" : "ThreadsWhiteLogo",
              label: Text("Threads Logo"))
            .resizable()
            .scaledToFit()
            .frame(width: 120)
            .padding()
    }
    
    private var textFieldSection: some View {
        VStack {
            
            TextField("Enter your email", text: $viewModel.email)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                .modifier(ThreadsTextFieldModifier())
            
            
            SecureField("Enter your password", text: $viewModel.password)
                .textInputAutocapitalization(.none)
                .modifier(ThreadsTextFieldModifier())
            
            TextField("Enter your full name", text: $viewModel.fullName)
                .textInputAutocapitalization(.words)
                .modifier(ThreadsTextFieldModifier())
            
            TextField("Enter your username", text: $viewModel.userName)
                .textInputAutocapitalization(.none)
                .modifier(ThreadsTextFieldModifier())
            
        }
    }
    
    private var signUpButtonSection: some View {
        Button {
            Task {
                await viewModel.singUpPressed()
            }
          
            
        } label: {
            switch viewModel.state {
            case .idle:
                Text("Sign Up")
                    .modifier(ThreadsLoginSingUpButtonModifier(colorMode: colorScheme))
                
            case .waitingApiResponse:
                ProgressView()
                    .tint(colorScheme == .light ? Color.white : Color.black)
                    .frame(width: 352, height: 44)
                    .background(Color.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
            }
           
        }
        .opacity(viewModel.isSingUpEnable ? 1 : 0.75)
        .animation(.smooth, value: viewModel.isSingUpEnable)
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
