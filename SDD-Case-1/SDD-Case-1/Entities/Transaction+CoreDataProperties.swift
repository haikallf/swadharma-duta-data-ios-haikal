//
//  Transaction+CoreDataProperties.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 21/12/23.
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var bankName: String?
    @NSManaged public var amount: Int64
    @NSManaged public var merchant: String?
    @NSManaged public var isTopUp: Bool

}

extension Transaction : Identifiable {

}
