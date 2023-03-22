//
//  UserViewModel.swift
//  AlamofireAPIServiceMVVM
//
//  Created by Fatih Durmaz on 22.03.2023.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users = [User]()
    let apiService = ApiService<User>()
    
    func fetchUsers() {
        apiService.fetchData(from: "https://jsonplaceholder.typicode.com/users") { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.users = data
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
