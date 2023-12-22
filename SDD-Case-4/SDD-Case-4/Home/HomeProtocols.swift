//
//  HomeProtocols.swift
//  SDD-Case-4
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
}

protocol HomeInteractorProtocol: AnyObject {
    func sendPayloadToFirebase(data: Data)
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    func didMoveToBackground()
}

protocol HomeRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
