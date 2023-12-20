//
//  HistoryRouter.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 21/12/23.
//

import UIKit

class HistoryRouter: HistoryRouterProtocol {
    static func createModule() -> UIViewController {
        let view = HistoryViewController()
        let interactor = HistoryInteractor()
        let presenter = HistoryPresenter()
        let router = HistoryRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }
}
