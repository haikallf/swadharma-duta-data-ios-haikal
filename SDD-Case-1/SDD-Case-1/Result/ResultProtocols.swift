//
//  ResultProtocols.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 20/12/23.
//

import UIKit

protocol ResultViewProtocol: AnyObject {
    var presenter: ResultPresenterProtocol? { get set }
    
    func displayResultValue(_ value: String?)
}

protocol ResultInteractorProtocol: AnyObject {
    
}

protocol ResultPresenterProtocol: AnyObject {
    var view: ResultViewProtocol? { get set }
    var interactor: ResultInteractorProtocol? { get set }
    var router: ResultRouterProtocol? { get set }

    var resultValue: String? { get set }

    func viewDidLoad()
    
    func pay(for amount: Int)
}

protocol ResultRouterProtocol: AnyObject {
    static func createModule(with resultValue: String) -> UIViewController
    func navigateToSuccess(from view: ResultViewProtocol?)
}
