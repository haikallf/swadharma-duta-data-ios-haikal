//
//  HistoryViewController.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 21/12/23.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController {
    var presenter: HistoryPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.fetchTransactionHistory()
    }
    
    private func setupUI() {
        view.backgroundColor = .red
    }
}

extension HistoryViewController: HistoryViewProtocol {
    func displayTransactionHistory(_ transactions: [Transaction]) {
        
    }
}

