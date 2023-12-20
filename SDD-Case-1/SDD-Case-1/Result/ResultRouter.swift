//
//  ResultRouter.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 20/12/23.
//

import UIKit

class ResultRouter: ResultRouterProtocol {
    static func createModule(with resultValue: String) -> UIViewController {
        let view = ResultViewController()
        let interactor = ResultInteractor()
        let presenter = ResultPresenter()
        let router = ResultRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.resultValue = resultValue

        return view
    }
    
//    func navigateToSuccessPage(from view: ResultViewProtocol?) {
//        
////        guard let sourceView = view as? UIViewController else { return }
////        let qrScanModule = QRScanRouter.createModule()
////        sourceView.navigationController?.pushViewController(qrScanModule, animated: true)
//    }
    func navigateToSuccess(from view: ResultViewProtocol?) {
        print("Success")
    }
}

