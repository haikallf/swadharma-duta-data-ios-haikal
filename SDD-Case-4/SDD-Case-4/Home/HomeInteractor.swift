//
//  HomeInteractor.swift
//  SDD-Case-4
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import Foundation

class HomeInteractor: HomeInteractorProtocol {
    func sendPayloadToFirebase(data: Data) {
        guard let serverKey = Bundle.main.object(forInfoDictionaryKey: "Server Key") else { return }
        let fcmUrl = URL(string: "https://fcm.googleapis.com/fcm/send")!
        var request = URLRequest(url: fcmUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("key=\(serverKey)", forHTTPHeaderField: "Authorization")
        request.httpBody = data
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error sending payload to Firebase: \(error)")
            } else if let data = data {
                let responseString = String(data: data, encoding: .utf8)
                print("Response from Firebase: \(responseString ?? "")")
            }
        }
        
        task.resume()
    }
}
