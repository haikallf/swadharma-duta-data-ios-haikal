//
//  SuccessRouter.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 21/12/23.
//

import UIKit

class SuccessRouter: SuccessRouterProtocol {
    static func createModule() -> UIViewController {
        let view = SuccessViewController()
        let interactor = SuccessInteractor()
        let presenter = SuccessPresenter()
        let router = SuccessRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }

    func popToRoot() {
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}

