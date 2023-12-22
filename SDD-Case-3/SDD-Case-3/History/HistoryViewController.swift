//
//  HistoryViewController.swift
//  SDD-Case-3
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import UIKit

class HistoryViewController: UIViewController {
    var presenter: HistoryPresenterProtocol?
    
    lazy var transactionTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: -36, left: -16, bottom: 0, right: 0)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.automaticallyAdjustsScrollIndicatorInsets = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    
    private func setup() {
        navigationItem.title = presenter?.selectedHistory?.label
        view.backgroundColor = .white
        view.addSubview(transactionTableView)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            transactionTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            transactionTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            transactionTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            transactionTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension HistoryViewController: HistoryViewProtocol, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.selectedHistory?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let transaction = presenter?.selectedHistory?.data?[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = "IDR \(transaction?.nominal ?? 0)"
        content.secondaryText = "\(transaction?.trx_date ?? "DD/MM/YYYY")"
        content.secondaryTextProperties.color = .gray
        
        cell.contentConfiguration = content
        cell.backgroundColor = .clear
        
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
        return cell
    }
}
