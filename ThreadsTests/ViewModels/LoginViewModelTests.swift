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
        viewModel = LoginViewModel(loginService: self.authService)
    }
    
    func testViewModelStartsAtIdleState() {
        XCTAssertTrue(viewModel.state == .idle)
        
    }
    
    func testViewModelChangesStateWhenLogginPressed() async {
        viewModel.state = .idle
        authService.loginShouldReturnSuccess = true
        
        await viewModel.loginPressed()
        
        XCTAssertTrue(viewModel.state != .idle)
    }
    
    func testViewModelGoesBackToIdleWhenLoginFailed() async {
        
        viewModel.state = .idle
        authService.loginShouldReturnSuccess = false
        
        await viewModel.loginPressed()
        
        XCTAssertTrue(viewModel.state == .idle)
    }
    
    func testWhenLoginFailedShouldPresentError() async {
        authService.loginShouldReturnSuccess = false
        
        await viewModel.loginPressed()
        
        XCTAssertTrue(viewModel.shouldShowAlert)
    }
    
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
    
    
    func testLoginPressedCallsAuthService() async {
        authService.didCallLogin = false
    
        viewModel.email = ""
        viewModel.password = ""
        
        await viewModel.loginPressed()
        
        XCTAssertTrue(authService.didCallLogin)
        
    }
    
    
}

