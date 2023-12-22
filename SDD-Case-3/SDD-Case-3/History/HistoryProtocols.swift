//
//  HistoryProtocols.swift
//  SDD-Case-3
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import UIKit

protocol HistoryViewProtocol: AnyObject {
    var presenter: HistoryPresenterProtocol? { get set }
}

protocol HistoryInteractorProtocol: AnyObject {
    
}

protocol HistoryPresenterProtocol: AnyObject {
    var view: HistoryViewProtocol? { get set }
    var interactor: HistoryInteractorProtocol? { get set }
    var router: HistoryRouterProtocol? { get set }

    var selectedHistory: DonutChartDataDetails? { get set }
//    func showQRScan()
//    func topUpBalance()
//    func checkUserDefaultsKey()
//    func fetchTransactionHistory()
}

protocol HistoryRouterProtocol: AnyObject {
    static func createModule(with item: DonutChartDataDetails) -> UIViewController
}
