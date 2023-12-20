//
//  SuccessViewController.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 21/12/23.
//

import UIKit

class SuccessViewController: UIViewController {
    var presenter: SuccessPresenterProtocol?
    
    lazy var successLabel: UILabel = {
        let label = UILabel()
        label.text = "Transaction Successful!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var okButton: UIButton = {
        let button = UIButton()
        button.setTitle("OK", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubviews(successLabel, okButton)
        
        NSLayoutConstraint.activate([
            successLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            successLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            okButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            okButton.topAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 20),
            okButton.widthAnchor.constraint(equalToConstant: 100),
            okButton.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    @objc
    private func okButtonTapped() {
        presenter?.handleOKButtonTapped()
    }
}

extension SuccessViewController: SuccessViewProtocol {
    
}

