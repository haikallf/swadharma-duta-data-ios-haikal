//
//  QRScanProtocols.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 20/12/23.
//

import UIKit

protocol QRScanViewProtocol: AnyObject {
    var presenter: QRScanPresenterProtocol? { get set }
    
}

protocol QRScanInteractorProtocol: AnyObject {
    
}

protocol QRScanPresenterProtocol: AnyObject {
    var view: QRScanViewProtocol? { get set }
    var interactor: QRScanInteractorProtocol? { get set }
    var router: QRScanRouterProtocol? { get set }

    func didFindQRCode(value: String)
}

protocol QRScanRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func navigateToResult(from view: QRScanViewProtocol?, with qrCodeValue: String)
}

