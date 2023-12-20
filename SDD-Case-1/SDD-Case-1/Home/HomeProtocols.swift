//
//  HomeProtocols.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 20/12/23.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func displayCurrentBalance(_ value: Int?)
}

protocol HomeInteractorProtocol: AnyObject {
    
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }

    func showQRScan()
    func topUpBalance()
    func checkUserDefaultsKey()
}

protocol HomeRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func navigateToQRScan(from view: HomeViewProtocol?)
}
