//
//  SuccessPresenter.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 21/12/23.
//

import Foundation

class SuccessPresenter: SuccessPresenterProtocol {
    weak var view: SuccessViewProtocol?
    var interactor: SuccessInteractorProtocol?
    var router: SuccessRouterProtocol?

    func handleOKButtonTapped() {
        router?.popToRoot()
    }
}

