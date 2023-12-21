//
//  HomeViewController.swift
//  SDD-Case-3
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import UIKit
import DGCharts

class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?
    var donutData: [DonutChartDataDetails] = []
    var lineChartDataEntries: [ChartDataEntry] = []
    
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.rightAxis.enabled = false
        
        let yAxis = chartView.leftAxis
        yAxis.labelPosition = .outsideChart
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.setLabelCount(12, force: true)
        chartView.xAxis.valueFormatter = IntToMonth()
        
        chartView.animate(xAxisDuration: 0.6)
        return chartView
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
        view.addSubview(lineChartView)
        view.addSubview(transactionTableView)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            lineChartView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lineChartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            lineChartView.widthAnchor.constraint(equalToConstant: 324),
            lineChartView.heightAnchor.constraint(equalToConstant: 200),
            
            transactionTableView.topAnchor.constraint(equalTo: lineChartView.bottomAnchor, constant: 16),
            transactionTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            transactionTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            transactionTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension HomeViewController: HomeViewProtocol {
    func displayData(donut: [DonutChartDataDetails], line: LineChartDataDetails) {
        lineChartDataEntries.removeAll()
        
        for (idx, elmt) in line.month.enumerated() {
            lineChartDataEntries.append(ChartDataEntry(x: Double(idx), y: Double(elmt)))
        }
        
        DispatchQueue.main.async {
            let set = LineChartDataSet(entries: self.lineChartDataEntries, label: "Month")
            set.mode = .cubicBezier
            set.drawCirclesEnabled = false
            set.lineWidth = 3
            set.setColor(.systemBlue)
            set.drawHorizontalHighlightIndicatorEnabled = false
            
            let data = LineChartData(dataSet: set)
            data.setDrawValues(false)
            self.lineChartView.data = data
            
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
