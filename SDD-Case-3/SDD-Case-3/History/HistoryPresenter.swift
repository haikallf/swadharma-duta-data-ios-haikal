//
//  HistoryPresenter.swift
//  SDD-Case-3
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import Foundation

class HistoryPresenter: HistoryPresenterProtocol {
    weak var view: HistoryViewProtocol?
    var interactor: HistoryInteractorProtocol?
    var router: HistoryRouterProtocol?
    
    var selectedHistory: DonutChartDataDetails?
}
