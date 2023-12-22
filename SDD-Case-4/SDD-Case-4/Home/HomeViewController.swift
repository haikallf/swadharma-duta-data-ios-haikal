//
//  HomeViewController.swift
//  SDD-Case-4
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Push Notification"
        
        view.backgroundColor = .white
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    @objc
    func appMovedToBackground() {
        presenter?.didMoveToBackground()
    }
}

extension HomeViewController: HomeViewProtocol {
    
}

