//
//  HomePresenter.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 20/12/23.
//

import Foundation
import UIKit

class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    func showQRScan() {
        router?.navigateToQRScan(from: view)
    }
    
    func checkUserDefaultsKey() {
        var amount: Int = 0
        
        if UserDefaults.standard.object(forKey: "balance") != nil {
            amount = UserDefaults.standard.integer(forKey: "balance")
        } else {
            UserDefaults.standard.setValue(amount, forKey: "balance")
        }
        
        view?.displayCurrentBalance(amount)
    }
    
    func topUpBalance() {
        var balance = UserDefaults.standard.integer(forKey: "balance")
        balance += 50000
        UserDefaults.standard.setValue(balance, forKey: "balance")
        view?.displayCurrentBalance(balance)
    }
    
    func fetchTransactionHistory() {
        let transactions = interactor?.fetchTransactionHistory()
        view?.displayTransactionHistory(transactions ?? [])
    }
}
