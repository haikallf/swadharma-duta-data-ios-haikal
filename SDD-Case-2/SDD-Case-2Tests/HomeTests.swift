//
//  HomeTests.swift
//  SDD-Case-2Tests
//
//  Created by Haikal Lazuardi on 24/12/23.
//

import XCTest
@testable import SDD_Case_2

class HomeTests: XCTestCase {
    var homeViewController: HomeViewController!
    var mockPresenter: MockHomePresenter!

    override func setUp() {
        super.setUp()
        mockPresenter = MockHomePresenter()
        homeViewController = HomeRouter.createModule() as? HomeViewController
        homeViewController.presenter = mockPresenter
        
        XCTAssertNotNil(homeViewController.view)
    }

    override func tearDown() {
        homeViewController = nil
        mockPresenter = nil
        super.tearDown()
    }

    func testHomePresenterInteractorDidFetchUsersSuccess() {
        // Given
        let mockView = MockHomeView()
        let mockInteractor = MockHomeInteractor()
        let presenter = MockHomePresenter()

        presenter.view = mockView
        presenter.interactor = mockInteractor

        // Create an expectation
        let expectation = expectation(description: "Wait for data to be fetched")

        // When
        if let mockView = mockView as? MockHomeView {
            mockView.expectation = expectation // Pass the expectation to the mockView
        }

        // Assume that your interactor's getUsers function is asynchronous
        DispatchQueue.global().async {
            presenter.interactorDidFetchUsers(with: .success([
                User(name: "Test", email: "test@email.com")
            ]))
        }

        // Then
        waitForExpectations(timeout: 1) { error in
            XCTAssertNil(error, "Timeout exceeded")
            XCTAssertTrue(mockView.didUpdateWithUsers)
        }
    }

    func testHomePresenterInteractorDidFetchUsersFailure() {
        // Given
        let mockView = MockHomeView()
        let mockInteractor = MockHomeInteractor()
        let presenter = MockHomePresenter()

        presenter.view = mockView
        presenter.interactor = mockInteractor

        // Create an expectation
        let expectation = expectation(description: "Wait for error to be handled")

        // When
        mockView.expectation = expectation // Pass the expectation to the mockView

        // Assume that your interactor's getUsers function is asynchronous
        DispatchQueue.global().async {
            presenter.interactorDidFetchUsers(with: .failure(NSError(domain: "Test", code: 0, userInfo: nil)))
            expectation.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "Timeout exceeded")
            XCTAssertTrue(mockView.didUpdateWithError)
        }
    }
}

class MockHomeView: HomeViewProtocol {
    var presenter: HomePresenterProtocol?
    var didUpdateWithUsers = false
    var didUpdateWithError = false
    var expectation: XCTestExpectation?

    func update(with users: [User]) {
        didUpdateWithUsers = true
        expectation?.fulfill()
    }

    func update(with error: String) {
        didUpdateWithError = true
        expectation?.fulfill()
    }
}


class MockHomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?

    func getUsers() {
        // Implement if needed for testing
    }
}

class MockHomePresenter: HomePresenterProtocol {
    var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?

    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        // Implement if needed for testing
    }
}

class MockHomeRouter: HomeRouterProtocol {
    static func createModule() -> UIViewController {
        return UIViewController()
    }
}

