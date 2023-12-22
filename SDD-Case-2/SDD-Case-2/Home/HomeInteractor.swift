//
//  HomeInteractor.swift
//  SDD-Case-2
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import Foundation

enum FetchError: Error {
    case failed
}

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?
    
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
            
            do {
                let entities = try JSONDecoder().decode([User].self, from: data)
                self?.presenter?.interactorDidFetchUsers(with: .success(entities))
            } catch {
                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
            }
        }
        
        task.resume()
    }
}
