//
//  HomeProtocols.swift
//  SDD-Case-2
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    
    func update(with users: [User])
    func update(with error: String)
}

protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    
    func getUsers()
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    func interactorDidFetchUsers(with: Result<[User], Error>)
}

protocol HomeRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
