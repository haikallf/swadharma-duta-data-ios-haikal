//
//  DeepLinkViewController.swift
//  SDD-Case-4
//
//  Created by Haikal Lazuardi on 22/12/23.
//


import UIKit

class DeepLinkViewController: UIViewController {
    var presenter: DeepLinkPresenterProtocol?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var transactionCodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubviews(titleLabel, transactionCodeLabel)
        
        titleLabel.text = presenter?.url?["title"]
        transactionCodeLabel.text = presenter?.url?["transactionCode"]
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            transactionCodeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            transactionCodeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
        ])
    }
}

extension DeepLinkViewController: DeepLinkViewProtocol {
    
}
