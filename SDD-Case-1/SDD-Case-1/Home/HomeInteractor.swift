//
//  HomeInteractor.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 20/12/23.
//

import Foundation

class HomeInteractor: HomeInteractorProtocol {
    var coreDataManager: CoreDataManagerProtocol?
    
    func fetchTransactionHistory() -> [Transaction] {
        return coreDataManager?.fetchTransactionHistory() ?? []
    }
}
