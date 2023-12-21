//
//  HomeViewController.swift
//  SDD-Case-3
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?
    var donutData: [DonutChartDataDetails] = []
    
    lazy var lineChart: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chart.xyaxis.line")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        presenter?.fetchAllData()
    }
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(lineChart)
        view.addSubview(transactionTableView)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            lineChart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lineChart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            lineChart.widthAnchor.constraint(equalToConstant: 200),
            lineChart.heightAnchor.constraint(equalToConstant: 200),
            
            transactionTableView.topAnchor.constraint(equalTo: lineChart.bottomAnchor, constant: 16),
            transactionTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            transactionTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            transactionTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension HomeViewController: HomeViewProtocol {
    func displayData(donut: [DonutChartDataDetails], line: LineChartDataDetails) {
        DispatchQueue.main.async {
            self.donutData = donut
            self.transactionTableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        donutData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let transaction = donutData[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = "\(transaction.percentage ?? "0")%"
        content.secondaryText = "\(transaction.label ?? "Unknown Transaction")"
        content.secondaryTextProperties.color = .gray
        
        cell.contentConfiguration = content
        cell.backgroundColor = .clear
        
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
        return cell
    }
}
