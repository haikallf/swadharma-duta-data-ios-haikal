//
//  Home.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 24/12/23.
//

import XCTest
@testable import SDD_Case_1

class HomePresenterTests: XCTestCase {
    
    var sut: HomePresenter!
    var mockView: MockHomeView!
    var mockInteractor: MockHomeInteractor!
    var mockRouter: MockHomeRouter!
    
    override func setUp() {
        super.setUp()
        sut = HomePresenter()
        mockView = MockHomeView()
        mockInteractor = MockHomeInteractor()
        mockRouter = MockHomeRouter()
        
        sut.view = mockView
        sut.interactor = mockInteractor
        sut.router = mockRouter
    }
    
    override func tearDown() {
        sut = nil
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
        super.tearDown()
    }
    
    func testShowQRScan() {
        sut.showQRScan()
        XCTAssertTrue(mockRouter.navigateToQRScanCalled)
    }
    
    func testTopUpBalance() {
        sut.topUpBalance()
        XCTAssertTrue(mockView.displayCurrentBalanceCalled)
    }
    
    func testCheckUserDefaultsKey() {
        sut.checkUserDefaultsKey()
        XCTAssertTrue(mockView.displayCurrentBalanceCalled)
    }
    
    func testFetchTransactionHistory() {
        sut.fetchTransactionHistory()
        XCTAssertTrue(mockInteractor.fetchTransactionHistoryCalled)
        XCTAssertTrue(mockView.displayTransactionHistoryCalled)
    }
}

class MockHomeView: HomeViewProtocol {
    var presenter: HomePresenterProtocol?
    
    var displayCurrentBalanceCalled = false
    var displayTransactionHistoryCalled = false
    
    func displayCurrentBalance(_ value: Int?) {
        displayCurrentBalanceCalled = true
    }
    
    func displayTransactionHistory(_ transactions: [Transaction]) {
        displayTransactionHistoryCalled = true
    }
}

class MockHomeInteractor: HomeInteractorProtocol {
    var coreDataManager: CoreDataManagerProtocol?
    
    var fetchTransactionHistoryCalled = false
    
    func fetchTransactionHistory() -> [Transaction] {
        fetchTransactionHistoryCalled = true
        return []
    }
}

class MockHomeRouter: HomeRouterProtocol {
    static func createModule() -> UIViewController {
        return UIViewController()
    }
    
    var navigateToQRScanCalled = false
    var navigateToHistoryCalled = false
    
    func navigateToQRScan(from view: HomeViewProtocol?) {
        navigateToQRScanCalled = true
    }
    
    func navigateToHistory(from view: HomeViewProtocol?) {
        navigateToHistoryCalled = true
    }
}

