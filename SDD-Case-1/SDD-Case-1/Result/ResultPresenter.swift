//
//  ResultPresenter.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 20/12/23.
//

import Foundation

class ResultPresenter: ResultPresenterProtocol {
    weak var view: ResultViewProtocol?
    var interactor: ResultInteractorProtocol?
    var router: ResultRouterProtocol?

    var resultValue: String?

    func viewDidLoad() {
        view?.displayResultValue(resultValue)
    }
    
    func pay(for amount: Int) {
        let balance = UserDefaults.standard.integer(forKey: "balance")
        
        if balance > amount {
            let currentBalance = balance - amount
            UserDefaults.standard.setValue(currentBalance, forKey: "balance")
            router?.navigateToSuccess(from: view)
        } else {
            print("Unsufficient balance")
        }
    }
}
