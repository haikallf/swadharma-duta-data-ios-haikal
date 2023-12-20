//
//  CoreDataManager.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 21/12/23.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol {
    func saveTransaction(id: UUID, bankName: String, amount: Int64, merchant: String, isTopUp: Bool)
    
    func fetchTransactionHistory() -> [Transaction]
}

class CoreDataManager: CoreDataManagerProtocol {
    let persistentContainer: NSPersistentContainer
    
    init(persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
    }
    
    func saveTransaction(id: UUID, bankName: String, amount: Int64, merchant: String, isTopUp: Bool) {
        let context = persistentContainer.viewContext
        let newTransaction = Transaction(context: context)
        
        newTransaction.id = id
        newTransaction.bankName = bankName
        newTransaction.amount = amount
        newTransaction.merchant = merchant
        newTransaction.isTopUp = isTopUp
        
        do {
            try context.save()
            print("Transaction saved successfully.")
        } catch {
            print("Error saving transaction: \(error.localizedDescription)")
        }
    }
    
    func fetchTransactionHistory() -> [Transaction] {
        do {
            let context = persistentContainer.viewContext
            let fetchedHistories = try context.fetch(Transaction.fetchRequest())
            if (fetchedHistories.count > 0) {
                return fetchedHistories
            }
            return []
        } catch {
            print("Error fetching journeys: \(error.localizedDescription)")
            return []
        }
    }
}

