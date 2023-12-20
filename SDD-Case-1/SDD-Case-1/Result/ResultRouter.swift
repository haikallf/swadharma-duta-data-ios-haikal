//
//  ResultRouter.swift
//  SDD-Case-1
//
//  Created by Haikal Lazuardi on 20/12/23.
//

import UIKit

class ResultRouter: ResultRouterProtocol {
    static func createModule(with resultValue: String) -> UIViewController {
        let view = ResultViewController()
        let interactor = ResultInteractor()
        let presenter = ResultPresenter()
        let router = ResultRouter()
        let coreDataManager = CoreDataManager(persistentContainer: (UIApplication.shared.delegate as! AppDelegate).persistentContainer)

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.resultValue = resultValue
        
        interactor.coreDataManager = coreDataManager
        return view
    }
    
    func navigateToSuccess(from view: ResultViewProtocol?) {
        guard let sourceView = view as? UIViewController else { return }
        let resultModule = SuccessRouter.createModule()
        sourceView.navigationController?.pushViewController(resultModule, animated: true)
    }
}

