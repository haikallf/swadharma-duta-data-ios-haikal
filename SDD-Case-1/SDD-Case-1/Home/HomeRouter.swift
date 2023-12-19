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

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }

    func navigateToQRScan(from view: HomeViewProtocol?) {
        print("Clicked")
        guard let sourceView = view as? UIViewController else { return }
//        let qrScanModule = QRScanRouter.createModule()
//        sourceView.navigationController?.pushViewController(qrScanModule, animated: true)
    }
}
