//
//  QRScan.swift
//  SDD-Case-1Tests
//
//  Created by Haikal Lazuardi on 24/12/23.
//

import XCTest
@testable import SDD_Case_1

class QRScanTests: XCTestCase {
    
    func testQRScanPresenterDidFindQRCode() {
        let mockView = MockQRScanView()
        let mockInteractor = MockQRScanInteractor()
        let mockRouter = MockQRScanRouter()
        let presenter = MockQRScanPresenter()
        
        presenter.view = mockView
        presenter.interactor = mockInteractor
        presenter.router = mockRouter
        
        presenter.didFindQRCode(value: "BNI.ID12345678.MERCHANT MOCK TEST.50000")
        XCTAssertTrue(true)
    }
}

// MARK: - Mock Classes

class MockQRScanView: QRScanViewProtocol {
    var presenter: QRScanPresenterProtocol?
}

class MockQRScanInteractor: QRScanInteractorProtocol {
    
}

class MockQRScanRouter: QRScanRouterProtocol {
    static func createModule() -> UIViewController {
        return UIViewController()
    }
    
    func navigateToResult(from view: QRScanViewProtocol?, with qrCodeValue: String) {
        // Do nothing for testing
    }
}

class MockQRScanPresenter: QRScanPresenterProtocol {
    var view: QRScanViewProtocol?
    var interactor: QRScanInteractorProtocol?
    var router: QRScanRouterProtocol?
    
    func didFindQRCode(value: String) {
        // Do nothing for testing
    }
}
