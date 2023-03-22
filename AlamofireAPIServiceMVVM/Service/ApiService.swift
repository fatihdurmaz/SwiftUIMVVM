//
//  ApiService.swift
//  AlamofireAPIServiceMVVM
//
//  Created by Fatih Durmaz on 22.03.2023.
//

import Foundation
import Alamofire

class ApiService<T: Codable> {
    // ekleme silme güncelleme metotlarıda ileride eklenecek.
    func fetchData(from url: String, completion: @escaping (Result<[T], Error>) -> Void) {
        
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: [T].self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

