//
//  LoginViewModelTest.swift
//  ThreadsTests
//
//  Created by Lucas Migge on 06/11/23.
//

import XCTest
@testable import ThreadsCopy


final class LoginViewModelTests: XCTestCase {
    
    var authService: AuthServiceMock!
    var viewModel: LoginViewModel!
    
    
    override func setUpWithError() throws {
        authService = AuthServiceMock()
        viewModel = LoginViewModel(authService: self.authService)
    }
    
    func testViewModelStartsAtIdleState() {
        XCTAssertTrue(viewModel.state == .idle)
        
    }
    
    func testViewModelChangesStateWhenLogginPressed() {
        viewModel.state = .idle
        authService.loginShouldReturnSuccess = true
        
        Task {
            await viewModel.loginPressed()
            
            XCTAssertTrue(viewModel.state != .idle)
        }
    }
    
    func testViewModelGoesBackToIdleWhenLoginFailed() {
        authService.loginShouldReturnSuccess = false
        
        Task {
            await viewModel.loginPressed()
            
            await MainActor.run {
                XCTAssertTrue(viewModel.state == .idle)
            }
        }
    }
    
    //    func testWhenLoginFailedShouldPresentError() {
    
    
    func testLoginButtonDisabledWhenPasswordIsEmpty() {
        
        viewModel.email = "test@gmail.com"
        viewModel.password = ""
        
        
        XCTAssertFalse(viewModel.isLoginEnable)
        
    }
    
    func testLoginButtonDisableWhenPasswordIsntValid() {
        
        viewModel.email = "test#gmail.com"
        viewModel.password = ""
        
        
        XCTAssertFalse(viewModel.isLoginEnable)
    }
    
    func testLoginButtonDisabledWhenEmailIsEmpty() {
        viewModel.email = ""
        viewModel.password = "SecurePassword#123"
        
        
        XCTAssertFalse(viewModel.isLoginEnable)
    }
    
    
    func testLoginButtonEnabledWhenEmailAndPasswordHasValidContent() {
        
        viewModel.email = "test#gmail.com"
        viewModel.password = "SecurePassword#123"
        
        XCTAssertFalse(viewModel.isLoginEnable)
    }
    
    
    @MainActor
    func testLoginPressedCallsAuthService() async {
        
        // given
        viewModel.email = ""
        viewModel.password = ""
        
        
        Task {
            viewModel.loginPressed()
            let result = self.authService.didCallLogin
            // them
            
            print("dentro do dispatch \(self.authService.didCallLogin)")
            XCTAssertTrue(result)
            
        }
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let imageURL = URL(string: "https://source.unsplash.com/random/300x200")!
                   let image = try? await ImageFetcher().fetchImage(for: imageURL)

                   await MainActor.run {
                       imageView.image = image
                       completion()
                   }
        }
        
       
    }
    
    
    
}

