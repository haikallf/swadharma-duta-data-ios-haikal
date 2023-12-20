//
//  QRScanProtocols.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 20/12/23.
//

import UIKit

protocol QRScanViewProtocol: AnyObject {
    var presenter: QRScanPresenterProtocol? { get set }
    // Define methods or properties for the view if needed
}

protocol QRScanInteractorProtocol: AnyObject {
    // Define methods or properties for the interactor if needed
}

protocol QRScanPresenterProtocol: AnyObject {
    var view: QRScanViewProtocol? { get set }
    var interactor: QRScanInteractorProtocol? { get set }
    var router: QRScanRouterProtocol? { get set }

    func didFindQRCode(value: String)
    // Define other methods or properties for the presenter if needed
}

protocol QRScanRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func navigateToResult(from view: QRScanViewProtocol?, with qrCodeValue: String)
    // Define other methods or properties for the router if needed
}

