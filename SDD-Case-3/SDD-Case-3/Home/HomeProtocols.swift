//
//  HomeProtocols.swift
//  SDD-Case-3
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    
    func displayData(donut: [DonutChartDataDetails], line: LineChartDataDetails)
}

protocol HomeInteractorProtocol: AnyObject {
    
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    func fetchAllData()
    func didClickeDonutChartItem(item: DonutChartDataDetails)
}

protocol HomeRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func navigateToDetail(from view: HomeViewProtocol?, with item: DonutChartDataDetails)
}

