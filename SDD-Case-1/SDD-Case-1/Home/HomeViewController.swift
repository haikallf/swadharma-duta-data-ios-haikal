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
    
    lazy var qrLogo: UIImageView = {
        let qrCodeLogo = UIImageView(image: UIImage(systemName: "qrcode.viewfinder"))
        qrCodeLogo.isUserInteractionEnabled = true
        qrCodeLogo.translatesAutoresizingMaskIntoConstraints = false
        qrCodeLogo.contentMode = .scaleAspectFill
        return qrCodeLogo
    }()
    
    lazy var instructionLabel: UILabel = {
        let label = UILabel()
        label.text = "Please click to scan"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Rp 0"
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var incrementButton: UIButton = {
        let button = UIButton()
        button.setTitle("Top Up IDR 50K", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(topUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var scanButton: UIButton = {
        let button = UIButton()
        button.setTitle("Scan", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
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
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubviews(qrLogo, scanButton, balanceLabel, incrementButton)
        
        NSLayoutConstraint.activate([
            qrLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            qrLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            qrLogo.widthAnchor.constraint(equalToConstant: 100),
            
            balanceLabel.topAnchor.constraint(equalTo: qrLogo.bottomAnchor, constant: 60),
            balanceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            incrementButton.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 20),
            incrementButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            incrementButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            incrementButton.heightAnchor.constraint(equalToConstant: 52),
            
            scanButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scanButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scanButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scanButton.heightAnchor.constraint(equalToConstant: 52)
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
    func displayCurrentBalance(_ value: Int?) {
        let balance = Double(value ?? 0)
        balanceLabel.text = "\(balance.formatted(.currency(code: "IDR")))"
    }
}
