//
//  HomeViewController.swift
//  SDD-Case-2
//
//  Created by Haikal Lazuardi on 21/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?
    var users: [User] = []
    
    lazy var promoTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.automaticallyAdjustsScrollIndicatorInsets = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        layout()
    }
    
    func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Promo"
        
        view.addSubview(promoTableView)
        view.backgroundColor = .white
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            promoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            promoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            promoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            promoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension HomeViewController: HomeViewProtocol, UITableViewDelegate, UITableViewDataSource {
    func update(with users: [User]) {
        DispatchQueue.main.async {
            self.users = users
            self.promoTableView.reloadData()
            self.promoTableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.users = []
            self.promoTableView.isHidden = true
            let alert = UIAlertController(title: "Failed", message: error, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = users[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = user.name
        content.secondaryText = user.email
        
        cell.contentConfiguration = content
        
        cell.backgroundColor = .white
        return cell
    }
}

