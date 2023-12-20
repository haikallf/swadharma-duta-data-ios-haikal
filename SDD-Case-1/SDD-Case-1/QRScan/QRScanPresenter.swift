//
//  QRScanPresenter.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 20/12/23.
//

import Foundation

class QRScanPresenter: QRScanPresenterProtocol {
    weak var view: QRScanViewProtocol?
    var interactor: QRScanInteractorProtocol?
    var router: QRScanRouterProtocol?

    func didFindQRCode(value: String) {
        print("Scanned")
        router?.navigateToResult(from: view, with: value)
    }
}

