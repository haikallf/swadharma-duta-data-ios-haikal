//
//  HistoryProtocols.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 21/12/23.
//

import UIKit

protocol HistoryViewProtocol: AnyObject {
    var presenter: HistoryPresenterProtocol? { get set }
//    func displayCurrentBalance(_ value: Int?)
}

protocol HistoryInteractorProtocol: AnyObject {
    
}

protocol HistoryPresenterProtocol: AnyObject {
    var view: HistoryViewProtocol? { get set }
    var interactor: HistoryInteractorProtocol? { get set }
    var router: HistoryRouterProtocol? { get set }
    
    func fetchTransactionHistory()
}

protocol HistoryRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
