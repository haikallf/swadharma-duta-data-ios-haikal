//
//  HomePresenter.swift
//  SDD-Case-3
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    func fetchAllData() {
        let data = Array.dummyData()
        var donutCharts: [DonutChartDataDetails] = []
        var lineChart: LineChartDataDetails?
        
        for chart in data {
            switch chart.data {
            case .donut(let donutChartData):
                for donutDetails in donutChartData {
                    donutCharts.append(donutDetails)
                }
            case .line(let lineChartData):
                lineChart = lineChartData
            }
        }
        
        guard let lineChart = lineChart else { return }
        
        view?.displayData(donut: donutCharts, line: lineChart)
    }
    
    func didClickeDonutChartItem(item: DonutChartDataDetails) {
        router?.navigateToDetail(from: view, with: item)
    }
}

