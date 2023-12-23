//
//  SuccessTests.swift
//  SDD-Case-1Tests
//
//  Created by Haikal Lazuardi on 24/12/23.
//

import XCTest
@testable import SDD_Case_1

class SuccessTests: XCTestCase {
    var successViewController: SuccessViewController!
    var mockPresenter: MockSuccessPresenter!
    
    override func setUp() {
        super.setUp()
        mockPresenter = MockSuccessPresenter()
        successViewController = SuccessRouter.createModule() as? SuccessViewController
        successViewController.presenter = mockPresenter
        
        XCTAssertNotNil(successViewController.view)
    }
    
    override func tearDown() {
        successViewController = nil
        mockPresenter = nil
        super.tearDown()
    }
    
    func testSuccessPresenterHandleOKButtonTapped() {
        let mockView = MockSuccessView()
        let mockInteractor = MockSuccessInteractor()
        let mockRouter = MockSuccessRouter()
        let presenter = MockSuccessPresenter()
        
        presenter.view = mockView
        presenter.interactor = mockInteractor
        presenter.router = mockRouter
        
        presenter.handleOKButtonTapped()
        
        XCTAssertTrue(mockRouter.didPopToRoot)
    }
}

class MockSuccessView: SuccessViewProtocol {
    var presenter: SuccessPresenterProtocol?
    
}

class MockSuccessInteractor: SuccessInteractorProtocol {
    
}

class MockSuccessRouter: SuccessRouterProtocol {
    var didPopToRoot = false
    
    static func createModule() -> UIViewController {
        return UIViewController()
    }
    
    func popToRoot() {
        didPopToRoot = true
    }
}

class MockSuccessPresenter: SuccessPresenterProtocol {
    var view: SuccessViewProtocol?
    var interactor: SuccessInteractorProtocol?
    var router: SuccessRouterProtocol?
    
    func handleOKButtonTapped() {
        router?.popToRoot()
    }
}

