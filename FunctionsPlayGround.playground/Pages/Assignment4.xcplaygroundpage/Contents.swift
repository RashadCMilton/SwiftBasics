//: [Previous](@previous)

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true // allows playground to be asynchronous instead of synchronous
/*
    Result is an Enum with <Success, Failure> as well as Generic
    .failure hold Error value
    .sucess hold Data value
    URLSession is Apple API for network request
    .shared created a singleton insatnce (Same Across application, similar ton static)
    after executing on the URL, it executes the closure functions to ensure boundary checks
 */
func fetchData(from urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
        return
    }
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        if let httpResponse = response as? HTTPURLResponse{
            print("Http Response status code: \(httpResponse.statusCode)")
        }
        // Safe unwraps data
        
        guard let data = data else {
            completion(.failure(NSError(domain: "No data returned", code: 0, userInfo: nil)))
            return
        }
        //completion(.failure(NSError(domain: "No data returned", code: 0, userInfo: nil)))
        completion(.success(data))
    }
    task.resume() // Starts the task after neccsary boundary checking
}
    
let apiUrl = "https://randomuser.me/api/" // Public api that gives random users
fetchData(from: apiUrl) { result in
    switch result {
        // using let allows us to extract data or error inside switch statement
    case .success(let data):
        // option[] allows for diffrent configurantion
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
            print("Random JSON: \(json)")
        }
        print("Data: \(String(data: data, encoding: .utf8) ?? "No data returned")")
    case .failure(let error):
        print("Error: \(error.localizedDescription)")
    }
}
