//
//  HomePresenter.swift
//  SDD-Case-4
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    var view: HomeViewProtocol?
    
    var interactor: HomeInteractorProtocol?
    
    var router: HomeRouterProtocol?
    
    func didMoveToBackground() {
        print("App moved to background!")
        
        guard let token = UserDefaults.standard.string(forKey: "fcmToken") else { return }
        
        let payload: [String: Any] = [
            "to": token,
            "data": [
                "deepLink": "sample.id://transfer/result?title=SUKSES&transactionCode=RF001-204"
            ],
            "notification": [
                "title": "Push Notification!",
                "body": "Please check your transaction result"
            ]
        ]
        
        // Convert payload to Data
        if let data = try? JSONSerialization.data(withJSONObject: payload, options: []) {
            // Send the payload to Firebase
            interactor?.sendPayloadToFirebase(data: data)
        }
    }
}
