//
//  DeepLinkRouter.swift
//  SDD-Case-4
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import UIKit

class DeepLinkRouter: DeepLinkRouterProtocol {
    static func createModule(with url: URL) -> UIViewController {
        let view = DeepLinkViewController()
        let interactor = DeepLinkInteractor()
        let presenter = DeepLinkPresenter()
        let router = DeepLinkRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.url = url
        
        return view
    }
}
