//
//  ResultTests.swift
//  SDD-Case-1Tests
//
//  Created by Haikal Lazuardi on 24/12/23.
//

import XCTest
@testable import SDD_Case_1

class ResultTests: XCTestCase {
    var resultViewController: ResultViewController!
    var mockPresenter: MockResultPresenter!
    
    override func setUp() {
        super.setUp()
        mockPresenter = MockResultPresenter()
        resultViewController = ResultRouter.createModule(with: "BNI.ID12345678.MERCHANT MOCK TEST.50000") as? ResultViewController
        resultViewController.presenter = mockPresenter
        
        resultViewController.presenter = mockPresenter
        
        XCTAssertNotNil(resultViewController.view)
    }
    
    override func tearDown() {
        resultViewController = nil
        mockPresenter = nil
        super.tearDown()
    }
    
    func testResultPresenterViewDidLoad() {
        let mockView = MockResultView()
        let mockInteractor = MockResultInteractor()
        let mockRouter = MockResultRouter()
        let presenter = MockResultPresenter()
        
        presenter.view = mockView
        presenter.interactor = mockInteractor
        presenter.router = mockRouter
        presenter.resultValue = "BNI.ID12345678.MERCHANT MOCK TEST.50000"
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(mockView.didDisplayResultValue)
    }
    
    func testResultPresenterPay() {
        let mockView = MockResultView()
        let mockInteractor = MockResultInteractor()
        let mockRouter = MockResultRouter()
        let presenter = MockResultPresenter()
        
        presenter.view = mockView
        presenter.interactor = mockInteractor
        presenter.router = mockRouter
        
        presenter.pay(id: UUID(), bankName: "BNI", amount: 50000, merchant: "MERCHANT MOCK TEST", isTopUp: false)
        
        XCTAssertTrue(mockInteractor.didSaveTransaction)
    }
}

class MockResultView: ResultViewProtocol {
    var presenter: ResultPresenterProtocol?
    var didDisplayResultValue = false
    
    func displayResultValue(_ value: String?) {
        didDisplayResultValue = true
    }
}

class MockResultInteractor: ResultInteractorProtocol {
    var coreDataManager: CoreDataManagerProtocol?
    var didSaveTransaction = false
    
    func saveTransaction(id: UUID, bankName: String, amount: Int64, merchant: String, isTopUp: Bool) {
        didSaveTransaction = true
    }
}

class MockResultRouter: ResultRouterProtocol {
    static func createModule(with resultValue: String) -> UIViewController {
        return UIViewController()
    }
    
    func navigateToSuccess(from view: ResultViewProtocol?) {
        // Implement if needed for testing
    }
}

class MockResultPresenter: ResultPresenterProtocol {
    var view: ResultViewProtocol?
    var interactor: ResultInteractorProtocol?
    var router: ResultRouterProtocol?
    
    var resultValue: String?
    
    func viewDidLoad() {
        view?.displayResultValue(resultValue)
    }
    
    func pay(id: UUID, bankName: String, amount: Int64, merchant: String, isTopUp: Bool) {
        interactor?.saveTransaction(id: id, bankName: bankName, amount: amount, merchant: merchant, isTopUp: isTopUp)
    }
    
    func saveTransaction(id: UUID, bankName: String, amount: Int64, merchant: String, isTopUp: Bool) {
        interactor?.saveTransaction(id: id, bankName: bankName, amount: amount, merchant: merchant, isTopUp: isTopUp)
    }
}
