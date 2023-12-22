//
//  HomeRouter.swift
//  SDD-Case-3
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
    
    func navigateToDetail(from view: HomeViewProtocol?, with item: DonutChartDataDetails) {
        guard let sourceView = view as? UIViewController else { return }
        let historyModule = HistoryRouter.createModule(with: item)
        sourceView.navigationController?.pushViewController(historyModule, animated: true)
    }
}
