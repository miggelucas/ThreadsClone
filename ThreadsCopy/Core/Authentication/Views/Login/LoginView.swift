//
//  LoginView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 16/10/23.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject private var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Spacer()

                threadsLogoSection
                
                textFieldSection
                
                loginButtonSection

                Spacer()
                
                Divider()
                
                footerButtonSection
                .padding(.vertical, 16)
            }
            
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
                .modifier(ThreadsTextFieldModifier())

            
            SecureField("Enter your password", text: $viewModel.password)
                .modifier(ThreadsTextFieldModifier())
            
        }
    }
    
    @ViewBuilder
    private var loginButtonSection: some View {
        NavigationLink {
            EmptyView()
        } label: {
            Text("Forgot Password?")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.vertical)
                .padding(.trailing, 38)
                .tint(.primary)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
       
        Button {
            
        } label: {
            Text("Login")
                .modifier(ThreadsLoginSingUpButtonModifier(colorMode: self.colorScheme))
        }
        .opacity(viewModel.isLoginEnable ? 1 : 0.75)
        .animation(.smooth, value: viewModel.isLoginEnable)
    }
    
    private var footerButtonSection: some View {
        NavigationLink {
            RegistrationView()
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack(spacing: 3) {
                Text("Don't have an account?")
                
                Text("Sign up")
                    .fontWeight(.semibold)
            }
            .font(.footnote)
            .tint(.primary)
        }
    }
}

#Preview {
    LoginView()
}
