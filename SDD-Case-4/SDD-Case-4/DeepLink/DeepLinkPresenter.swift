//
//  DeepLinkPresenter.swift
//  SDD-Case-4
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import Foundation

class DeepLinkPresenter: DeepLinkPresenterProtocol {
    var view: DeepLinkViewProtocol?
    var interactor: DeepLinkInteractorProtocol?
    var router: DeepLinkRouterProtocol?
    
    var url: URL?
}
