//
//  RegistrationViewModelTests.swift
//  ThreadsTests
//
//  Created by Lucas Migge on 08/11/23.
//

import Foundation
import XCTest
@testable import ThreadsCopy


final class RegistrationViewModelTests: XCTestCase {
    
    var authService: AuthServiceMock!
    var viewModel: RegistrationViewModel!
    
    
    override func setUpWithError() throws {
        authService = AuthServiceMock()
        viewModel = RegistrationViewModel(service:  self.authService)
    }
 
    
    func testViewModelStartsAtIdleState() {
        
        XCTAssertEqual(viewModel.state, .idle)
    }
    
    func testViewModelStartsNotShowingAlert() {
        
        XCTAssertFalse(viewModel.shouldShowAlert)
    }
    

    func testSingUpIsEnabledWhenFieldsHaveValidInfo() {
        
        viewModel.email = "test@gmail.com"
        viewModel.fullName = "Greatest Name Ever"
        viewModel.password = "Secure#Password13"
        viewModel.userName = "SayMyName"
        
        let result = viewModel.isSingUpEnable
        
        XCTAssertTrue(result)
        
    }
    
    
    func testSignUpIsntEnabledWhenEmailIsntValid() {
        
        viewModel.email = "test#gmail.com"
        viewModel.fullName = "Greatest Name Ever"
        viewModel.password = "Secure#Password13"
        viewModel.userName = "SayMyName"
        
        let result = viewModel.isSingUpEnable
        
        XCTAssertFalse(result)
        
    }
    
    
    func testSignUpIsntEnabledWhenPasswordIsntLongerThan5() {
        
        viewModel.email = "test#gmail.com"
        viewModel.fullName = "Greatest Name Ever"
        viewModel.password = "S@!#1"
        viewModel.userName = "SayMyName"
        
        let result = viewModel.isSingUpEnable
        
        XCTAssertFalse(result)
    }
    
    
    func testSignUpIsntEnabledWhenFullNameIsEmpty() {
        
        viewModel.email = "test#gmail.com"
        viewModel.fullName = ""
        viewModel.password = "S@!#1"
        viewModel.userName = "SayMyName"
        
        let result = viewModel.isSingUpEnable
        
        XCTAssertFalse(result)
    }
    
    func testSignUpIsntEnabledWhenUserNameIsEmpty() {
        
        viewModel.email = "test@gmail.com"
        viewModel.fullName = "Greatest Name Ever"
        viewModel.password = "S@!#1"
        viewModel.userName = ""
        
        let result = viewModel.isSingUpEnable
        
        XCTAssertFalse(result)
    }
    
    func testSingUpPressedShouldNotChangeStateWhenSuccesseful() async {
        
        authService.singUpShouldReturnSccess = true
        
        viewModel.email = "test@gmail.com"
        viewModel.fullName = "Greatest Name Ever"
        viewModel.password = "S@!#2221"
        viewModel.userName = "SayMyName"
        
        viewModel.state = .idle
        
        await viewModel.singUpPressed()
        
        XCTAssertTrue(viewModel.state == .waitingApiResponse)
        
    }
    
    func testSingUpPressedShouldRevertStateWhenFail() async {
        // given
        authService.singUpShouldReturnSccess = false
        
        viewModel.email = "test@gmail.com"
        viewModel.fullName = "Greatest Name Ever"
        viewModel.password = "S@!#2221"
        viewModel.userName = "SayMyName"
        
        viewModel.state = .idle
        
        
        // when
        await viewModel.singUpPressed()
        
        // then
        XCTAssertTrue(viewModel.state == .idle)
        
    }
    
    func testSingUpPressedShouldPresentAlertWhenFail() async {
        // given
        authService.singUpShouldReturnSccess = false
        
        viewModel.email = "test@gmail.com"
        viewModel.fullName = "Greatest Name Ever"
        viewModel.password = "S@!#2221"
        viewModel.userName = "SayMyName"
        
        viewModel.state = .idle
        
        // when
        await viewModel.singUpPressed()
        
        XCTAssertTrue(viewModel.shouldShowAlert)
        
    }
}
