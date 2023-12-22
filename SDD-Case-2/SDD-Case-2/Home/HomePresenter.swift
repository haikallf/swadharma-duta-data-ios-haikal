//
//  HomePresenter.swift
//  SDD-Case-2
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol? {
        didSet {
            interactor?.getUsers()
        }
    }
    var router: HomeRouterProtocol?
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.update(with: users)
            
        case .failure:
            view?.update(with: "Something went wrong")
        }
    }
}
