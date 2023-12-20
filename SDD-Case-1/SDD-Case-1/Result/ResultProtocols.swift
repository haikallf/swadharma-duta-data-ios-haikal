//
//  ResultProtocols.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 20/12/23.
//

import UIKit
import CoreData

protocol ResultViewProtocol: AnyObject {
    var presenter: ResultPresenterProtocol? { get set }
    
    func displayResultValue(_ value: String?)
}

protocol ResultInteractorProtocol: AnyObject {
    var coreDataManager: CoreDataManagerProtocol? { get set }

    func saveTransaction(id: UUID, bankName: String, amount: Int64, merchant: String, isTopUp: Bool)
}

protocol ResultPresenterProtocol: AnyObject {
    var view: ResultViewProtocol? { get set }
    var interactor: ResultInteractorProtocol? { get set }
    var router: ResultRouterProtocol? { get set }

    var resultValue: String? { get set }

    func viewDidLoad()
    
    func pay(id: UUID, bankName: String, amount: Int64, merchant: String, isTopUp: Bool)
    
    func saveTransaction(id: UUID, bankName: String, amount: Int64, merchant: String, isTopUp: Bool)
}

protocol ResultRouterProtocol: AnyObject {
    static func createModule(with resultValue: String) -> UIViewController
    func navigateToSuccess(from view: ResultViewProtocol?)
}
