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
    var donutChartDataEntries: [PieChartDataEntry] = []
    
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
    
    lazy var donutChartView: PieChartView = {
        let chartView = PieChartView()
        chartView.delegate = self
        chartView.animate(xAxisDuration: 1.5, easingOption: .easeOutBack)
        chartView.translatesAutoresizingMaskIntoConstraints = false
        return chartView
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
        view.addSubview(donutChartView)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            lineChartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            lineChartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            lineChartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            lineChartView.heightAnchor.constraint(equalToConstant: 200),
            
            donutChartView.topAnchor.constraint(equalTo: lineChartView.bottomAnchor, constant: 16),
            donutChartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            donutChartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            donutChartView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension HomeViewController: HomeViewProtocol {
    func displayData(donut: [DonutChartDataDetails], line: LineChartDataDetails) {
        lineChartDataEntries.removeAll()
        
        for (idx, elmt) in line.month.enumerated() {
            lineChartDataEntries.append(ChartDataEntry(x: Double(idx), y: Double(elmt)))
        }
        
        for (_, elmt) in donut.enumerated() {
            donutChartDataEntries.append(PieChartDataEntry(value: Double(elmt.percentage ?? "0") ?? 0, label: elmt.label, data: elmt.data))
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
            
            let donutSet = PieChartDataSet(entries: self.donutChartDataEntries)
            donutSet.colors = ChartColorTemplates.pastel()
            donutSet.highlightEnabled = false
            
            let donutData = PieChartData(dataSet: donutSet)
            self.donutChartView.data = donutData
            
            self.donutData = donut
        }
    }
}

extension HomeViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        if let dataSet = chartView.data?.dataSets[highlight.dataSetIndex] {
            let sliceIndex: Int = dataSet.entryIndex(entry: entry)
            presenter?.didClickeDonutChartItem(item: self.donutData[sliceIndex])
            print( "Selected slice index: \(sliceIndex) \(self.donutData[sliceIndex].label ?? "")")
        }
    }
}
