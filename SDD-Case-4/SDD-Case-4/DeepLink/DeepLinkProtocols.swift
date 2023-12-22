//
//  DeepLinkProtocols.swift
//  SDD-Case-4
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import UIKit

protocol DeepLinkViewProtocol: AnyObject {
    var presenter: DeepLinkPresenterProtocol? { get set }
}

protocol DeepLinkInteractorProtocol: AnyObject {
//    func sendPayloadToFirebase(data: Data)
}

protocol DeepLinkPresenterProtocol: AnyObject {
    var view: DeepLinkViewProtocol? { get set }
    var interactor: DeepLinkInteractorProtocol? { get set }
    var router: DeepLinkRouterProtocol? { get set }
    
    var url: URL? { get set }
}

protocol DeepLinkRouterProtocol: AnyObject {
    static func createModule(with url: URL) -> UIViewController
}
