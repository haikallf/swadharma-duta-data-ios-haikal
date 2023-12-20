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
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(qrLogo)
        view.addSubview(scanButton)
        
        NSLayoutConstraint.activate([
            qrLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            qrLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            qrLogo.widthAnchor.constraint(equalToConstant: 100),
            
            scanButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scanButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scanButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scanButton.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    @objc private func scanButtonTapped() {
        presenter?.showQRScan()
    }
}

extension HomeViewController: HomeViewProtocol {
    
}
