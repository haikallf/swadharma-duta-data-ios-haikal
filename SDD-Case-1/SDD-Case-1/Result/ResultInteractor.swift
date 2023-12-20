//
//  ResultInteractor.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 20/12/23.
//

import Foundation
import CoreData

class ResultInteractor: ResultInteractorProtocol {
    var coreDataManager: CoreDataManagerProtocol?

    func saveTransaction(id: UUID, bankName: String, amount: Int64, merchant: String, isTopUp: Bool) {
        coreDataManager?.saveTransaction(id: id, bankName: bankName, amount: amount, merchant: merchant, isTopUp: isTopUp)
    }
}
