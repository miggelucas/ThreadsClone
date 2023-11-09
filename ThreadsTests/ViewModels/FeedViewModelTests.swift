//
//  FeedViewModelTests.swift
//  ThreadsTests
//
//  Created by Lucas Migge on 08/11/23.
//

import XCTest
@testable import ThreadsCopy

final class FeedViewModelTests: XCTestCase {
    
    var threadsService: ThreadServiceMock!
    var userService: UserServiceMock!
    var viewModel: FeedViewModel!

    
    override func setUpWithError() throws {
        userService = UserServiceMock()
        threadsService = ThreadServiceMock()
        
        viewModel = FeedViewModel(threadService: threadsService,
                                  userService: userService)
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchThreadsUpdatesThreadsWhenSucessful() async {
        threadsService.fetchThreadShouldThrowAnError = false
        viewModel.threads = []
        
        await viewModel.fetchThreads()
        
        XCTAssertFalse(viewModel.threads.isEmpty)
       
    }

}
