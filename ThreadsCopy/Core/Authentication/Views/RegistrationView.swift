//
//  RegistrationView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 16/10/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullName: String = ""
    @State private var userName: String = ""
    
    
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
            
            TextField("Enter your email", text: $email)
                .textInputAutocapitalization(.none)
                .modifier(ThreadsTextFieldModifier())
            
            
            SecureField("Enter your password", text: $password)
                .textInputAutocapitalization(.none)
                .modifier(ThreadsTextFieldModifier())
            
            TextField("Enter your full name", text: $email)
                .textInputAutocapitalization(.sentences)
                .modifier(ThreadsTextFieldModifier())
            
            TextField("Enter your username", text: $email)
                .modifier(ThreadsTextFieldModifier())
            
        }
    }
    
    private var signUpButtonSection: some View {
        
        Button {
            
        } label: {
            Text("Sign Up")
                .modifier(ThreadsLoginSingUpButtonModifier())
        }
    }
    
    private var footerButtonSection: some View {
        Button {
            
        } label: {
            HStack(spacing: 3) {
                Text("Already have an account?")
                
                Text("Sign up")
                    .fontWeight(.semibold)
            }
            .font(.footnote)
            .tint(.black)
            
        }
    }
}

#Preview {
    RegistrationView()
}
