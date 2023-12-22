//
//  ViewController.swift
//  SDD-Case-4
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    @objc 
    func appMovedToBackground() {
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
            sendPayloadToFirebase(data: data)
        }
    }
    
    func sendPayloadToFirebase(data: Data) {
        // Use your server or a cloud function to send the payload to Firebase
        // You can use a networking library or URLSession to make a POST request to the FCM endpoint
        // Replace "<Your FCM Server Key>" with your actual FCM Server Key
        let fcmUrl = URL(string: "https://fcm.googleapis.com/fcm/send")!
        var request = URLRequest(url: fcmUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("key=AAAAR-N_4Wg:APA91bFS81RpYNvgwn3cjCz3qRmH6yECe5vxp87_KAxKIXhRJlCoQ3WwK5Qa5rksutHk4k5uiYJjAI6EWLFbhGBTVc-0xeCyse_SOJmbLGVRFTZa3c1ZvW6hEcuGbF_t3hSW85Y4SweD", forHTTPHeaderField: "Authorization")
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

