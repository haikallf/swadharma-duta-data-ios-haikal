//
//  HomeProtocols.swift
//  SDD-Case-3
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    
    func displayData(donut: [DonutChartDataDetails], line: LineChartDataDetails)
//    func displayTransactionHistory(_ transactions: [Transaction])
}

protocol HomeInteractorProtocol: AnyObject {
    
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }

//    func showQRScan()
//    func topUpBalance()
//    func checkUserDefaultsKey()
//    func fetchTransactionHistory()
    func fetchAllData()
}

protocol HomeRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func navigateToDetail(from view: HomeViewProtocol?)
}

