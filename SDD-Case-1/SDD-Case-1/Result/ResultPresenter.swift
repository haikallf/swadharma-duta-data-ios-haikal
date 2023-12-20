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
    
    func pay(id: UUID, bankName: String, amount: Int64, merchant: String, isTopUp: Bool) {
        let balance = UserDefaults.standard.integer(forKey: "balance")
        
        if balance > amount {
            let currentBalance = Int(Int64(balance) - amount)
            UserDefaults.standard.setValue(currentBalance, forKey: "balance")
            saveTransaction(id: id, bankName: bankName, amount: amount, merchant: merchant, isTopUp: isTopUp)
            router?.navigateToSuccess(from: view)
        } else {
            print("Insufficient balance")
        }
    }
    
    func saveTransaction(id: UUID, bankName: String, amount: Int64, merchant: String, isTopUp: Bool) {
        interactor?.saveTransaction(id: id, bankName: bankName, amount: amount, merchant: merchant, isTopUp: isTopUp)
    }
}
