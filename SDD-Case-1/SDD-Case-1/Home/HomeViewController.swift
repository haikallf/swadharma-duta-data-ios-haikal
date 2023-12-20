//
//  HomeViewController.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 20/12/23.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?
    var transactions: [Transaction] = []
    
    lazy var balanceTitle: UILabel = {
        let label = UILabel()
        label.text = "Your balance:"
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Rp 0"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var topUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Top Up IDR 50K", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(topUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
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
    
    lazy var scanButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "qrcode.viewfinder"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.imageView?.layer.transform = CATransform3DMakeScale(1.8, 1.8, 1.8)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(scanButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.checkUserDefaultsKey()
        presenter?.fetchTransactionHistory()
    }
    
    private func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "E-Wallet"
        
        view.backgroundColor = .white
        view.addSubviews(balanceTitle, balanceLabel, scanButton, balanceLabel, topUpButton, transactionTableView)
        
        transactionTableView.rowHeight = UITableView.automaticDimension
        
        NSLayoutConstraint.activate([
            balanceTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            balanceTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            balanceLabel.topAnchor.constraint(equalTo: balanceTitle.bottomAnchor, constant: 4),
            balanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            topUpButton.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 20),
            topUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            topUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            topUpButton.heightAnchor.constraint(equalToConstant: 52),
            
            transactionTableView.topAnchor.constraint(equalTo: topUpButton.bottomAnchor, constant: 16),
            transactionTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            transactionTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            transactionTableView.bottomAnchor.constraint(equalTo: scanButton.topAnchor, constant: -16),
            
            scanButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scanButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scanButton.widthAnchor.constraint(equalToConstant: 60),
            scanButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    @objc
    private func scanButtonTapped() {
        presenter?.showQRScan()
    }
    
    @objc
    private func topUpButtonTapped() {
        presenter?.topUpBalance()
    }
}

extension HomeViewController: HomeViewProtocol {
    func displayTransactionHistory(_ transactions: [Transaction]) {
        DispatchQueue.main.async {
            self.transactions = transactions
            self.transactionTableView.reloadData()
        }
    }
    
    func displayCurrentBalance(_ value: Int?) {
        let balance = Double(value ?? 0)
        balanceLabel.text = "\(balance.formatted(.currency(code: "IDR")))"
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let transaction = transactions[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = "IDR \(transaction.amount)"
        content.secondaryText = "\(transaction.merchant ?? "Unknown Merchant")"
        content.secondaryTextProperties.color = .gray
        
        cell.contentConfiguration = content
        cell.backgroundColor = .clear
        
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
        return cell
    }
}
