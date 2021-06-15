//
//  HomeViewModelTests.swift
//  TheMovieDBAppTests
//
//  Created by Carlos Alcala on 6/14/21.
//

import XCTest
import TheMovieDBApp

class HomeViewModelTests: XCTestCase {

    var viewModel : HomeViewModel!
    private var service : MockService!

    override func setUp() {
        super.setUp()
        self.service = MockService()
        self.viewModel = HomeViewModel(service: service)
    }

    override func tearDown() {
        self.viewModel = nil
        self.service = nil
        super.tearDown()
    }

    func testloadNextPageWithNoService() {

        // giving no service to a view model
        viewModel.service = nil

        viewModel.loadNextPage(handler: { result in
            switch result {
            case .success:
                XCTAssert(false, "ViewModel should not be able to load without service")
            case .failure:
                XCTAssert(false, "ViewModel should not be able to load without service")
            }
        })
    }

    func testloadDataWithMovieService() {

        // setting up expectation
        let dataExpectation = expectation(description: "loadNextPage expectation")

        // inject MovieService service to test view model real callback
        self.viewModel = HomeViewModel(service: MovieService())

        self.viewModel.loadNextPage(handler: { result in
            switch result {
            case .success:
                XCTAssertTrue(self.viewModel.movies.count == 20, "ViewModel data should count 20")
                XCTAssertTrue(self.viewModel.currentMovieData?.totalPages == 500, "ViewModel pages should count 500")
                XCTAssertTrue(self.viewModel.currentMovieData?.totalResults == 10000, "ViewModel results should count 10000")
                dataExpectation.fulfill()
            case .failure:
                XCTAssert(false, "ViewModel should not fail on this service")
                dataExpectation.fulfill()
            }
        })

        // check for expectation
        wait(for: [dataExpectation], timeout: 60)
    }
}

private class MockService : ServiceProtocol {
    var requestCalled: Bool = false
    func GETRequest<T: Codable>(_ parameters: [String: String], completionBlock: @escaping (Response<T>) -> Void) {
        requestCalled = true
    }
}
