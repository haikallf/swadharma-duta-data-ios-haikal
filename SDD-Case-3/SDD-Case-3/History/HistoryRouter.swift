//
//  HistoryRouter.swift
//  SDD-Case-3
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import UIKit

class HistoryRouter: HistoryRouterProtocol {
    static func createModule(with item: DonutChartDataDetails) -> UIViewController {
        let view = HistoryViewController()
        let interactor = HistoryInteractor()
        let presenter = HistoryPresenter()
        let router = HistoryRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.selectedHistory = item
        
        return view
    }
}
