//
//  HistoryPresenter.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 21/12/23.
//

import Foundation

class HistoryPresenter: HistoryPresenterProtocol {
    var view: HistoryViewProtocol?
    var interactor: HistoryInteractorProtocol?
    var router: HistoryRouterProtocol?
    
    func fetchTransactionHistory() {
        print("Fetching...")
    }
}
