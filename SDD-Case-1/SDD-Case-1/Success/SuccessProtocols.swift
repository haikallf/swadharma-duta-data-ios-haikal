//
//  SuccessProtocols.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 21/12/23.
//

import UIKit

protocol SuccessViewProtocol: AnyObject {
    var presenter: SuccessPresenterProtocol? { get set }
}

protocol SuccessInteractorProtocol: AnyObject {
    
}

protocol SuccessPresenterProtocol: AnyObject {
    var view: SuccessViewProtocol? { get set }
    var interactor: SuccessInteractorProtocol? { get set }
    var router: SuccessRouterProtocol? { get set }

    func handleOKButtonTapped()
}

protocol SuccessRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func popToRoot()
}
