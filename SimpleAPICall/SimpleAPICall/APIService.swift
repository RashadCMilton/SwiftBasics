//
//  APIService.swift
//  SimpleAPICall
//
//  Created by Rashad Milton on 2/24/25.
//

import Foundation

final class APIService {
    static let shared = APIService()
    private init() {}
    func fetchData(url: String, completion: @escaping  (Result<Data, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                completion(.failure(NSError(domain: "HTTP error", code: httpResponse.statusCode)))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data returned", code: 0)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }

}

