//
//  HomeRouter.swift
//  SDD-Case-2
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import UIKit

class HomeRouter: HomeRouterProtocol {
    weak var view: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = HomeViewController()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
