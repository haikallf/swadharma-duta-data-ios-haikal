//
//  QRScanRouter.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 20/12/23.
//

import UIKit

class QRScanRouter: QRScanRouterProtocol {
    static func createModule() -> UIViewController {
        let view = QRScanViewController()
        let interactor = QRScanInteractor()
        let presenter = QRScanPresenter()
        let router = QRScanRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }

    func navigateToResult(from view: QRScanViewProtocol?, with qrCodeValue: String) {
        guard let sourceView = view as? UIViewController else { return }
        let resultModule = ResultRouter.createModule(with: qrCodeValue)
        sourceView.navigationController?.pushViewController(resultModule, animated: true)
    }
}
