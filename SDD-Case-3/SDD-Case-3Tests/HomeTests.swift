//
//  HomeTests.swift
//  SDD-Case-3Tests
//
//  Created by Haikal Lazuardi on 24/12/23.
//

import XCTest
@testable import SDD_Case_3

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
    
    func testHomePresenterFetchAllData() {
        let mockView = MockHomeView()
        let mockInteractor = MockHomeInteractor()
        let presenter = HomePresenter()
        
        presenter.view = mockView
        presenter.interactor = mockInteractor
        presenter.fetchAllData()
        
        XCTAssertTrue(mockView.didDisplayData)
    }
    
    func testHomePresenterDidClickDonutChartItem() {
        let mockView = MockHomeView()
        let mockInteractor = MockHomeInteractor()
        let mockRouter = MockHomeRouter()
        let presenter = HomePresenter()
        
        presenter.view = mockView
        presenter.interactor = mockInteractor
        presenter.router = mockRouter
        
        presenter.didClickeDonutChartItem(item: DonutChartDataDetails(label: "Tarik Tunai", percentage: "55", data: [
            ChartDataPoint(trx_date: "21/01/2023", nominal: 1000000),
            ChartDataPoint(trx_date: "20/01/2023", nominal: 500000),
            ChartDataPoint(trx_date: "19/01/2023", nominal: 1000000)
        ]))
        
        XCTAssertTrue(mockRouter.didNavigateToDetail)
    }
}

class MockHomeView: HomeViewProtocol {
    var presenter: HomePresenterProtocol?
    var didDisplayData = false
    var didNavigateToDetail = false
    
    func displayData(donut: [DonutChartDataDetails], line: LineChartDataDetails) {
        didDisplayData = true
    }
}

class MockHomeInteractor: HomeInteractorProtocol {
    // Implement if needed for testing
}

class MockHomePresenter: HomePresenterProtocol {
    var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    func fetchAllData() {
        view?.displayData(donut: [], line: LineChartDataDetails(month: [1, 2, 3, 4]))
    }
    
    func didClickeDonutChartItem(item: DonutChartDataDetails) {
        router?.navigateToDetail(from: view, with: item)
    }
}

class MockHomeRouter: HomeRouterProtocol {
    var didNavigateToDetail = false
    
    static func createModule() -> UIViewController {
        return UIViewController()
    }
    
    func navigateToDetail(from view: HomeViewProtocol?, with item: DonutChartDataDetails) {
        didNavigateToDetail = true
    }
}
