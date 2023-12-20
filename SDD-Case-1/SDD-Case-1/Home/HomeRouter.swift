//
//  HomeRouter.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 20/12/23.
//

import UIKit

class HomeRouter: HomeRouterProtocol {
    static func createModule() -> UIViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        let coreDataManager = CoreDataManager(persistentContainer: (UIApplication.shared.delegate as! AppDelegate).persistentContainer)

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.coreDataManager = coreDataManager

        return view
    }

    func navigateToQRScan(from view: HomeViewProtocol?) {
        guard let sourceView = view as? UIViewController else { return }
        let qrScanModule = QRScanRouter.createModule()
        sourceView.navigationController?.pushViewController(qrScanModule, animated: true)
    }
    
    func navigateToHistory(from view: HomeViewProtocol?) {
        guard let sourceView = view as? UIViewController else { return }
        let qrScanModule = QRScanRouter.createModule()
        sourceView.navigationController?.pushViewController(qrScanModule, animated: true)
    }
}
