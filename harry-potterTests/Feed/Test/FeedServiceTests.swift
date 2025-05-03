//
//  FeedServiceTests.swift
//  harry-potterTests
//
//  Created by Edilberto Ramos on 03/05/25.
//

import XCTest
@testable import harry_potter

class FeedViewModelTests: XCTestCase {
    var mockService: FeedServiceMock!

    override func setUp() {
        super.setUp()
        mockService = FeedServiceMock()
    }

    override func tearDown() {
        mockService = nil
        super.tearDown()
    }

    func testAllCharactersSuccessfulFetch() async {
        
        // Given
        mockService.shouldReturnError = false
        let expectation = XCTestExpectation(description: "Fetching all characters completes")

        do {
            // When
            let result = try await mockService.characters()
            
            // Then
            switch result.result {
            case .success(_):
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Error validating all characters completes \(error)")
            }
        } catch {
            XCTFail("Error validating all characters completes")
        }
        
        await fulfillment(of: [expectation], timeout: 3.0)
    }

    func testFetchError() async {
        // Given
        mockService.shouldReturnError = true
        let expectation = XCTestExpectation(description: "Fetching all characters failure")

        do {
            // When
            let result = try await mockService.characters()
            
            // Then
            switch result.result {
            case .success(_):
                XCTFail("Error validating all characters failure")
            case .failure(_):
                expectation.fulfill()
            }
        } catch {
            XCTFail("Error validating all characters failure")
        }
        
        await fulfillment(of: [expectation], timeout: 3.0)
    }
    
}
