//
//  ResultViewController.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 20/12/23.
//

import UIKit

class ResultViewController: UIViewController {
    var presenter: ResultPresenterProtocol?
    var resultValue: String?
    
    lazy var bankName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var transactionId: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var merchantName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var amount: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var payButton: UIButton = {
        let button = UIButton()
        button.setTitle("Scan", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(payButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func payButtonTapped() {
        guard let money = Int(amount.text ?? "0") else { return }
        presenter?.pay(for: money)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        presenter?.viewDidLoad()
    }

    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubviews(bankName, transactionId, merchantName, amount, payButton)

        NSLayoutConstraint.activate([
            bankName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            bankName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            transactionId.topAnchor.constraint(equalTo: bankName.bottomAnchor, constant: 14),
            transactionId.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            merchantName.topAnchor.constraint(equalTo: transactionId.bottomAnchor, constant: 14),
            merchantName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            amount.topAnchor.constraint(equalTo: merchantName.bottomAnchor, constant: 14),
            amount.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            payButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            payButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            payButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            payButton.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
}

extension ResultViewController: ResultViewProtocol {
    func displayResultValue(_ value: String?) {
        if let qrString = value {
            let qrArr: [String] = qrString.components(separatedBy: ".")
            bankName.text = qrArr[0]
            transactionId.text = qrArr[1]
            merchantName.text = qrArr[2]
            amount.text = qrArr[3]
        }
    }
}
