//
//  HomeProtocols.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 20/12/23.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    // Define methods or properties for the view if needed
}

protocol HomeInteractorProtocol: AnyObject {
    // Define methods or properties for the interactor if needed
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }

    func showQRScan()
    // Define other methods or properties for the presenter if needed
}

protocol HomeRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func navigateToQRScan(from view: HomeViewProtocol?)
    // Define other methods or properties for the router if needed
}
